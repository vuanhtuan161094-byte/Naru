extends RefCounted
var actors: Array[Dictionary] = []
var registry
var outcome = ""
var counts: Dictionary = {}
var ticks = 0
var log: Array[String] = []
var rng = RandomNumberGenerator.new()
var projectiles: Array[Dictionary]=[]
var next_uid=0
var last_progress_tick=0
var deadlock=false

func setup(reg,save,stage: Dictionary,seed_value: int) -> void:
	registry=reg
	rng.seed=seed_value
	for id in save.team:
		var p=save.owned[id]
		add_actor(id,0,int(p.level),int(p.quality),p.permanent,actors.size(),1.0,p)
	var j=0
	for id in stage.enemy_ids:
		var n=reg.npcs[id]
		add_actor(str(n.template_ninja_id),1,int(n.level),int(reg.ninjas[n.template_ninja_id].initial_quality)+int(n.quality_bonus),{},j,float(n.stat_multiplier))
		j+=1

func add_actor(id: String,side: int,level: int,quality: int,permanent: Dictionary,slot: int,mult: float,progress: Dictionary={}) -> void:
	var n=registry.ninjas[id]
	var quality_growth=[1.0,1.06,1.12,1.18,1.25,1.32,1.4,1.48][clampi(quality,1,8)-1]
	var allocated=progress.get("allocated",{})
	var strength=float(n.base_stats.strength)+float(n.level_growth.strength)*(level-1)*quality_growth+float(permanent.get("strength",0))+float(allocated.get("strength",0))
	var vit=float(n.base_stats.vitality)+float(n.level_growth.vitality)*(level-1)*quality_growth+float(permanent.get("vitality",0))+float(allocated.get("vitality",0))
	var intellect=float(n.base_stats.intellect)+float(n.level_growth.intellect)*(level-1)*quality_growth+float(permanent.get("intellect",0))+float(allocated.get("intellect",0))
	var spirit=float(n.base_stats.spirit)+float(n.level_growth.spirit)*(level-1)*quality_growth+float(permanent.get("spirit",0))+float(allocated.get("spirit",0))
	var star_multiplier=1.0+0.04*(int(progress.get("stars",1))-1)
	mult*=star_multiplier
	var hp=(250+18*vit+5*level)*mult
	next_uid+=1
	actors.append({"uid":next_uid,"summon":false,"owner":0,"ttl":0.0,"statuses":{},"immune":0.0,"counter":{},"stance":{},"element":str(n.chakra_elements[0]) if not n.chakra_elements.is_empty() else "neutral","last_element":"","element_tick":-1000,"reaction_tick":-1000,"id":id,"side":side,"hp":hp,"max_hp":hp,"patk":(20+3*strength+1.5*level)*mult,"natk":(20+3*intellect+1.5*level)*mult,"armor":10+2*vit,"nres":10+2*spirit,"chakra":0.0,"max_chakra":100+3*spirit,"regen":2+0.04*spirit,"pos":Vector2(1.0 if side==0 else 10.0,1.0+slot*1.2),"cooldowns":{},"busy":0.0,"stun":0.0,"shield":0.0,"shield_time":0.0,"skills":n.skills.duplicate(),"last":"","quality":quality,"realm":int(progress.get("realm",floori(float(level-1)/20.0))),"pending":{},"cast_left":0.0})

func alive(side: int) -> Array:
	return actors.filter(func(a): return int(a.side)==side and float(a.hp)>0.0)

func target_for(a: Dictionary,skill: Dictionary) -> Dictionary:
	var kind=str(skill.target)
	if kind=="self": return a
	var candidates=alive(int(a.side) if kind.begins_with("ally") else 1-int(a.side))
	var best: Dictionary={}
	var score=INF
	for b in candidates:
		var v=float(b.hp)/float(b.max_hp) if kind.begins_with("ally") else a.pos.distance_to(b.pos)
		if v<score:
			best=b
			score=v
	return best


func magnitude(a: Dictionary,id: String) -> float:
	var value=0.0
	for item in a.statuses.values():
		if item.id==id: value=maxf(value,float(item.magnitude))
	return value

func has_status(a: Dictionary,id: String) -> bool:
	for item in a.statuses.values():
		if item.id==id: return true
	return false

func hard_block(a: Dictionary) -> bool:
	return has_status(a,"stun") or has_status(a,"freeze") or has_status(a,"fear") or has_status(a,"shock")

func supported(skill: Dictionary) -> bool:
	for effect in skill.effects:
		# Form unlock and activation belong to the progression batch.
		if effect.type=="activate_form": return false
		if not str(effect.type) in ["damage","heal","shield","apply_status","cleanse","chakra_restore","dash","summon","temporary_stance","counter"]: return false
		if effect.type=="apply_status" and not registry.status_catalog.has(effect.status_id): return false
	return true

