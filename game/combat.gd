extends RefCounted
const Stats=preload("res://game/stats_service.gd")
var mastery_counts: Dictionary={}
var combo_clock: Dictionary={}
var signature_ticks: Dictionary={}
var boss_phases: Dictionary={}
var boss_actor_uid=0
var environment="clear"
var elemental_fields: Array[Dictionary]=[]
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
var auto_player_ultimate=false
var encounter_skills: Dictionary={}
var encounter_names: Dictionary={}
var effect_dispatch_count=0

func setup(reg,save,stage: Dictionary,seed_value: int) -> void:
	registry=reg
	rng.seed=seed_value
	var kind=str(reg.territories.get(stage.get("territory_id",""),{}).get("kind",""))
	if kind in ["forest","desert","cave"]:environment=kind
	for id in save.team:
		var p=save.owned[id]
		var progress=p.duplicate(true)
		progress.beast_level=int(save.get("beasts",{}).get(p.get("beast_id",""),{}).get("level",0))
		progress.contract_level=int(save.get("summon_contracts",{}).get(p.get("summon_contract",""),{}).get("level",0))
		add_actor(id,0,int(p.level),int(p.quality),p.permanent,actors.size(),1.0,progress,save.get("gear_instances",{}))
	var j=0
	for id in stage.enemy_ids:
		var n=reg.npcs[id]
		add_actor(str(n.template_ninja_id),1,int(n.level),int(reg.ninjas[n.template_ninja_id].initial_quality)+int(n.quality_bonus),{},j,float(n.stat_multiplier))
		if stage.get("boss_id")!=null and registry.bosses.has(stage.boss_id) and registry.bosses[stage.boss_id].primary_enemy_id==id:
			boss_actor_uid=int(actors.back().uid)
			boss_phases={"rule":registry.boss_rules[stage.boss_id],"fired":{},"priority":[]}
		j+=1

