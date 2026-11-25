extends RefCounted
const Stats=preload("res://game/stats_service.gd")
const Formation=preload("res://game/formation_service.gd")
var map_width: int=14
var map_height: int=10
var side_formations: Dictionary={}
var side_levels: Dictionary={}

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
var action_stats: Dictionary = {}
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
var art_events: Array[Dictionary]=[]
var terrain: Array[Dictionary]=[]
var qa_hold_ai=false
var use_p2=true
var p2_jobs: Array[Dictionary]=[]
var p2_marks: Dictionary={}
var p2_hits: Dictionary={}
var p2_events: Dictionary={}
var p2_casts=0
var p2_resolved=0
var cast_seq=0
var tactical_choices=0
var resolved_casts=0
var missed_casts=0

func setup(reg,save,stage: Dictionary,seed_value: int) -> void:
	registry=reg
	configure_map(stage)
	configure_team_formation(save)
	side_formations[1]="FRM-01"
	side_levels[1]=1
	var slots=Formation.normalize_slots(save.team,save.get("formation_slots",{}))
	rng.seed=seed_value
	var kind=str(reg.territories.get(stage.get("territory_id",""),{}).get("kind",""))
	if kind in ["forest","desert","cave"]:environment=kind
	configure_terrain(stage)
	for id in save.team:
		var p=save.owned[id]
		var progress=p.duplicate(true)
		progress.beast_level=int(save.get("beasts",{}).get(p.get("beast_id",""),{}).get("level",0))
		progress.contract_level=int(save.get("summon_contracts",{}).get(p.get("summon_contract",""),{}).get("level",0))
		add_actor(id,0,int(p.level),int(p.quality),p.permanent,int(slots[id]),1.0,progress,save.get("gear_instances",{}))
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
	actors.append({"uid":next_uid,"summon":false,"owner":0,"ttl":0.0,"statuses":{},"immune":0.0,"counter":{},"stance":{},"element":str(n.chakra_elements[0]) if not n.chakra_elements.is_empty() else "neutral","last_element":"","element_tick":-1000,"reaction_tick":-1000,"id":id,"side":side,"hp":hp,"max_hp":hp,"patk":float(all_stats.patk)*mult,"natk":float(all_stats.natk)*mult,"armor":all_stats.armor,"nres":all_stats.nres,"chakra":0.0,"max_chakra":all_stats.chakra_max,"regen":all_stats.chakra_regen,"deployment_slot":slot,"pos":Formation.spawn(side,slot,map_width,map_height,float(registry.combat_v3.deployment.rank_spacing),float(registry.combat_v3.deployment.lane_spacing)),"cooldowns":{},"busy":0.0,"stun":0.0,"shield":0.0,"shield_time":0.0,"shield_sources":{},"skills":n.skills.duplicate()+progress.get("unlocked_skills",[]),"skill_levels":progress.get("skill_levels",{}).duplicate(true),"gear_stats":gear_stats,"stats":all_stats,"forms":progress.get("forms",[]).duplicate(),"active_form":{},"form_cooldowns":{},"contract":progress.get("summon_contract",""),"contract_level":int(progress.get("contract_level",0)),"contract_cd":0.0,"last":"","quality":quality,"realm":int(progress.get("realm",floori(float(level-1)/20.0))),"pending":{},"cast_left":0.0})

func alive(side: int) -> Array:
	return actors.filter(func(a): return int(a.side)==side and float(a.hp)>0.0)

func target_for(a: Dictionary,skill: Dictionary) -> Dictionary:
	var kind=str(skill.target)
	if kind=="self":return a
	var allied=kind.begins_with("ally")
	if not allied:
		for st in a.statuses.values():
			if st.id=="taunt":
				var forced=actor_by_uid(int(st.get("source",0)))
				if not forced.is_empty() and forced.hp>0 and forced.side!=a.side:return forced
	var best={}
	var best_score=-INF
	for b in alive(int(a.side) if allied else 1-int(a.side)):
		var distance=a.pos.distance_to(b.pos)
		var score=0.0
		if allied:
			score=(1.0-clampf((float(b.hp)+float(b.shield))/maxf(1.0,float(b.max_hp)),0,1))*100.0-distance*2.0
			if skill.ai.condition=="ally_dispellable_status":
				if not has_debuff(b):continue
				score+=60
		else:
			score=-distance*5.0+(1-float(b.hp)/maxf(1.0,float(b.max_hp)))*12.0
			if has_status(b,"mark"):score+=10
			if b.summon:score-=5
			if distance<=float(skill.range_m)+body_radius(b) and clear_segment(a.pos,b.pos,0.03):score+=30
			if skill.shape in ["line","circle"]:score+=6*targets_for(a,skill,b).size()
		if score>best_score or (is_equal_approx(score,best_score) and int(b.uid)<int(best.get("uid",999999))):
			best=b
			best_score=score
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
	return has_status(a,"stun") or has_status(a,"freeze") or has_status(a,"fear") or has_status(a,"shock") or has_status(a,"sleep")

func supported(skill: Dictionary) -> bool:
	for effect in skill.effects:
		# Form unlock and activation belong to the progression batch.
		if effect.type=="activate_form" and not registry.form_rules.has(effect.form_id):return false
		if not str(effect.type) in ["damage","heal","shield","apply_status","cleanse","chakra_restore","dash","summon","temporary_stance","counter","activate_form"]: return false
		if effect.type=="apply_status" and not registry.status_catalog.has(effect.status_id): return false
	return true

func ready(a: Dictionary,s: Dictionary) -> bool:
	if s.has("p2") and not p2_ready(a,s):return false
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
	if not cast_geometry(a,s,b):return -INF
	if not ai_condition(a,s,b):return -INF
	if s.has("p2"):
		return p2_utility(a,s,b)
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
	if s.kind=="auto" and a.side==0 and not auto_player_ultimate and a.skills.size()>5 and bool(s.ai.get("reserve_ultimate_chakra",true)):
		var ultimate_skill=effective_skill(a,a.skills[5])
		if a.chakra>=ultimate_skill.chakra and a.chakra-s.chakra<ultimate_skill.chakra: score-=35.0
	return score