func ready(a: Dictionary,s: Dictionary) -> bool:
	if not supported(s) or not a.pending.is_empty() or a.busy>0 or hard_block(a): return false
	if has_status(a,"silence") and s.damage_type!="physical": return false
	return a.chakra>=float(s.chakra) and float(a.cooldowns.get(s.skill_id,0))<=0

func actor_by_uid(uid: int) -> Dictionary:
	for a in actors:
		if int(a.uid)==uid:return a
	return {}

func summon_count(a: Dictionary,skill_id: String) -> int:
	var count=0
	for b in actors:
		if b.summon and b.hp>0 and b.owner==a.uid and b.get("summon_skill","")==skill_id: count+=1
	return count

func utility(a: Dictionary,s: Dictionary,b: Dictionary) -> float:
	if b.is_empty() or a.pos.distance_to(b.pos)>float(s.range_m)+0.1:return -INF
	var score=0.0
	for e in s.effects:
		match str(e.type):
			"damage": score+=float(e.coefficient)*20.0*targets_for(a,s,b).size()
			"heal": score+=minf(1.0-float(b.hp)/float(b.max_hp),1.0)*100.0 if b.hp<b.max_hp*0.8 else -100.0
			"shield": score+=25.0 if b.shield<=0 else -30.0
			"cleanse": score+=35.0 if not b.statuses.is_empty() else -100.0
			"apply_status": score+=12.0 if not has_status(b,str(e.status_id)) else 0.0
			"summon": score+=32.0 if summon_count(a,s.skill_id)<int(e.cap) else -100.0
			"chakra_restore":score+=12.0 if a.chakra<a.max_chakra*0.7 else -20.0
			"temporary_stance":score+=22.0 if a.stance.is_empty() else -50.0
			"counter":score+=18.0 if a.counter.is_empty() else -50.0
			"dash":score+=5.0
	score+=float(s.ai.base_priority)*2.0-float(s.chakra)*0.3
	if s.kind=="auto" and a.side==0:
		var ultimate_skill=registry.skills[a.skills[5]]
		if a.chakra>=ultimate_skill.chakra and a.chakra-s.chakra<ultimate_skill.chakra: score-=35.0
	return score

func cast(a: Dictionary,s: Dictionary,b: Dictionary) -> bool:
	if not ready(a,s) or utility(a,s,b)<=0:return false
	a.chakra=float(a.chakra)-float(s.chakra)
	a.cooldowns[s.skill_id]=float(s.cooldown_s)
	a.busy=float(s.cast_s)+float(s.recovery_s)
	a.last=str(registry.names[s.skill_id].name_vi)
	a.pending={"skill":s,"target_uid":b.uid}
	a.cast_left=float(s.cast_s)
	return true

func targets_for(a: Dictionary,s: Dictionary,b: Dictionary) -> Array:
	if s.shape=="single" or s.shape=="self":return [b]
	var candidates=alive(int(b.side))
	var result: Array=[b]
	var direction: Vector2=b.pos-a.pos
	for target in candidates:
		if target.uid==b.uid:continue
		var include=false
		if s.shape=="circle": include=target.pos.distance_to(b.pos)<=float(s.radius_m)
		elif s.shape=="line" and direction.length()>0:
			var offset: Vector2=target.pos-a.pos
			var projection=offset.dot(direction.normalized())
			include=projection>=0 and projection<=float(s.range_m) and absf(offset.cross(direction.normalized()))<=float(s.line_width_m)*0.5
		if include and result.size()<int(s.max_targets):result.append(target)
	return result

func apply_status(a: Dictionary,b: Dictionary,e: Dictionary) -> void:
	var id=str(e.status_id)
	if not registry.status_catalog.has(id):return
	var rule=registry.status_catalog[id]
	if rule.hard_control and b.immune>0:return
	if rng.randf()>float(e.get("chance",1.0)):return
	var key=id+":"+str(a.uid) if rule.stack=="per_source" else id
	if not b.statuses.has(key) and rule.stack=="per_source":
		var count=0
		for item in b.statuses.values():
			if item.id==id:count+=1
		if count>=int(rule.max_stacks):return
	b.statuses[key]={"id":id,"remaining":float(e.get("duration_s",rule.duration_s)),"magnitude":float(e.get("magnitude",0.2)),"dot":float(e.get("tick_coefficient",0.0))*float(a.natk),"next_tick":1.0}