func add_actor(id: String,side: int,level: int,quality: int,permanent: Dictionary,slot: int,mult: float,progress: Dictionary={},gear_instances: Dictionary={}) -> void:
	var n=registry.ninjas[id]
	var quality_growth=[1.0,1.06,1.12,1.18,1.25,1.32,1.4,1.48][clampi(quality,1,8)-1]
	var allocated=progress.get("allocated",{})
	var strength=float(n.base_stats.strength)+float(n.level_growth.strength)*(level-1)*quality_growth+float(permanent.get("strength",0))+float(allocated.get("strength",0))
	var vit=float(n.base_stats.vitality)+float(n.level_growth.vitality)*(level-1)*quality_growth+float(permanent.get("vitality",0))+float(allocated.get("vitality",0))
	var intellect=float(n.base_stats.intellect)+float(n.level_growth.intellect)*(level-1)*quality_growth+float(permanent.get("intellect",0))+float(allocated.get("intellect",0))
	var spirit=float(n.base_stats.spirit)+float(n.level_growth.spirit)*(level-1)*quality_growth+float(permanent.get("spirit",0))+float(allocated.get("spirit",0))
	var star_multiplier=1.0+0.04*(int(progress.get("stars",1))-1)
	mult*=star_multiplier
	var gear_stats={}
	var set_counts={}
	for gear_id in progress.get("gear",{}).values():
		if not gear_instances.has(gear_id):continue
		var item=gear_instances[gear_id]
		var def=registry.gear_templates[item.template_id]
		for affix in item.get("affixes",[]):gear_stats[affix.stat]=float(gear_stats.get(affix.stat,0))+float(affix.value)
		var set_id=str(item.get("set_id",""))
		if not set_id.is_empty():set_counts[set_id]=int(set_counts.get(set_id,0))+1
		var value=float(def.base_value)*(1+0.06*pow(float(item.enhance),0.85))*(1+0.025*pow(float(item.refine),0.8))*(1+0.1*pow(float(item.evolution),0.85))
		gear_stats[def.base_stat]=float(gear_stats.get(def.base_stat,0))+value
		for resource in item.gems:
			for gem in registry.gear_rules.socket.gems:
				if gem.resource_id==resource:gear_stats[gem.stat]=float(gear_stats.get(gem.stat,0))+float(gem.rating_add)
	var stat_progress=progress.duplicate(true)
	stat_progress.level=level
	stat_progress.quality=quality
	stat_progress.permanent=permanent
	var all_stats=Stats.derive(registry,n,stat_progress,gear_stats)
	for rule in registry.gear_rules.sets:
		var best={}
		for threshold in rule.thresholds:
			if int(set_counts.get(rule.id,0))>=int(threshold.pieces):best=threshold
		if not best.is_empty():all_stats[best.stat]*=float(best.multiplier)
	var beast_level=int(progress.get("beast_level",0))
	if beast_level>0:
		for key in ["hp","patk","natk","chakra_max"]:all_stats[key]*=1.0+0.03*sqrt(float(beast_level))
	var hp=float(all_stats.hp)*mult
	next_uid+=1
	actors.append({"uid":next_uid,"summon":false,"owner":0,"ttl":0.0,"statuses":{},"immune":0.0,"counter":{},"stance":{},"element":str(n.chakra_elements[0]) if not n.chakra_elements.is_empty() else "neutral","last_element":"","element_tick":-1000,"reaction_tick":-1000,"id":id,"side":side,"hp":hp,"max_hp":hp,"patk":float(all_stats.patk)*mult,"natk":float(all_stats.natk)*mult,"armor":all_stats.armor,"nres":all_stats.nres,"chakra":0.0,"max_chakra":all_stats.chakra_max,"regen":all_stats.chakra_regen,"pos":Vector2(1.0 if side==0 else 10.0,1.0+slot*1.2),"cooldowns":{},"busy":0.0,"stun":0.0,"shield":0.0,"shield_time":0.0,"shield_sources":{},"skills":n.skills.duplicate()+progress.get("unlocked_skills",[]),"skill_levels":progress.get("skill_levels",{}).duplicate(true),"gear_stats":gear_stats,"stats":all_stats,"forms":progress.get("forms",[]).duplicate(),"active_form":{},"form_cooldowns":{},"contract":progress.get("summon_contract",""),"contract_level":int(progress.get("contract_level",0)),"contract_cd":0.0,"last":"","quality":quality,"realm":int(progress.get("realm",floori(float(level-1)/20.0))),"pending":{},"cast_left":0.0})

func alive(side: int) -> Array:
	return actors.filter(func(a): return int(a.side)==side and float(a.hp)>0.0)

func target_for(a: Dictionary,skill: Dictionary) -> Dictionary:
	var kind=str(skill.target)
	if kind=="self": return a
	var candidates=alive(int(a.side) if kind.begins_with("ally") else 1-int(a.side))
	if not kind.begins_with("ally"):
		for st in a.statuses.values():
			if st.id=="taunt":
				var forced=actor_by_uid(int(st.get("source",0)))
				if not forced.is_empty() and forced.hp>0 and forced.side!=a.side:return forced
	var best: Dictionary={}
	var score=INF
	for b in candidates:
		var v=float(b.hp)/float(b.max_hp) if kind.begins_with("ally") else a.pos.distance_to(b.pos)
		if not kind.begins_with("ally") and has_status(b,"mark"):v*=0.7
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
		if effect.type=="activate_form" and not registry.form_rules.has(effect.form_id):return false
		if not str(effect.type) in ["damage","heal","shield","apply_status","cleanse","chakra_restore","dash","summon","temporary_stance","counter","activate_form"]: return false
		if effect.type=="apply_status" and not registry.status_catalog.has(effect.status_id): return false
	return true

func ready(a: Dictionary,s: Dictionary) -> bool:
	if not supported(s) or not a.pending.is_empty() or a.busy>0 or hard_block(a): return false
	if has_status(a,"silence") and s.damage_type!="physical": return false
	for e in s.effects:
		if e.type=="activate_form" and not form_ready(a,str(e.form_id),false,str(s.skill_id)):return false
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

