extends RefCounted
var actors: Array[Dictionary] = []
var registry
var outcome = ""
var counts: Dictionary = {}
var ticks = 0
var log: Array[String] = []
var rng = RandomNumberGenerator.new()

func setup(reg,save,stage: Dictionary,seed_value: int) -> void:
	registry=reg
	rng.seed=seed_value
	for id in save.team:
		var p=save.owned[id]
		add_actor(id,0,int(p.level),int(p.quality),p.permanent,actors.size(),1.0)
	var j=0
	for id in stage.enemy_ids:
		var n=reg.npcs[id]
		add_actor(str(n.template_ninja_id),1,int(n.level),int(reg.ninjas[n.template_ninja_id].initial_quality)+int(n.quality_bonus),{},j,float(n.stat_multiplier))
		j+=1

func add_actor(id: String,side: int,level: int,quality: int,permanent: Dictionary,slot: int,mult: float) -> void:
	var n=registry.ninjas[id]
	var strength=float(n.base_stats.strength)+float(n.level_growth.strength)*(level-1)+float(permanent.get("strength",0))
	var vit=float(n.base_stats.vitality)+float(n.level_growth.vitality)*(level-1)
	var intellect=float(n.base_stats.intellect)+float(n.level_growth.intellect)*(level-1)
	var spirit=float(n.base_stats.spirit)+float(n.level_growth.spirit)*(level-1)
	var hp=(250+18*vit+5*level)*mult
	actors.append({"id":id,"side":side,"hp":hp,"max_hp":hp,"patk":(20+3*strength+1.5*level)*mult,"natk":(20+3*intellect+1.5*level)*mult,"armor":10+2*vit,"nres":10+2*spirit,"chakra":0.0,"max_chakra":100+3*spirit,"regen":2+0.04*spirit,"pos":Vector2(1.0 if side==0 else 10.0,1.0+slot*1.2),"cooldowns":{},"busy":0.0,"stun":0.0,"shield":0.0,"shield_time":0.0,"skills":n.skills.duplicate(),"last":"","quality":quality})

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

func supported(skill: Dictionary) -> bool:
	for effect in skill.effects:
		if not str(effect.type) in ["damage","heal","shield","apply_status","cleanse","chakra_restore","dash"]:
			return false
		if effect.type=="apply_status" and not str(effect.status_id) in ["stun","bind","freeze","fear","shock"]:
			return false
	return true

func ready(a: Dictionary,s: Dictionary) -> bool:
	return supported(s) and float(a.busy)<=0 and float(a.stun)<=0 and float(a.chakra)>=float(s.chakra) and float(a.cooldowns.get(s.skill_id,0))<=0

func cast(a: Dictionary,s: Dictionary,b: Dictionary) -> bool:
	if b.is_empty() or not ready(a,s): return false
	if a.pos.distance_to(b.pos)>float(s.range_m)+0.1: return false
	if s.target.begins_with("ally") and float(b.hp)/float(b.max_hp)>0.8 and s.effects[0].type=="heal": return false
	a.chakra=float(a.chakra)-float(s.chakra)
	a.cooldowns[s.skill_id]=float(s.cooldown_s)
	a.busy=float(s.cast_s)+float(s.recovery_s)
	a.last=str(registry.names[s.skill_id].name_vi)
	for e in s.effects:
		match str(e.type):
			"damage":
				var physical=str(e.damage_type)=="physical"
				var attack=float(a.patk if physical else a.natk)
				var defense=float(b.armor if physical else b.nres)
				var dmg=maxf(1.0,attack*float(e.coefficient)*100.0/(100.0+defense))
				var blocked=minf(float(b.shield),dmg)
				b.shield=float(b.shield)-blocked
				b.hp=maxf(0.0,float(b.hp)-dmg+blocked)
			"heal": b.hp=minf(float(b.max_hp),float(b.hp)+float(a.natk)*float(e.coefficient))
			"shield":
				b.shield=maxf(float(b.shield),float(a.natk)*float(e.coefficient))
				b.shield_time=float(e.duration_s)
			"apply_status":
				if rng.randf()<float(e.chance): b.stun=maxf(float(b.stun),float(e.duration_s))
			"cleanse": b.stun=0.0
			"chakra_restore": a.chakra=minf(float(a.max_chakra),float(a.chakra)+float(e.amount))
			"dash": a.pos=a.pos.move_toward(b.pos,float(e.max_distance_m))
	if int(a.side)==0: counts[a.id]=int(counts.get(a.id,0))+1
	log.append(str(a.id)+" · "+str(a.last))
	if log.size()>6: log.pop_front()
	return true

func ultimate(index: int) -> bool:
	if index<0 or index>=actors.size(): return false
	var a=actors[index]
	if a.side!=0 or a.hp<=0: return false
	var s=registry.skills[a.skills[5]]
	return cast(a,s,target_for(a,s))

func tick(dt: float) -> void:
	if not outcome.is_empty(): return
	ticks+=1
	for a in actors:
		if a.hp<=0: continue
		a.busy=maxf(0.0,float(a.busy)-dt)
		a.stun=maxf(0.0,float(a.stun)-dt)
		a.shield_time=maxf(0.0,float(a.shield_time)-dt)
		if a.shield_time<=0: a.shield=0.0
		a.chakra=minf(float(a.max_chakra),float(a.chakra)+float(a.regen)*dt)
		for id in a.cooldowns: a.cooldowns[id]=maxf(0.0,float(a.cooldowns[id])-dt)
		if a.busy>0 or a.stun>0: continue
		var basic=registry.skills[a.skills[0]]
		var enemy=target_for(a,basic)
		if enemy.is_empty(): continue
		var acted=false
		for i in [4,3,2,1,0]:
			var s=registry.skills[a.skills[i]]
			if ready(a,s) and cast(a,s,target_for(a,s)):
				acted=true
				break
		if not acted and a.pos.distance_to(enemy.pos)>float(basic.range_m):
			a.pos=a.pos.move_toward(enemy.pos,2.2*dt)
	if alive(1).is_empty(): outcome="win"
	elif alive(0).is_empty(): outcome="loss"