func hit(a: Dictionary,b: Dictionary,dmg: float,allow_counter: bool=true) -> void:
	var blocked=minf(float(b.shield),dmg)
	b.shield=float(b.shield)-blocked
	var old=float(b.hp)
	b.hp=maxf(0.0,float(b.hp)-dmg+blocked)
	if old-b.hp>0.01:last_progress_tick=ticks
	if allow_counter and b.hp>0 and b.side!=a.side and not b.counter.is_empty():
		var counter=b.counter
		b.counter={}
		hit(b,a,float(b.patk)*float(counter.coefficient)*100.0/(100.0+float(a.armor)),false)

func reaction(a: Dictionary,b: Dictionary,element: String) -> float:
	var value=1.0
	if ticks-int(b.element_tick)<=40 and ticks-int(b.reaction_tick)>=40:
		for r in registry.reactions:
			if element!=b.last_element and element in r.elements and b.last_element in r.elements:
				value=float(r.multiplier)
				b.reaction_tick=ticks
				if r.status_id!=null:apply_status(a,b,{"status_id":r.status_id,"chance":1.0})
				break
	b.last_element=element
	b.element_tick=ticks
	return value

func summon_actor(a: Dictionary,s: Dictionary,e: Dictionary) -> void:
	var count=summon_count(a,s.skill_id)
	if count>=int(e.cap):return
	var b=a.duplicate(true)
	next_uid+=1
	b.uid=next_uid
	b.id=str(e.template_id)
	b.summon=true
	b.owner=a.uid
	b.summon_skill=s.skill_id
	b.ttl=float(e.lifetime_s)
	b.hp=float(a.max_hp)*float(e.hp_owner_fraction)
	b.max_hp=b.hp
	b.patk=float(a.patk)*float(e.attack_owner_fraction)
	b.natk=float(a.natk)*float(e.attack_owner_fraction)
	b.skills=[a.skills[0]]
	b.pos=a.pos+Vector2(0.3,0.5)
	b.pending={}
	b.busy=0.0
	b.statuses={}
	b.cooldowns={}
	b.counter={}
	b.stance={}
	b.shield=0.0
	b.chakra=0.0
	actors.append(b)

func release(a: Dictionary,s: Dictionary,b: Dictionary) -> void:
	if b.is_empty() or b.hp<=0:return
	for target in targets_for(a,s,b):
		for e in s.effects:
			match str(e.type):
				"damage":
					var physical=str(e.damage_type)=="physical"
					var stat="patk" if physical else "natk"
					var attack=float(a[stat])*(1.0+magnitude(a,"attack_up"))
					if not a.stance.is_empty() and a.stance.stat==stat:attack*=float(a.stance.multiplier)
					var defense=float(target.armor if physical else target.nres)*(1.0+magnitude(target,"defense_up"))
					var realm_factor=clampf(1.0+0.04*(int(a.realm)-int(target.realm)),0.75,1.25)
					var element_factor=float(registry.affinity.get(str(s.element)+":"+str(target.element),1.0))*reaction(a,target,str(s.element))
					var hit_rate=clampf(0.85+magnitude(a,"accuracy_up")-magnitude(a,"blind")-magnitude(a,"steam")-magnitude(target,"evasion"),0.15,0.99)
					if rng.randf()<hit_rate:
						var crit=1.5 if e.damage_type!="genjutsu" and rng.randf()<0.05 else 1.0
						hit(a,target,maxf(1.0,round(attack*float(e.coefficient)*100.0/(100.0+defense)*realm_factor*element_factor*crit)))
				"heal":target.hp=minf(float(target.max_hp),float(target.hp)+float(a.natk)*float(e.coefficient)*(1.0-clampf(magnitude(target,"antiheal"),0.0,0.9)))
				"shield":
					target.shield=maxf(float(target.shield),float(a.natk)*float(e.coefficient))
					target.shield_time=maxf(float(target.shield_time),float(e.duration_s))
				"apply_status":apply_status(a,target,e)
				"cleanse":
					var keys=target.statuses.keys()
					keys.sort_custom(func(x,y):return float(target.statuses[x].remaining)>float(target.statuses[y].remaining))
					var count=0
					for key in keys:
						if registry.status_catalog[target.statuses[key].id].dispellable:
							target.statuses.erase(key)
							count+=1
							if count>=int(e.max_statuses):break
				"chakra_restore":a.chakra=minf(float(a.max_chakra),float(a.chakra)+float(e.amount))
				"dash":a.pos=a.pos.move_toward(target.pos,minf(float(e.max_distance_m),maxf(0.0,a.pos.distance_to(target.pos)-float(e.stop_distance_m))))
				"summon":summon_actor(a,s,e)
				"temporary_stance":a.stance={"remaining":float(e.duration_s),"stat":e.stat,"multiplier":e.multiplier}
				"counter":a.counter={"remaining":float(e.window_s),"coefficient":e.coefficient}
	if int(a.side)==0 and not a.summon:counts[a.id]=int(counts.get(a.id,0))+1
	log.append(str(a.id)+" · "+str(registry.names[s.skill_id].name_vi))
	if log.size()>6:log.pop_front()