func rating(a: Dictionary,key: String) -> float:
	return Stats.effect(registry,a.stats,key)*form_multiplier(a,key)

func effective_skill(a: Dictionary,id: String) -> Dictionary:
	var base=skill_definition(id)
	if a.summon:return base
	var p=a.skill_levels.get(id,{"level":1,"grade":1,"branch":""})
	var s=base.duplicate(true)
	s.chakra=maxf(0.0,float(s.chakra)*(1.0-rating(a,"chakra_efficiency")))
	s.cooldown_s=float(s.cooldown_s)*(1.0-rating(a,"cdr"))
	s.cast_s=float(s.cast_s)/(1.0+rating(a,"cast_speed"))
	s.radius_m=float(s.radius_m)*(1.0+rating(a,"area"))
	s.line_width_m=float(s.line_width_m)*(1.0+rating(a,"area"))
	var factor=(1+0.02*(int(p.level)-1))*(1+0.12*(int(p.grade)-1))
	if str(p.branch).ends_with("-B1"):factor*=1.12
	if str(p.branch).ends_with("-B2"):
		s.radius_m=float(s.radius_m)*1.15
		s.line_width_m=float(s.line_width_m)*1.15
		if s.shape in ["line","circle"]:s.max_targets=ceili(float(s.max_targets)*1.15)
	if not a.active_form.is_empty():
		for empowered in registry.form_rules[a.active_form.id].empowered_skills:
			if empowered.skill_id==id:factor*=float(empowered.coefficient_multiplier)
	for e in s.effects:
		if e.has("coefficient"):e.coefficient=float(e.coefficient)*factor
	return s

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
			"activate_form":score+=45.0
	score+=float(s.ai.base_priority)*2.0-float(s.chakra)*0.3
	if s.kind=="auto" and a.side==0 and not auto_player_ultimate and a.skills.size()>5:
		var ultimate_skill=effective_skill(a,a.skills[5])
		if a.chakra>=ultimate_skill.chakra and a.chakra-s.chakra<ultimate_skill.chakra: score-=35.0
	return score

func cast(a: Dictionary,s: Dictionary,b: Dictionary) -> bool:
	if not ready(a,s) or utility(a,s,b)<=0:return false
	a.chakra=float(a.chakra)-float(s.chakra)
	a.cooldowns[s.skill_id]=float(s.cooldown_s)
	a.busy=float(s.cast_s)+float(s.recovery_s)/(1.0+rating(a,"attack_speed"))
	a.last=skill_name(s.skill_id)
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
	if rule.hard_control and (b.immune>0 or has_status(b,"control_immunity")):return
	var chance=float(e.get("chance",1.0))
	if rule.hard_control and chance<1.0:chance=clampf(chance*(1.0+rating(a,"control_chance"))*(1.0-rating(b,"control_resist")),0.0,0.95)
	if rng.randf()>chance:return
	var key=id+":"+str(a.uid) if rule.stack=="per_source" else id
	if not b.statuses.has(key) and rule.stack=="per_source":
		var count=0
		for item in b.statuses.values():
			if item.id==id:count+=1
		if count>=int(rule.max_stacks):return
	var duration=float(e.get("duration_s",rule.duration_s))
	if rule.hard_control:duration*=clampf((1.0+rating(a,"control_duration"))*(1.0-rating(b,"control_resist")),0.3,1.8)
	var mag=float(e.get("magnitude",0.2))
	if rule.stack=="max" and b.statuses.has(key):
		duration=maxf(duration,float(b.statuses[key].remaining))
		mag=maxf(mag,float(b.statuses[key].magnitude))
	b.statuses[key]={"id":id,"source":a.uid,"remaining":duration,"magnitude":mag,"dot":float(e.get("tick_coefficient",0.0))*float(a.natk),"next_tick":1.0}