func cast(a: Dictionary,s: Dictionary,b: Dictionary) -> bool:
	if not ready(a,s) or not cast_geometry(a,s,b) or not ai_condition(a,s,b):return false
	if s.has("p2"):p2_casts+=1
	a.chakra=float(a.chakra)-float(s.chakra)
	a.cooldowns[s.skill_id]=float(s.cooldown_s)
	a.busy=float(s.cast_s)+float(s.recovery_s)/(1.0+rating(a,"attack_speed"))
	a.last=skill_name(s.skill_id)
	cast_seq+=1
	a.pending={"skill":s,"target_uid":b.uid,"origin":a.pos,"aim":b.pos,"cast_id":cast_seq}
	a.cast_left=float(s.cast_s)
	art_event("cast_start",a.pos,0,str(s.skill_id))
	return true

func targets_for(a: Dictionary,s: Dictionary,b: Dictionary) -> Array:
	if b.is_empty():return []
	if s.has("p2"):return p2_targets(a,s,b.pos,b.pos-a.pos,b)
	if s.shape in ["single","self"]:return [b]
	var result=[]
	var direction: Vector2=(b.pos-a.pos).normalized()
	for target in alive(int(b.side)):
		var include=false
		var radius=body_radius(target)
		if s.shape=="circle":
			include=target.pos.distance_to(b.pos)<=float(s.radius_m)+radius and clear_segment(b.pos,target.pos,0.02)
		elif s.shape=="line":
			var offset: Vector2=target.pos-a.pos
			var projection=offset.dot(direction)
			include=projection>=-radius and projection<=float(s.range_m)+radius and absf(offset.cross(direction))<=float(s.line_width_m)*0.5+radius and clear_segment(a.pos,target.pos,0.02)
		if target.uid==b.uid:include=true
		if include:result.append(target)
	result.sort_custom(func(x,y):
		var dx=float(x.pos.distance_to(b.pos)) if s.shape=="circle" else float(x.pos.distance_to(a.pos))
		var dy=float(y.pos.distance_to(b.pos)) if s.shape=="circle" else float(y.pos.distance_to(a.pos))
		return int(x.uid)<int(y.uid) if is_equal_approx(dx,dy) else dx<dy)
	return result.slice(0,maxi(1,int(s.max_targets)))

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
	art_event("status_applied",b.pos,0,id)

func hit(a: Dictionary,b: Dictionary,dmg: float,allow_counter: bool=true) -> void:
	if b.has("p2_arc") and int(b.p2_arc.expires)>ticks and b.p2_arc.hp>0 and a.uid!=b.uid:
		var facing=Vector2(b.p2_arc.facing)
		var incoming=(Vector2(a.pos)-Vector2(b.pos)).normalized()
		if facing.dot(incoming)>=cos(deg_to_rad(float(b.p2_arc.angle)*0.5)):
			var absorbed=minf(dmg,float(b.p2_arc.hp))
			b.p2_arc.hp=float(b.p2_arc.hp)-absorbed
			dmg-=absorbed
	if dmg<=0:return
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
	# Preserve authored phase opportunities even on burst damage; each phase fires once.
	if int(b.uid)==boss_actor_uid and not boss_phases.is_empty():
		for i in range(boss_phases.rule.phases.size()):
			if boss_phases.fired.has(i):continue
			var threshold=float(boss_phases.rule.phases[i].hp_at_or_below)*float(b.max_hp)
			if old>threshold and b.hp<=threshold:
				b.hp=threshold
				update_boss(b)
				break
	if old-b.hp>0.01:
		b.statuses.erase("sleep")
		art_event("damage",b.pos,old-b.hp)
		last_progress_tick=ticks
		if a.side!=b.side:award_action(b,"vitality")
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
	b.deployment_slot=-1
	b.pos=safe_spawn(a)
	b.pending={}
	b.busy=0.0
	b.statuses={}
	b.cooldowns={}
	b.counter={}
	b.stance={}
	b.shield=0.0
	b.shield_sources={}
	b.chakra=0.0
	if not position_clear(b,b.pos):return
	actors.append(b)
	art_event("summon",b.pos)