func ultimate(index: int) -> bool:
	if index<0 or index>=actors.size():return false
	var a=actors[index]
	if a.side!=0 or a.hp<=0 or a.summon:return false
	var s=registry.skills[a.skills[5]]
	return cast(a,s,target_for(a,s))

func update_status(a: Dictionary,dt: float) -> void:
	a.immune=maxf(0.0,float(a.immune)-dt)
	for key in a.statuses.keys():
		var st=a.statuses[key]
		st.remaining=float(st.remaining)-dt
		if st.dot>0:
			st.next_tick=float(st.next_tick)-dt
			if st.next_tick<=0:
				st.next_tick=1.0
				hit(a,a,float(st.dot),false)
		if st.remaining<=0:
			if registry.status_catalog[st.id].hard_control:a.immune=2.0
			a.statuses.erase(key)
	for key in ["stance","counter"]:
		if not a[key].is_empty():
			a[key].remaining=float(a[key].remaining)-dt
			if a[key].remaining<=0:a[key]={}

func primary_alive(side: int) -> Array:
	return alive(side).filter(func(a):return not a.summon)

func tick(dt: float) -> void:
	if not outcome.is_empty():return
	ticks+=1
	for p in projectiles.duplicate():
		p.remaining=float(p.remaining)-dt
		if p.remaining<=0:
			projectiles.erase(p)
			var source=actor_by_uid(int(p.source))
			if not source.is_empty():release(source,p.skill,actor_by_uid(int(p.target)))
	for a in actors.duplicate():
		if a.summon:
			a.ttl=float(a.ttl)-dt
			var owner=actor_by_uid(int(a.owner))
			if a.ttl<=0 or owner.is_empty() or owner.hp<=0:a.hp=0
		if a.hp<=0:
			a.pending={}
			continue
		update_status(a,dt)
		if a.hp<=0:continue
		a.busy=maxf(0.0,float(a.busy)-dt)
		a.shield_time=maxf(0.0,float(a.shield_time)-dt)
		if a.shield_time<=0:a.shield=0.0
		a.chakra=minf(float(a.max_chakra),float(a.chakra)+float(a.regen)*dt*(1.0+magnitude(a,"chakra_up"))*(1.0-clampf(magnitude(a,"chakra_lock"),0.0,0.9)))
		for id in a.cooldowns:a.cooldowns[id]=maxf(0.0,float(a.cooldowns[id])-dt)
		if not a.pending.is_empty():
			var pending=a.pending
			var skill=pending.skill
			if (hard_block(a) or (has_status(a,"silence") and skill.damage_type!="physical")) and skill.interruptible:
				a.chakra=minf(float(a.max_chakra),float(a.chakra)+0.8*float(skill.chakra))
				a.cooldowns[skill.skill_id]=float(skill.cooldown_s)*0.5
				a.pending={}
				a.busy=0.0
			else:
				a.cast_left=float(a.cast_left)-dt
				if a.cast_left<=0:
					a.pending={}
					var target=actor_by_uid(int(pending.target_uid))
					if not target.is_empty() and target.hp>0:
						if float(skill.projectile_speed_m_s)>0 and target.uid!=a.uid:
							projectiles.append({"source":a.uid,"target":target.uid,"skill":skill,"remaining":a.pos.distance_to(target.pos)/float(skill.projectile_speed_m_s)})
						else:release(a,skill,target)
				else:continue
		if a.busy>0 or hard_block(a):continue
		var basic=registry.skills[a.skills[0]]
		var enemy=target_for(a,basic)
		if enemy.is_empty():continue
		var best={}
		var best_target={}
		var best_score=0.0
		for id in a.skills:
			var s=registry.skills[id]
			if s.kind=="ultimate" or not ready(a,s):continue
			var b=target_for(a,s)
			var score=utility(a,s,b)
			if score>best_score:
				best=s
				best_target=b
				best_score=score
		if not best.is_empty():cast(a,best,best_target)
		elif not has_status(a,"bind") and a.pos.distance_to(enemy.pos)>float(basic.range_m):
			var speed=2.2*(1.0+magnitude(a,"haste"))*(1.0-clampf(maxf(magnitude(a,"slow"),magnitude(a,"mud")),0.0,0.8))
			a.pos=a.pos.move_toward(enemy.pos,speed*dt)
	# Remove dead temporary entities only once their launched projectiles resolve.
	for a in actors.duplicate():
		if a.summon and a.hp<=0 and not projectiles.any(func(p):return p.source==a.uid):actors.erase(a)
	deadlock=ticks-last_progress_tick>=2400
	if primary_alive(1).is_empty():outcome="win"
	elif primary_alive(0).is_empty():outcome="loss"