func hit(a: Dictionary,b: Dictionary,dmg: float,allow_counter: bool=true) -> void:
	var blocked=minf(float(b.shield),dmg)
	var remaining=blocked
	for key in b.shield_sources.keys():
		var layer=b.shield_sources[key]
		var used=minf(remaining,float(layer.hp))
		layer.hp=float(layer.hp)-used
		remaining-=used
		if layer.hp<=0:b.shield_sources.erase(key)
		if remaining<=0:break
	b.shield=float(b.shield)-blocked
	var old=float(b.hp)
	b.hp=maxf(0.0,float(b.hp)-dmg+blocked)
	if old-b.hp>0.01:
		last_progress_tick=ticks
		if a.uid!=b.uid:a.hp=minf(float(a.max_hp),float(a.hp)+(old-b.hp)*rating(a,"lifesteal"))
	if allow_counter and b.hp>0 and b.side!=a.side and a.hp>0 and not hard_block(b):
		if not b.counter.is_empty():
			var counter=b.counter
			b.counter={}
			hit(b,a,float(b.patk)*float(counter.coefficient)*100.0/(100.0+float(a.armor)),false)
		elif a.pos.distance_to(b.pos)<=1.8 and rng.randf()<rating(b,"counter")*0.25:
			hit(b,a,float(b.patk)*0.25*100.0/(100.0+float(a.armor)),false)

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
	b["beast"]=false
	b.immune=0.0
	b.shield_time=0.0
	b.contract_cd=0.0
	b.summon=true
	b.owner=a.uid
	b.summon_skill=s.skill_id
	b.ttl=float(e.lifetime_s)
	b.hp=float(a.max_hp)*float(e.hp_owner_fraction)
	b.max_hp=b.hp
	b.patk=float(a.patk)*float(e.attack_owner_fraction)
	b.natk=float(a.natk)*float(e.attack_owner_fraction)
	b.skills=[a.skills[0]]
	b.skill_levels={}
	b.gear_stats={}
	b.forms=[]
	b.contract=""
	b.contract_level=0
	b.active_form={}
	b.form_cooldowns={}
	b.pos=a.pos+Vector2(0.3,0.5)
	b.pending={}
	b.busy=0.0
	b.statuses={}
	b.cooldowns={}
	b.counter={}
	b.stance={}
	b.shield=0.0
	b.shield_sources={}
	b.chakra=0.0
	actors.append(b)