func release(a: Dictionary,s: Dictionary,b: Dictionary,locked_targets: Array=[]) -> void:
	if b.is_empty() or b.hp<=0:return
	art_event("release",b.pos,0,str(s.skill_id))
	var field_factor=spatial_reaction(a,s,b)
	for target in (targets_for(a,s,b) if locked_targets.is_empty() else locked_targets):
		if target.hp<=0:continue
		for e in s.effects:
			effect_dispatch_count+=1
			match str(e.type):
				"damage":
					var physical=str(e.damage_type)=="physical"
					var stat="patk" if physical else "natk"
					var attack=float(a[stat])*(1.0+magnitude(a,"attack_up"))*maxf(0.5,1.0-magnitude(a,"attack_down"))*form_multiplier(a,stat)
					if e.damage_type=="genjutsu":attack=float(a.stats.genjutsu_power)*form_multiplier(a,"genjutsu_power")
					attack*=formation_multiplier(a,"attack")
					if not a.stance.is_empty() and a.stance.stat==stat:attack*=float(a.stance.multiplier)
					var defense=maxf(0.0,float(target.armor if physical else target.nres)*(1.0+magnitude(target,"defense_up"))-float(a.stats.get("armor_pen" if physical else "magic_pen",0)))
					if e.damage_type=="genjutsu":defense=float(target.stats.genjutsu_resist)
					defense*=formation_multiplier(target,"defense")
					var realm_factor=clampf(1.0+0.04*(int(a.realm)-int(target.realm)),0.75,1.25)
					var element_factor=float(registry.affinity.get(str(s.element)+":"+str(target.element),1.0))*maxf(field_factor,reaction(a,target,str(s.element)) if field_factor==1.0 else 1.0)*float(registry.environments.get(environment,{}).get("modifiers",{}).get(s.element,1.0))
					if s.element!="neutral":element_factor*=1.0+rating(a,"element_power")
					var hit_rate=clampf(0.85+(rating(a,"accuracy")-rating(target,"evasion"))/(200.0+absf(rating(a,"accuracy")-rating(target,"evasion")))+magnitude(a,"accuracy_up")-magnitude(a,"blind")-magnitude(a,"steam")-magnitude(target,"evasion"),0.15,0.99)
					if rng.randf()<hit_rate:
						if s.kind!="basic" and a.side!=target.side:
							var drain=minf(float(target.chakra),float(s.chakra)*rating(a,"chakra_drain")*(1.0-rating(target,"chakra_drain_resist")))
							target.chakra=float(target.chakra)-drain
							a.chakra=minf(float(a.max_chakra),float(a.chakra)+drain*rating(a,"chakra_conversion"))
						var before_hp=float(target.hp)
						var crit=1.5+rating(a,"crit_damage") if e.damage_type!="genjutsu" and rng.randf()<maxf(0.0,rating(a,"pcrit" if physical else "ncrit")-rating(target,"crit_resist")) else 1.0
						hit(a,target,maxf(1.0,round(attack*float(e.coefficient)*100.0/(100.0+defense)*realm_factor*element_factor*crit*(1.0-minf(0.65,rating(target,"damage_reduction"))))))
						if before_hp-float(target.hp)>0.01 and target.side!=a.side:award_action(a,"strength" if physical else "intellect")
				"heal":
					var before_hp=float(target.hp)
					target.hp=minf(float(target.max_hp),float(target.hp)+float(a.natk)*float(e.coefficient)*(1.0+rating(a,"healing"))*(1.0-clampf(magnitude(target,"antiheal"),0.0,0.9)))
					if target.hp-before_hp>0.01:
						award_action(a,"spirit")
						art_event("heal",target.pos,float(target.hp)-before_hp)
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
				"dash":move_actor(a,target.pos,minf(float(e.max_distance_m),maxf(0.0,a.pos.distance_to(target.pos)-float(e.stop_distance_m))))
				"summon":summon_actor(a,s,e)
				"temporary_stance":a.stance={"remaining":float(e.duration_s),"stat":e.stat,"multiplier":e.multiplier}
				"counter":a.counter={"remaining":float(e.window_s),"coefficient":e.coefficient}
				"activate_form":activate_form(a,str(e.form_id),false,str(s.skill_id))
	if s.get("p2_subhit",false):return
	if int(a.side)==0 and not a.summon:
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
	return ultimate_skill(index,a.skills[5])

func ultimate_skill(index: int,id: String) -> bool:
	if index<0 or index>=actors.size():return false
	var a=actors[index]
	if a.side!=0 or a.hp<=0 or a.summon or not id in a.skills:return false
	var s=effective_skill(a,id)
	if s.kind!="ultimate":return false
	return cast(a,s,target_for(a,s))

func update_status(a: Dictionary,dt: float) -> void:
	a.immune=maxf(0.0,float(a.immune)-dt)
	a.contract_cd=maxf(0.0,float(a.contract_cd)-dt)
	for id in a.form_cooldowns:a.form_cooldowns[id]=maxf(0.0,float(a.form_cooldowns[id])-dt)
	if not a.active_form.is_empty():
		a.active_form.remaining=float(a.active_form.remaining)-dt
		if use_p2 and registry.p2_forms.has(a.active_form.id):
			var drain=float(registry.p2_forms[a.active_form.id].effect.chakra_drain_per_s)*dt
			a.chakra=maxf(0.0,float(a.chakra)-drain)
			if drain>0 and a.chakra<=0:a.active_form.remaining=0
		if a.active_form.remaining<=0:a.active_form={}
			
	for id in a.forms:
		var rule=registry.form_rules[id]
		if rule.activation=="hp_threshold_or_manual" and a.hp/a.max_hp<=float(rule.hp_threshold) and not a.get("hp_auto_forms",{}).has(id):
			if activate_form(a,id,true):
				if not a.has("hp_auto_forms"):a.hp_auto_forms={}
				a.hp_auto_forms[id]=true
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
	while not art_events.is_empty() and int(art_events[0].tick)<ticks-20:art_events.pop_front()
	for zone in elemental_fields.duplicate():
		if int(zone.expires)<=ticks:elemental_fields.erase(zone)
	advance_projectiles(dt)
	advance_p2()
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
		a.chakra=minf(float(a.max_chakra),float(a.chakra)+float(a.regen)*dt*formation_multiplier(a,"chakra")*(1.0+magnitude(a,"chakra_up"))*(1.0-clampf(magnitude(a,"chakra_lock"),0.0,0.9)))
		for id in a.cooldowns:a.cooldowns[id]=maxf(0.0,float(a.cooldowns[id])-dt)
		if not a.pending.is_empty():
			var pending=a.pending
			var skill=pending.skill
			if (hard_block(a) or (has_status(a,"silence") and skill.damage_type!="physical")) and skill.interruptible:
				a.chakra=minf(float(a.max_chakra),float(a.chakra)+0.8*float(skill.chakra))
				a.cooldowns[skill.skill_id]=float(skill.cooldown_s)*0.5
				art_event("interrupt",a.pos,0,str(skill.skill_id))
				a.pending={}
				a.busy=0.0
			else:
				a.cast_left=float(a.cast_left)-dt
				if a.cast_left<=0:
					a.pending={}
					resolve_pending(a,pending)
				else:continue
		if a.busy>0 or hard_block(a) or qa_hold_ai:continue
		if a.has("ai_goal") and ticks%int(registry.tactics.ai_interval_ticks)!=int(a.uid)%int(registry.tactics.ai_interval_ticks):
			if not has_status(a,"bind"):move_actor(a,a.ai_goal,movement_speed(a)*dt)
			continue
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
		if not best.is_empty():
			cast(a,best,best_target)
			a.ai_goal=a.pos
			tactical_choices+=1
		elif not has_status(a,"bind"):
			var goal=tactical_goal(a,enemy,basic)
			a.ai_goal=goal
			move_actor(a,goal,movement_speed(a)*dt)
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
	if use_p2 and registry.p2_forms.has(id) and not manual and registry.p2_skills.has(trigger_id):
		for e in registry.p2_skills[trigger_id].effects:
			if e.type=="activate_form" and e.form_id==id:return true
	if not manual:
		if rule.activation=="skill_trigger":return trigger_id in rule.trigger_skill_ids
		# Some D4 skills explicitly activate a manual/HP form; honor that authored route without charging twice.
		if not trigger_id in a.skills:return false
		var skill=skill_definition(trigger_id)
		for e in skill.effects:
			if e.type=="activate_form" and e.form_id==id:return true
		return false
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
	var crossed_ratio=float(a.hp)/float(a.max_hp)
	for i in range(rule.phases.size()):
		var phase=rule.phases[i]
		if boss_phases.fired.has(i) or crossed_ratio>float(phase.hp_at_or_below)+0.000001:continue
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
	if encounter_skills.has(id):return encounter_skills[id]
	if use_p2 and registry.p2_skills.has(id):return registry.p2_skills[id]
	return registry.skills[id]