func release(a: Dictionary,s: Dictionary,b: Dictionary) -> void:
	if b.is_empty() or b.hp<=0:return
	var field_factor=spatial_reaction(a,s,b)
	for target in targets_for(a,s,b):
		for e in s.effects:
			effect_dispatch_count+=1
			match str(e.type):
				"damage":
					var physical=str(e.damage_type)=="physical"
					var stat="patk" if physical else "natk"
					var attack=float(a[stat])*(1.0+magnitude(a,"attack_up"))*form_multiplier(a,stat)
					if e.damage_type=="genjutsu":attack=float(a.stats.genjutsu_power)*form_multiplier(a,"genjutsu_power")
					if not a.stance.is_empty() and a.stance.stat==stat:attack*=float(a.stance.multiplier)
					var defense=maxf(0.0,float(target.armor if physical else target.nres)*(1.0+magnitude(target,"defense_up"))-float(a.stats.get("armor_pen" if physical else "magic_pen",0)))
					if e.damage_type=="genjutsu":defense=float(target.stats.genjutsu_resist)
					var realm_factor=clampf(1.0+0.04*(int(a.realm)-int(target.realm)),0.75,1.25)
					var element_factor=float(registry.affinity.get(str(s.element)+":"+str(target.element),1.0))*maxf(field_factor,reaction(a,target,str(s.element)) if field_factor==1.0 else 1.0)*float(registry.environments.get(environment,{}).get("modifiers",{}).get(s.element,1.0))
					if s.element!="neutral":element_factor*=1.0+rating(a,"element_power")
					var hit_rate=clampf(0.85+(rating(a,"accuracy")-rating(target,"evasion"))/(200.0+absf(rating(a,"accuracy")-rating(target,"evasion")))+magnitude(a,"accuracy_up")-magnitude(a,"blind")-magnitude(a,"steam")-magnitude(target,"evasion"),0.15,0.99)
					if rng.randf()<hit_rate:
						if s.kind!="basic" and a.side!=target.side:
							var drain=minf(float(target.chakra),float(s.chakra)*rating(a,"chakra_drain")*(1.0-rating(target,"chakra_drain_resist")))
							target.chakra=float(target.chakra)-drain
							a.chakra=minf(float(a.max_chakra),float(a.chakra)+drain*rating(a,"chakra_conversion"))
						var crit=1.5+rating(a,"crit_damage") if e.damage_type!="genjutsu" and rng.randf()<maxf(0.0,rating(a,"pcrit" if physical else "ncrit")-rating(target,"crit_resist")) else 1.0
						hit(a,target,maxf(1.0,round(attack*float(e.coefficient)*100.0/(100.0+defense)*realm_factor*element_factor*crit*(1.0-minf(0.65,rating(target,"damage_reduction"))))))
				"heal":target.hp=minf(float(target.max_hp),float(target.hp)+float(a.natk)*float(e.coefficient)*(1.0+rating(a,"healing"))*(1.0-clampf(magnitude(target,"antiheal"),0.0,0.9)))
				"shield":
					add_shield(a,target,float(a.natk)*float(e.coefficient),float(e.duration_s))
				"apply_status":apply_status(a,target,e)
				"cleanse":
					var keys=target.statuses.keys()
					keys.sort_custom(func(x,y):return float(target.statuses[x].remaining)>float(target.statuses[y].remaining))
					var count=0
					for key in keys:
						if registry.status_catalog[target.statuses[key].id].dispellable and target.statuses[key].id in ["stun","bind","silence","slow","blind","burn","poison","wet","freeze","shock","mark","chakra_lock","taunt","antiheal","fear","mud","steam"]:
							target.statuses.erase(key)
							count+=1
							if count>=int(e.max_statuses)+(1 if rng.randf()<rating(a,"cleanse") else 0):break
				"chakra_restore":a.chakra=minf(float(a.max_chakra),float(a.chakra)+float(e.amount))
				"dash":a.pos=a.pos.move_toward(target.pos,minf(float(e.max_distance_m),maxf(0.0,a.pos.distance_to(target.pos)-float(e.stop_distance_m))))
				"summon":summon_actor(a,s,e)
				"temporary_stance":a.stance={"remaining":float(e.duration_s),"stat":e.stat,"multiplier":e.multiplier}
				"counter":a.counter={"remaining":float(e.window_s),"coefficient":e.coefficient}
				"activate_form":activate_form(a,str(e.form_id),false,str(s.skill_id))
	if int(a.side)==0 and not a.summon:
		counts[a.id]=int(counts.get(a.id,0))+1
		mastery_counts[s.skill_id]=int(mastery_counts.get(s.skill_id,0))+maxi(1,roundi(1.0+rating(a,"mastery_speed")))
	if not a.summon and not a.get("beast",false) and registry.ninjas.has(a.id) and registry.ninjas[a.id].unique_talent_design.skill_id==s.skill_id:
		signature_ticks[str(a.side)+":"+str(a.id)]=ticks
		try_combo(a)
	log.append(str(a.id)+" · "+skill_name(s.skill_id))
	if log.size()>6:log.pop_front()

func ultimate(index: int) -> bool:
	if index<0 or index>=actors.size():return false
	var a=actors[index]
	if a.side!=0 or a.hp<=0 or a.summon or a.skills.size()<6:return false
	var s=effective_skill(a,a.skills[5])
	return cast(a,s,target_for(a,s))

func update_status(a: Dictionary,dt: float) -> void:
	a.immune=maxf(0.0,float(a.immune)-dt)
	a.contract_cd=maxf(0.0,float(a.contract_cd)-dt)
	for id in a.form_cooldowns:a.form_cooldowns[id]=maxf(0.0,float(a.form_cooldowns[id])-dt)
	if not a.active_form.is_empty():
		a.active_form.remaining=float(a.active_form.remaining)-dt
		if a.active_form.remaining<=0:a.active_form={}
	for id in a.forms:
		var rule=registry.form_rules[id]
		if rule.activation=="hp_threshold_or_manual" and a.hp/a.max_hp<=float(rule.hp_threshold):activate_form(a,id,true)
	a.hp=minf(float(a.max_hp),float(a.hp)+float(a.stats.get("hp_regen",0))*dt)
	var expired=0.0
	for key in a.shield_sources.keys():
		var layer=a.shield_sources[key]
		layer.remaining=float(layer.remaining)-dt
		if layer.remaining<=0:
			expired+=float(layer.hp)
			a.shield_sources.erase(key)
	a.shield=maxf(0.0,float(a.shield)-expired)
	for key in a.statuses.keys():
		var st=a.statuses[key]
		st.remaining=float(st.remaining)-dt
		if st.dot>0:
			st.next_tick=float(st.next_tick)-dt
			if st.next_tick<=0:
				st.next_tick=1.0
				var source=actor_by_uid(int(st.get("source",0)))
				hit(a if source.is_empty() else source,a,float(st.dot),false)
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
	for zone in elemental_fields.duplicate():
		if int(zone.expires)<=ticks:elemental_fields.erase(zone)
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
		if a.uid==boss_actor_uid:update_boss(a)
		a.busy=maxf(0.0,float(a.busy)-dt)
		a.shield_time=maxf(0.0,float(a.shield_time)-dt)
		if a.shield_time<=0 and a.shield_sources.is_empty():a.shield=0.0
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
		var basic=skill_definition(a.skills[0])
		var enemy=target_for(a,basic)
		if enemy.is_empty():continue
		var best={}
		var best_target={}
		var best_score=0.0
		if a.uid==boss_actor_uid and not boss_phases.priority.is_empty():
			var skill_id=str(boss_phases.priority[0])
			var priority_skill=effective_skill(a,skill_id)
			if cast(a,priority_skill,target_for(a,priority_skill)):
				boss_phases.priority.pop_front()
				continue
		for id in a.skills:
			var s=effective_skill(a,id)
			if (s.kind=="ultimate" and a.side==0 and not auto_player_ultimate) or not ready(a,s):continue
			var b=target_for(a,s)
			var score=utility(a,s,b)
			if score>best_score:
				best=s
				best_target=b
				best_score=score
		if not best.is_empty():cast(a,best,best_target)
		elif not has_status(a,"bind") and a.pos.distance_to(enemy.pos)>float(basic.range_m):
			var speed=2.2*(1.0+rating(a,"move_speed"))*(1.0+magnitude(a,"haste"))*(1.0-clampf(maxf(magnitude(a,"slow"),magnitude(a,"mud")),0.0,0.8))
			a.pos=a.pos.move_toward(enemy.pos,speed*dt)
	# Remove dead temporary entities only once their launched projectiles resolve.
	for a in actors.duplicate():
		if a.summon and a.hp<=0 and not projectiles.any(func(p):return p.source==a.uid):actors.erase(a)
	deadlock=ticks-last_progress_tick>=2400
	if primary_alive(1).is_empty():outcome="win"
	elif primary_alive(0).is_empty():outcome="loss"

func form_ready(a: Dictionary,id: String,manual: bool,trigger_id: String="") -> bool:
	if a.summon or a.hp<=0 or not id in a.forms or not a.active_form.is_empty():return false
	if float(a.form_cooldowns.get(id,0))>0:return false
	var rule=registry.form_rules[id]
	if not manual:return rule.activation=="skill_trigger" and trigger_id in rule.trigger_skill_ids
	return rule.activation!="skill_trigger" and a.chakra>=float(rule.manual_chakra) and not hard_block(a)