func skill_name(id: String) -> String:
	if encounter_names.has(id):return str(encounter_names[id])
	if use_p2 and registry.p2_skills.has(id):return str(registry.p2_design[id].name_vi)
	return str(registry.names[id].name_vi)

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

func award_action(a: Dictionary,stat: String) -> void:
	if int(a.side)!=0 or a.summon:return
	counts[a.id]=int(counts.get(a.id,0))+1
	if not action_stats.has(a.id):action_stats[a.id]={}
	action_stats[a.id][stat]=int(action_stats[a.id].get(stat,0))+1

func art_event(kind: String,pos: Vector2,amount: float=0.0,skill: String="") -> void:
	art_events.append({"kind":kind,"pos":pos,"amount":amount,"skill":skill,"tick":ticks})
	if art_events.size()>128:art_events.pop_front()

func move_actor(a: Dictionary,destination: Vector2,distance: float) -> void:
	if distance<=0:return
	var goal=clamp_position(destination)
	var initial=Vector2(a.pos)
	# Small continuous swept steps prevent tunneling through actors and terrain.
	var remaining=minf(distance,initial.distance_to(goal))
	while remaining>0.001:
		var amount=minf(0.22,remaining)
		var origin=Vector2(a.pos)
		var aim=route_waypoint(origin,goal,body_radius(a))
		var direction=(aim-origin).normalized()
		amount=minf(amount,origin.distance_to(aim))
		if amount<0.001 or direction==Vector2.ZERO:break
		var chosen=origin
		var best=-INF
		for angle in [0.0,0.55,-0.55,1.1,-1.1,1.57,-1.57]:
			var candidate=clamp_body(origin+direction.rotated(angle)*amount,body_radius(a))
			if not position_clear(a,candidate) or not clear_segment(origin,candidate,body_radius(a)):continue
			var score=(origin.distance_to(aim)-candidate.distance_to(aim))*10.0-absf(angle)*0.15
			if score>best:
				best=score
				chosen=candidate
		if chosen==origin:break
		a.pos=chosen
		remaining-=amount

func configure_map(stage: Dictionary) -> void:
	var rule=registry.combat_v3
	var profile=rule.maps.get(stage.get("map_profile",rule.default_map),rule.maps[rule.default_map])
	map_width=clampi(int(stage.get("map_width",profile.width)),int(rule.bounds.min_width),int(rule.bounds.max_width))
	map_height=clampi(int(stage.get("map_height",profile.height)),int(rule.bounds.min_height),int(rule.bounds.max_height))

func clamp_position(p: Vector2) -> Vector2:
	return Vector2(clampf(p.x,0.2,float(map_width)-0.2),clampf(p.y,0.2,float(map_height)-0.2))

func configure_team_formation(save: Dictionary) -> void:
	var id=str(save.get("formation_id","FRM-01"))
	if not registry.formations.has(id):id="FRM-01"
	side_formations[0]=id
	side_levels[0]=clampi(int(save.get("formation_levels",{}).get(id,1)),1,int(registry.combat_v3.upgrade.max_level))

func link_count(a: Dictionary) -> int:
	if a.summon or a.hp<=0 or not side_formations.has(a.side):return 0
	var rule=registry.formations[side_formations[a.side]]
	var config=registry.combat_v3.links
	var count=0
	for b in actors:
		if b.uid==a.uid or b.side!=a.side or b.summon or b.hp<=0:continue
		if a.pos.distance_to(b.pos)>float(config.range):continue
		if Formation.linked(int(a.get("deployment_slot",-1)),int(b.get("deployment_slot",-1)),str(rule.link)):count+=1
	return mini(count,int(config.max_neighbors))

func formation_multiplier(a: Dictionary,stat: String) -> float:
	if a.summon or not side_formations.has(a.side):return 1.0
	var rule=registry.formations[side_formations[a.side]]
	var value=1.0
	if str(rule.stat)==stat:value+=float(rule.base)+float(registry.combat_v3.upgrade.level_growth)*(int(side_levels.get(a.side,1))-1)
	if stat==str(registry.combat_v3.links.stat):value+=float(registry.combat_v3.links.per_neighbor)*link_count(a)
	return value

func body_radius(a: Dictionary) -> float:
	var rules=registry.tactics
	if a.get("summon",false):return float(rules.summon_radius)
	if int(a.get("uid",-1))==boss_actor_uid or a.get("beast",false):return float(rules.boss_radius)
	return float(rules.body_radius)

func clamp_body(p: Vector2,radius: float) -> Vector2:
	return Vector2(clampf(p.x,radius,float(map_width)-radius),clampf(p.y,radius,float(map_height)-radius))

func configure_terrain(stage: Dictionary={}) -> void:
	terrain.clear()
	var layout=stage.get("terrain",registry.tactics.terrain.get(environment,[]))
	for item in layout:
		var center=Vector2(float(item.center[0])*map_width,float(item.center[1])*map_height)
		var size_value=Vector2(float(item.size[0]),float(item.size[1]))
		terrain.append({"rect":Rect2(center-size_value/2,size_value),"kind":str(item.kind),"speed":float(item.get("speed",1.0))})