func activate_form(a: Dictionary,id: String,manual: bool,trigger_id: String="") -> bool:
	if not form_ready(a,id,manual,trigger_id):return false
	var rule=registry.form_rules[id]
	if manual:a.chakra=float(a.chakra)-float(rule.manual_chakra)
	a.active_form={"id":id,"remaining":float(rule.duration_s)}
	a.form_cooldowns[id]=float(rule.cooldown_s)
	return true

func form_multiplier(a: Dictionary,stat: String) -> float:
	if a.active_form.is_empty():return 1.0
	return float(registry.form_rules[a.active_form.id].stat_multipliers.get(stat,1.0))

func try_combo(a: Dictionary) -> void:
	for combo in registry.combos.values():
		if not a.id in combo.member_ids:continue
		var key=str(a.side)+":"+str(combo.id)
		if ticks-int(combo_clock.get(key,-100000))<int(combo.cooldown_s)*20:continue
		var members=[]
		for id in combo.member_ids:
			var member={}
			for b in primary_alive(int(a.side)):
				if b.id==id:member=b
			if member.is_empty() or ticks-int(signature_ticks.get(str(a.side)+":"+str(id),-100000))>80:break
			members.append(member)
		if members.size()!=combo.member_ids.size():continue
		combo_clock[key]=ticks
		var enemies=primary_alive(1-int(a.side))
		if enemies.is_empty():continue
		match str(combo.effect):
			"damage":hit(a,enemies[0],float(a.natk)*float(combo.coefficient)*100.0/(100.0+float(enemies[0].nres)))
			"control":apply_status(a,enemies[0],{"status_id":"bind","chance":0.8,"duration_s":3.0})
			"shield":
				for member in members:
					add_shield(a,member,float(a.natk)*float(combo.coefficient),5.0)
			"buff":
				for member in members:apply_status(a,member,{"status_id":"attack_up","chance":1.0,"duration_s":6.0,"magnitude":0.2})
		log.append(str(combo.name_vi))

func update_boss(a: Dictionary) -> void:
	if boss_phases.is_empty():return
	var rule=boss_phases.rule
	for i in range(rule.phases.size()):
		var phase=rule.phases[i]
		if boss_phases.fired.has(i) or a.hp/a.max_hp>float(phase.hp_at_or_below):continue
		boss_phases.fired[i]=true
		var modifier=phase.modifier
		a.chakra=minf(float(a.max_chakra),float(a.chakra)+float(modifier.get("chakra_restore",0)))
		if modifier.has("attack_multiplier"):apply_status(a,a,{"status_id":"attack_up","chance":1.0,"duration_s":modifier.duration_s,"magnitude":float(modifier.attack_multiplier)-1.0})
		if modifier.has("defense_multiplier"):apply_status(a,a,{"status_id":"defense_up","chance":1.0,"duration_s":modifier.duration_s,"magnitude":float(modifier.defense_multiplier)-1.0})
		var e=phase.mechanic_effect
		match str(e.type):
			"shield_self_fraction":
				add_shield(a,a,float(a.max_hp)*float(e.fraction_max_hp),float(e.duration_s))
			"apply_status_enemy":
				var enemies=primary_alive(1-int(a.side))
				for target in enemies.slice(0,int(e.max_targets)):apply_status(a,target,{"status_id":e.status_id,"chance":1.0,"duration_s":e.duration_s,"magnitude":e.magnitude})
			"apply_status_self":apply_status(a,a,{"status_id":e.status_id,"chance":1.0,"duration_s":e.duration_s,"magnitude":e.magnitude})
			"heal_self_fraction":a.hp=minf(float(a.max_hp),float(a.hp)+float(a.max_hp)*float(e.fraction))
			"summon_boss_minion":
				for n in range(int(e.count)):summon_actor(a,{"skill_id":str(rule.boss_id)+"-minion"},{"template_id":str(rule.boss_id)+"-MINION","cap":e.max_active,"lifetime_s":e.lifetime_s,"hp_owner_fraction":e.owner_hp_fraction,"attack_owner_fraction":e.owner_attack_fraction})
			"phase_burst":pass
		if phase.priority_skill_id in a.skills and not phase.priority_skill_id in boss_phases.priority:boss_phases.priority.append(phase.priority_skill_id)
		log.append("Boss: giai đoạn "+str(i+1))