func clear_segment(from: Vector2,to: Vector2,radius: float) -> bool:
	for item in terrain:
		if item.kind!="obstacle":continue
		var rect: Rect2=item.rect.grow(radius)
		if rect.has_point(from) or rect.has_point(to):return false
		var corners=[rect.position,Vector2(rect.end.x,rect.position.y),rect.end,Vector2(rect.position.x,rect.end.y)]
		for i in range(4):
			if Geometry2D.segment_intersects_segment(from,to,corners[i],corners[(i+1)%4])!=null:return false
	return true

func position_clear(a: Dictionary,pos: Vector2) -> bool:
	var radius=body_radius(a)
	if not pos.is_equal_approx(clamp_body(pos,radius)) or not clear_segment(pos,pos,radius):return false
	for other in actors:
		if other.uid==a.uid or other.hp<=0:continue
		var required=radius+body_radius(other)
		var gap=pos.distance_to(other.pos)
		# Existing overlap can be escaped, but not worsened.
		if gap<required-0.01 and gap<=Vector2(a.pos).distance_to(other.pos)+0.001:return false
	return true

func route_waypoint(origin: Vector2,goal: Vector2,radius: float) -> Vector2:
	if clear_segment(origin,goal,radius):return goal
	# Visibility graph: expanded obstacle corners plus actual start/goal.
	var nodes: Array[Vector2]=[origin,goal]
	for item in terrain:
		if item.kind!="obstacle":continue
		var rect: Rect2=item.rect.grow(radius+0.16)
		for p in [rect.position,Vector2(rect.end.x,rect.position.y),rect.end,Vector2(rect.position.x,rect.end.y)]:
			if p.is_equal_approx(clamp_body(p,radius)) and p.distance_to(origin)>0.03 and clear_segment(p,p,radius):nodes.append(p)
	var dist={0:0.0}
	var prev={}
	var closed={}
	while true:
		var current=-1
		var best=INF
		for index in dist:
			if not closed.has(index) and float(dist[index])<best:
				current=index
				best=float(dist[index])
		if current<0:return origin
		if current==1:break
		closed[current]=true
		for i in range(1,nodes.size()):
			if closed.has(i) or i==current or not clear_segment(nodes[current],nodes[i],radius):continue
			var cost=best+nodes[current].distance_to(nodes[i])
			if cost<float(dist.get(i,INF)):
				dist[i]=cost
				prev[i]=current
	var next=1
	while int(prev[next])!=0:next=int(prev[next])
	return nodes[next]

func terrain_speed(pos: Vector2) -> float:
	var factor=1.0
	for item in terrain:
		if item.kind=="slow" and item.rect.has_point(pos):factor=minf(factor,float(item.speed))
	return factor

func safe_spawn(a: Dictionary) -> Vector2:
	for radius in [0.8,1.2,1.6,2.0]:
		for i in range(8):
			var p=clamp_body(Vector2(a.pos)+Vector2.RIGHT.rotated(TAU*i/8.0)*radius,float(registry.tactics.summon_radius))
			var ghost={"uid":-1,"summon":true,"pos":p}
			if position_clear(ghost,p):return p
	return Vector2(a.pos)

func has_debuff(a: Dictionary) -> bool:
	for status in a.statuses.values():
		if registry.status_catalog[status.id].dispellable and status.id in ["stun","bind","silence","slow","blind","burn","poison","wet","freeze","shock","mark","chakra_lock","taunt","antiheal","fear","mud","steam"]:return true
	return false

func ai_condition(a: Dictionary,s: Dictionary,b: Dictionary) -> bool:
	if s.has("p2"):return p2_condition(a,s,b)
	match str(s.ai.get("condition","valid_target")):
		"ally_dispellable_status":return has_debuff(b)
		"ally_hp_below_0.75":return float(b.hp)/float(b.max_hp)<0.75
		"ally_effective_hp_below_0.8":return (float(b.hp)+float(b.shield))/float(b.max_hp)<0.8
		"self_chakra_below_0.5":return float(a.chakra)/maxf(1.0,float(a.max_chakra))<0.5
		"active_summons_below_cap":
			for e in s.effects:
				if e.type=="summon":return summon_count(a,s.skill_id)<int(e.cap)
		"unlocked_form_and_no_active_form":return a.active_form.is_empty()
	return true

func cast_geometry(a: Dictionary,s: Dictionary,b: Dictionary) -> bool:
	if b.is_empty() or b.hp<=0:return false
	if s.target=="self":return a.uid==b.uid
	if s.target.begins_with("ally")!=(a.side==b.side):return false
	return a.pos.distance_to(b.pos)<=float(s.range_m)+body_radius(b) and clear_segment(a.pos,b.pos,0.03)

func tactical_goal(a: Dictionary,enemy: Dictionary,basic: Dictionary) -> Vector2:
	var range_value=float(basic.range_m)
	for id in a.skills:
		var skill=skill_definition(id)
		if skill.target=="enemy_ai" and skill.kind!="ultimate":range_value=maxf(range_value,float(skill.range_m))
	var distance=a.pos.distance_to(enemy.pos)
	# Backliners use affordable ranged attacks; advance if only melee is currently ready.
	var desired=float(basic.range_m)*0.8
	if range_value>=4:
		for id in a.skills:
			var skill=effective_skill(a,id)
			if skill.target=="enemy_ai" and skill.kind!="ultimate" and ready(a,skill):desired=maxf(desired,float(skill.range_m)*0.8)
	var direction=(Vector2(enemy.pos)-Vector2(a.pos)).normalized()
	if distance>desired+0.12 or not clear_segment(a.pos,enemy.pos,0.04):return enemy.pos
	if range_value>=4 and float(a.hp)/float(a.max_hp)<float(registry.tactics.retreat_hp_ratio) and distance<1.5:
		return clamp_body(Vector2(a.pos)-direction*1.2,body_radius(a))
	return a.pos

func resolve_pending(a: Dictionary,pending: Dictionary) -> void:
	var skill=pending.skill
	var target=actor_by_uid(int(pending.target_uid))
	if skill.has("p2"):
		p2_release(a,pending,target)
		return
	if not cast_geometry(a,skill,target):
		missed_casts+=1
		art_event("miss",pending.aim,0,str(skill.skill_id))
		return
	if float(skill.projectile_speed_m_s)>0 and target.uid!=a.uid:
		var origin=Vector2(a.pos)
		var direction=(Vector2(pending.aim)-origin).normalized()
		var length_value=minf(float(skill.range_m)+body_radius(target),maxf(0.1,origin.distance_to(pending.aim)+body_radius(target)))
		if skill.shape=="line":length_value=float(skill.range_m)
		projectiles.append({"source":a.uid,"target":target.uid,"skill":skill,"origin":origin,"pos":origin,"direction":direction,"remaining":length_value/maxf(0.01,float(skill.projectile_speed_m_s)),"distance_left":length_value,"hit_ids":[],"cast_id":pending.cast_id})
		art_event("projectile_spawn",origin,0,str(skill.skill_id))
	else:
		resolved_casts+=1
		release(a,skill,target)

func advance_projectiles(dt: float) -> void:
	for p in projectiles.duplicate():
		var source=actor_by_uid(int(p.source))
		if source.is_empty():
			projectiles.erase(p)
			continue
		var skill=p.skill
		var step=minf(float(p.distance_left),float(skill.projectile_speed_m_s)*dt)
		var from=Vector2(p.pos)
		var to=from+Vector2(p.direction)*step
		var blocked=not clear_segment(from,to,0.03) or not to.is_equal_approx(clamp_body(to,0.03))
		if not blocked:
			var contacts=[]
			for target in alive(1-int(source.side)):
				if target.uid in p.hit_ids:continue
				var nearest=Geometry2D.get_closest_point_to_segment(target.pos,from,to)
				var radius=body_radius(target)+(float(skill.line_width_m)*0.5 if skill.shape in ["line","projectile_first"] else 0.0)
				if target.pos.distance_to(nearest)<=radius:contacts.append(target)
			contacts.sort_custom(func(x,y):
				var dx=from.distance_to(x.pos)
				var dy=from.distance_to(y.pos)
				return int(x.uid)<int(y.uid) if is_equal_approx(dx,dy) else dx<dy)
			for target in contacts:
				if p.hit_ids.size()>=int(p.get("contact_cap",skill.max_targets)):break
				if skill.has("p2") and target.has("p2_absorb") and int(target.p2_absorb.expires)>ticks and int(target.p2_absorb.left)>0:
					target.p2_absorb.left=int(target.p2_absorb.left)-1
					target.chakra=minf(float(target.max_chakra),float(target.chakra)+float(target.p2_absorb.chakra))
					p.distance_left=0.0
					break
				p.hit_ids.append(target.uid)
			p.pos=to
			p.distance_left=float(p.distance_left)-step
			p.remaining=float(p.distance_left)/maxf(0.01,float(skill.projectile_speed_m_s))
		if blocked or float(p.distance_left)<=0.0001 or p.hit_ids.size()>=int(p.get("contact_cap",skill.max_targets)):
			projectiles.erase(p)
			var hits=[]
			for uid in p.hit_ids:
				var target=actor_by_uid(int(uid))
				if not target.is_empty() and target.hp>0:hits.append(target)
			if hits.is_empty():
				missed_casts+=1
				art_event("miss",p.pos,0,str(skill.skill_id))
			else:
				resolved_casts+=1
				art_event("contact",p.pos,0,str(skill.skill_id))
				if skill.has("p2"):
					var actual=hits if skill.shape!="projectile_burst" else p2_targets(source,skill,hits[0].pos,Vector2(p.direction),hits[0])
					p2_schedule(source,skill,hits[0].pos,Vector2(p.direction),actual,int(p.cast_id))
				else:release(source,skill,hits[0],hits)

func movement_speed(a: Dictionary) -> float:
	return 2.2*formation_multiplier(a,"move")*(1.0+rating(a,"move_speed"))*(1.0+magnitude(a,"haste"))*(1.0-clampf(maxf(magnitude(a,"slow"),magnitude(a,"mud")),0.0,0.8))*terrain_speed(a.pos)

func p2_ready(a: Dictionary,s: Dictionary) -> bool:
	var cond=s.p2.conditions
	if int(a.realm)<int(cond.get("unlock_realm",0)):return false
	if cond.has("any_active_forms") and not a.active_form.get("id","") in cond.any_active_forms:return false
	if cond.has("forbidden_active_forms") and a.active_form.get("id","") in cond.forbidden_active_forms:return false
	if cond.has("requires_unlocked_form") and not str(cond.requires_unlocked_form) in a.forms:return false
	return true

func p2_condition(a: Dictionary,s: Dictionary,b: Dictionary) -> bool:
	if b.is_empty():return false
	var p=s.p2.effect.params
	match str(s.p2.conditions.ai):
		"below_summon_cap":return summon_count(a,s.skill_id)<int(p.get("cap",1))
		"chakra_below_70pct":return float(a.chakra)<float(a.max_chakra)*0.7
		"ally_hp_below_75pct":return float(b.hp)<float(b.max_hp)*0.75
		"ally_has_dispellable_status":
			for target in p2_targets(a,s,b.pos,b.pos-a.pos,b):
				if has_debuff(target):return true
			return false
		"allies_missing_hp":
			for target in alive(int(a.side)):
				if target.hp<target.max_hp*0.85 and target.pos.distance_to(a.pos)<=float(s.radius_m):return true
			return false
		"ally_chakra_below_70pct":
			for target in alive(int(a.side)):
				if target.chakra<target.max_chakra*0.7 and target.pos.distance_to(a.pos)<=float(s.radius_m):return true
			return false
		"owned_valid_mark_or_explicit_swap":return s.p2.effect.type=="position_swap" or p2_has_mark(a,b)
		"no_valid_owned_mark":return not p2_has_mark(a,b)
		"incoming_absorbable_projectile":return projectiles.any(func(q):return q.target==a.uid)
		"incoming_frontal_threat","enemy_targeting_ally","ally_under_threat":
			for enemy in alive(1-int(a.side)):
				if enemy.pos.distance_to(b.pos)<3.5:return true
			return false
	return true