func summon_contract(a: Dictionary) -> bool:
	if a.summon or a.hp<=0 or a.side!=0 or a.contract=="" or a.contract_cd>0 or a.chakra<30 or hard_block(a):return false
	var def=registry.contracts[a.contract]
	var key={"skill_id":str(a.contract)}
	if summon_count(a,a.contract)>0:return false
	a.chakra=float(a.chakra)-30
	a.contract_cd=40.0
	var factor=float(def.owner_stat_fraction)*(1+0.03*sqrt(float(a.contract_level)))
	summon_actor(a,key,{"template_id":a.contract,"cap":1,"lifetime_s":def.battle_lifetime_seconds,"hp_owner_fraction":factor,"attack_owner_fraction":factor})
	return true

func add_shield(a: Dictionary,b: Dictionary,amount: float,duration: float) -> void:
	var key=str(a.uid)
	var old=b.shield_sources.get(key,{"hp":0.0,"remaining":0.0})
	var value=maxf(amount,float(old.hp))
	b.shield=float(b.shield)+value-float(old.hp)
	b.shield_sources[key]={"hp":value,"remaining":maxf(duration,float(old.remaining))}
	b.shield_time=maxf(float(b.shield_time),duration)

func spatial_reaction(a: Dictionary,s: Dictionary,b: Dictionary) -> float:
	var element=str(s.element)
	if element=="neutral":return 1.0
	var radius=maxf(0.4,float(s.radius_m))
	if s.shape=="line":radius=maxf(radius,float(s.line_width_m)*0.5)
	var factor=1.0
	var reacted=false
	for zone in elemental_fields:
		if zone.side!=a.side or zone.used or int(zone.expires)<=ticks or zone.element==element:continue
		if b.pos.distance_to(zone.pos)>radius+float(zone.radius):continue
		for rule in registry.reactions:
			if element in rule.elements and zone.element in rule.elements:
				factor=maxf(factor,float(rule.multiplier))
				zone.used=true
				reacted=true
				if rule.status_id!=null:
					for target in alive(1-int(a.side)):
						if target.pos.distance_to(b.pos)<=radius:apply_status(a,target,{"status_id":rule.status_id,"chance":1.0})
				break
		if reacted:break
	elemental_fields.append({"element":element,"side":a.side,"pos":b.pos,"radius":radius,"expires":ticks+40,"used":reacted})
	return factor

func skill_definition(id: String) -> Dictionary:
	return encounter_skills[id] if encounter_skills.has(id) else registry.skills[id]

func skill_name(id: String) -> String:
	return str(encounter_names[id]) if encounter_names.has(id) else str(registry.names[id].name_vi)

func add_beast(beast_id: String,level: int) -> void:
	var def=registry.beasts[beast_id]
	var rule=registry.beast_combat[beast_id]
	# Host supplies only a baseline stat curve; runtime uses a separate creature ID and skill kit.
	add_actor(def.canon_host_template_id,1,level,int(registry.ninjas[def.canon_host_template_id].initial_quality),{},0,float(rule.stat_multiplier))
	var a=actors.back()
	a.id=beast_id
	a["beast"]=true
	a.element=rule.element
	a.skills=[]
	for skill in rule.skills:
		var id=str(skill.skill_id)
		encounter_skills[id]=skill
		encounter_names[id]=skill.name_vi
		a.skills.append(id)