func p2_utility(a: Dictionary,s: Dictionary,b: Dictionary) -> float:
	var kind=str(s.p2.effect.type)
	var count=maxi(1,p2_targets(a,s,b.pos,b.pos-a.pos,b).size())
	var score=float(s.p2.effect.total_coefficient)*18*count
	if kind in ["heal","heal_pulse"]:score=45.0
	if kind in ["shield","directional_shield"]:score=24.0 if b.shield<=0 else -25.0
	if kind in ["stance","team_buff","chakra_regen"]:score=18.0
	if kind=="summon":score=32.0
	if kind in ["cleanse","absorb","counter","activate_form"]:score=35.0
	if kind in ["wall","teleport","position_swap","mark","chakra_restore"]:score=17.0
	if kind in ["zone_damage","zone_drain","trap"]:score+=12
	return score+float(s.ai.base_priority)*2-float(s.chakra)*0.28

func p2_targets(a: Dictionary,s: Dictionary,point: Vector2,direction: Vector2,primary: Dictionary={}) -> Array:
	var shape=str(s.shape)
	var raw=s.p2
	var ally=raw.target in ["allies_in_radius","ally_lowest_effective_hp"]
	if shape in ["self","arc_self","summon"]:return [a]
	if shape in ["single","single_ally","dash_contact","teleport_mark","projectile_first"]:
		return [] if primary.is_empty() or primary.hp<=0 else [primary]
	var center=Vector2(a.pos) if shape=="circle_self" else point
	var result=[]
	var dir=direction.normalized()
	for b in alive(int(a.side) if ally else 1-int(a.side)):
		var offset=Vector2(b.pos)-Vector2(a.pos)
		var include=false
		if shape=="line":include=offset.dot(dir)>=0 and offset.dot(dir)<=float(s.range_m)+body_radius(b) and absf(offset.cross(dir))<=float(s.line_width_m)*0.5+body_radius(b)
		elif shape=="cone":include=offset.length()<=float(s.range_m)+body_radius(b) and dir.dot(offset.normalized())>=cos(deg_to_rad(float(raw.geometry.extent)*0.5))
		else:include=b.pos.distance_to(center)<=float(s.radius_m)+body_radius(b)
		if include and clear_segment(center if shape not in ["line","cone"] else a.pos,b.pos,0.01):result.append(b)
	result.sort_custom(func(x,y):
		var dx=x.pos.distance_to(center)
		var dy=y.pos.distance_to(center)
		return int(x.uid)<int(y.uid) if is_equal_approx(dx,dy) else dx<dy)
	return result.slice(0,int(s.max_targets))

func p2_has_mark(a: Dictionary,b: Dictionary) -> bool:
	return int(p2_marks.get(str(a.uid)+":"+str(b.uid),0))>ticks

func p2_set_mark(a: Dictionary,b: Dictionary,p: Dictionary) -> void:
	var prefix=str(a.uid)+":"
	var keys=p2_marks.keys().filter(func(k):return str(k).begins_with(prefix))
	if keys.size()>=int(p.get("max_marks",3)):
		keys.sort_custom(func(x,y):return int(p2_marks[x])<int(p2_marks[y]))
		p2_marks.erase(keys[0])
	p2_marks[prefix+str(b.uid)]=ticks+roundi(float(p.get("mark_ttl_s",p.get("duration_s",8)))*20)

func p2_release(a: Dictionary,pending: Dictionary,b: Dictionary) -> void:
	var s=pending.skill
	var raw=s.p2
	var kind=str(raw.effect.type)
	var p=raw.effect.params
	var point=Vector2(pending.aim) if s.shape in ["circle_ground","zone_target","wall"] else Vector2(b.get("pos",pending.aim))
	var direction=(point-Vector2(a.pos)).normalized()
	if s.shape not in ["circle_ground","zone_target","wall"] and not cast_geometry(a,s,b):
		missed_casts+=1
		art_event("miss",point,0,str(s.skill_id))
		return
	if s.shape in ["circle_ground","zone_target","wall"] and (a.pos.distance_to(point)>float(s.range_m)+0.35 or not clear_segment(a.pos,point,0.02)):
		missed_casts+=1
		return
	art_event("release",point,0,str(s.skill_id))
	if s.shape=="wall":
		var size_value=Vector2(float(p.get("thickness_m",0.45)),float(p.get("width_m",2.2)))
		var rect=Rect2(point-size_value/2,size_value)
		for unit in actors:
			if unit.hp>0 and rect.grow(body_radius(unit)).has_point(unit.pos):return
		terrain.append({"rect":rect,"kind":"obstacle","speed":1.0,"expires":ticks+roundi(float(p.get("duration_s",6))*20)})
		p2_confirm(a,s,point,"effect")
		return
	if s.shape=="dash_contact":
		move_actor(a,b.pos,maxf(0.0,a.pos.distance_to(b.pos)-float(p.get("stop_m",0.65))))
		if a.pos.distance_to(b.pos)>body_radius(a)+body_radius(b)+0.25:return
	if s.shape=="teleport_mark":
		if kind=="position_swap":
			if b.uid==boss_actor_uid or b.summon:return
			var old_a=Vector2(a.pos)
			var old_b=Vector2(b.pos)
			a.pos=old_b
			b.pos=old_a
			if not position_clear(a,a.pos) or not position_clear(b,b.pos):
				a.pos=old_a
				b.pos=old_b
				return
		else:
			if not p2_has_mark(a,b):return
			var found=false
			for i in range(8):
				var dest=clamp_body(Vector2(b.pos)+Vector2.RIGHT.rotated(i*TAU/8.0)*0.9,body_radius(a))
				if position_clear(a,dest):
					a.pos=dest
					found=true
					break
			if not found:return
	if float(s.projectile_speed_m_s)>0 and b.uid!=a.uid:
		var origin=Vector2(a.pos)
		var length_value=float(s.range_m)
		projectiles.append({"source":a.uid,"target":b.uid,"skill":s,"origin":origin,"pos":origin,"direction":direction,"remaining":length_value/float(s.projectile_speed_m_s),"distance_left":length_value,"hit_ids":[],"cast_id":pending.cast_id,"contact_cap":1 if s.shape in ["projectile_first","projectile_burst"] else int(s.max_targets)})
		art_event("projectile_spawn",origin,0,str(s.skill_id))
		return
	p2_schedule(a,s,point,direction,p2_targets(a,s,point,direction,b),int(pending.cast_id))

func p2_schedule(a: Dictionary,s: Dictionary,point: Vector2,direction: Vector2,targets: Array,cast_id: int) -> void:
	var raw=s.p2
	var p=raw.effect.params
	var kind=str(raw.effect.type)
	var hits=maxi(1,int(raw.effect.hit_count))
	var interval=maxi(1,roundi(float(p.get("tick_s",p.get("interval_s",0.12)))*20))
	var dynamic=s.shape in ["circle_ground","zone_target"] or kind=="trap"
	var ids=targets.map(func(b):return b.uid)
	var start=ticks+roundi(float(p.get("delay_s",0))*20)
	var job={"source":a.uid,"skill":s,"point":point,"direction":direction,"ids":ids,"dynamic":dynamic,"cast_id":cast_id,"index":0,"hits":hits,"interval":interval,"next":start,"expires":start+maxi(hits*interval,roundi(float(p.get("duration_s",0))*20))+2,"confirmed":false}
	if p2_jobs.size()<256:p2_jobs.append(job)
	advance_p2()

func advance_p2() -> void:
	for item in terrain.duplicate():
		if item.has("expires") and int(item.expires)<=ticks:terrain.erase(item)
	for key in p2_marks.keys():
		if int(p2_marks[key])<=ticks:p2_marks.erase(key)
	for job in p2_jobs.duplicate():
		if int(job.next)>ticks:continue
		var a=actor_by_uid(int(job.source))
		if a.is_empty() or a.hp<=0 or int(job.expires)<ticks:
			p2_jobs.erase(job)
			continue
		var s=job.skill
		var targets=[]
		if job.dynamic:targets=p2_targets(a,s,job.point,job.direction)
		else:
			for uid in job.ids:
				var target=actor_by_uid(int(uid))
				if not target.is_empty() and target.hp>0:targets.append(target)
		if s.p2.effect.type=="trap" and targets.is_empty():
			job.next=ticks+1
			continue
		for b in targets:
			var key=str(job.cast_id)+":"+str(b.uid)+":"+str(job.index)
			if p2_hits.has(key):continue
			p2_hits[key]=ticks
			p2_apply(a,s,b,int(job.hits),int(job.index))
			if not job.confirmed:
				job.confirmed=true
				p2_confirm(a,s,b.pos,"effect",int(b.uid))
		job.index=int(job.index)+1
		job.next=ticks+int(job.interval)
		if int(job.index)>=int(job.hits):p2_jobs.erase(job)
	for key in p2_hits.keys():
		if ticks-int(p2_hits[key])>600:p2_hits.erase(key)

func p2_apply(a: Dictionary,s: Dictionary,b: Dictionary,hits: int,index: int) -> void:
	var raw=s.p2
	var p=raw.effect.params
	var kind=str(raw.effect.type)
	var sub=s.duplicate(true)
	sub.erase("p2")
	sub.p2_subhit=true
	sub.shape="single"
	sub.effects=[]
	for e in s.effects:
		var effect=e.duplicate(true)
		if e.has("coefficient"):effect.coefficient=float(e.coefficient)/float(hits)
		if kind=="directional_shield" and e.type=="shield":continue
		if index>0 and not e.type in ["damage","heal"]:continue
		sub.effects.append(effect)
	if not sub.effects.is_empty():release(a,sub,b,[b])
	if kind=="directional_shield":
		var facing=Vector2.RIGHT if a.side==0 else Vector2.LEFT
		for enemy in alive(1-int(a.side)):
			facing=(Vector2(enemy.pos)-Vector2(a.pos)).normalized()
			break
		a.p2_arc={"hp":float(a.natk)*float(raw.effect.total_coefficient),"angle":float(p.get("angle_deg",120)),"facing":facing,"expires":ticks+roundi(float(p.get("duration_s",4))*20)}
	if kind=="absorb":a.p2_absorb={"left":int(p.get("max_projectiles",1)),"chakra":float(p.get("chakra_return",15)),"expires":ticks+roundi(float(p.get("duration_s",3))*20)}
	if kind in ["mark","projectile_mark"]:p2_set_mark(a,b,p)
	if kind=="chakra_restore":b.chakra=minf(float(b.max_chakra),float(b.chakra)+float(p.get("chakra_amount",12)))
	if kind in ["chakra_drain","zone_drain"]:
		var amount=minf(float(b.chakra),float(p.get("chakra_amount",p.get("chakra_per_tick",3))))
		b.chakra=float(b.chakra)-amount
		a.chakra=minf(float(a.max_chakra),float(a.chakra)+amount*float(p.get("transfer_fraction",0.3)))
	var push=float(p.get("push_m",p.get("distance_m",0)))
	if push>0 and b.uid!=boss_actor_uid:
		var direction=(Vector2(b.pos)-Vector2(a.pos)).normalized()
		if p.get("direction","away")=="towards_caster":direction=-direction
		move_actor(b,Vector2(b.pos)+direction*push,push)

func p2_confirm(a: Dictionary,s: Dictionary,point: Vector2,event: String,target_uid: int=0) -> void:
	p2_resolved+=1
	if a.side==0 and not a.summon:mastery_counts[s.skill_id]=int(mastery_counts.get(s.skill_id,0))+1
	art_event("contact",point,0,str(s.skill_id))
	log.append(str(a.id)+" · "+skill_name(s.skill_id))
	if log.size()>6:log.pop_front()
