extends RefCounted
const Tactical=preload("res://game/tactical_ai.gd")
const CombatStats=preload("res://game/combat_stat_snapshot.gd")
const Depth=preload("res://game/skill_depth_service.gd")
const Passive=preload("res://game/passive_service.gd")
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
var use_passives=false
var use_passive_pilot=false
var use_passive_mixed=false
var use_depth=false
var use_tactical=false
# Product E3 only; legacy fixtures may explicitly disable it.
var use_e3_movement=false
var e3_metrics={"holds":0,"stale_goals_cancelled":0,"reversals":0,"distance":0.0}
var pressure_mode=false
var pressure_sample: Array=[]
var pressure_since=0
var combo_index: Dictionary={}
var combo_skill_index: Dictionary={}
var passive_secondary_holds: Dictionary={}
var combo_consumed: Dictionary={}
var combo_event_history: Dictionary={}
var combo_evidence: Dictionary={}
var form_effect_evidence: Dictionary={}
var passive_applied_ledger: Dictionary={}
var signature_ready_cache: Dictionary={}
var decision_effective: Dictionary={}
var decision_uid=0
var runtime_metrics={"max_actors":0,"max_jobs":0,"max_projectiles":0,"tick_usec_total":0,"tick_usec_max":0,"pressure_entries":0,"cast_choices":0}
var skill_effect_ledger: Dictionary={}
var passive_continuous_ledger: Dictionary={}
var passive_active_ledger: Dictionary={}
var contribution: Dictionary={}
var animation_events: Array[Dictionary]=[]
var animation_seq=0
var tactical_metrics={"dodge_moves":0,"focus_switches":0,"movement_steps":0,"minimum_gap":99.0,"crowded_pairs":0,"pair_samples":0}
var combo_contracts_dev: Dictionary={}
var form_routes_dev: Dictionary={}
var typed_passive_effects: Dictionary={}
var typed_passive_candidates: Dictionary={}
var combo_receipts: Dictionary={}
var form_receipts: Dictionary={}
var use_contract_v10=false
var ultimate_requests: Dictionary={}
var ultimate_executed: Dictionary={}
var ultimate_cancelled: Dictionary={}
var passive_typed_receipts: Dictionary={}
var mastery_casts: Dictionary={}
var cp_refund_units: Dictionary={}
var cp_telemetry: Dictionary={}
var passive_queue: Array[Dictionary]=[]
var passive_seen: Dictionary={}
var passive_receipts: Dictionary={}
var passive_mastery: Dictionary={}
var p2_jobs: Array[Dictionary]=[]
var p2_intercepts: Array[Dictionary]=[]
var p2_marks: Dictionary={}
var ritual_zones: Array[Dictionary]=[]
var retrieved_objects: Array[Dictionary]=[]
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
	use_passives=bool(save.get("settings",{}).get("passives_dev",false))
	use_passive_pilot=use_passives and bool(save.get("settings",{}).get("passive_pilot_dev",false))
	use_passive_mixed=use_passive_pilot and bool(save.get("settings",{}).get("passive_mixed_dev",true))
	use_depth=bool(save.get("settings",{}).get("depth_v5_dev",true))
	use_tactical=bool(save.get("settings",{}).get("tactical_v4_dev",true))
	use_e3_movement=use_tactical
	use_contract_v10=bool(save.get("settings",{}).get("contract_v10_dev",true))
	load_combat_contracts()
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
	Passive.refresh(self)

func add_actor(id: String,side: int,level: int,quality: int,permanent: Dictionary,slot: int,mult: float,progress: Dictionary={},gear_instances: Dictionary={}) -> void:
	var n=registry.ninjas[id]
	var star_multiplier=1.0+0.04*(int(progress.get("stars",1))-1)
	if not use_depth:mult*=star_multiplier
	var snapshot=CombatStats.snapshot(registry,n,level,quality,permanent,progress,gear_instances,use_depth)
	var gear_stats=snapshot.gear
	var all_stats=snapshot.stats
	var hp=float(all_stats.hp)*mult
	next_uid+=1
	actors.append({"uid":next_uid,"summon":false,"owner":0,"ttl":0.0,"statuses":{},"immune":0.0,"counter":{},"stance":{},"element":str(n.chakra_elements[0]) if not n.chakra_elements.is_empty() else "neutral","last_element":"","element_tick":-1000,"reaction_tick":-1000,"id":id,"side":side,"hp":hp,"max_hp":hp,"patk":float(all_stats.patk)*mult,"natk":float(all_stats.natk)*mult,"armor":all_stats.armor,"nres":all_stats.nres,"chakra":0.0,"max_chakra":all_stats.chakra_max,"regen":all_stats.chakra_regen,"deployment_slot":slot,"pos":Formation.spawn(side,slot,map_width,map_height,float(registry.combat_v3.deployment.rank_spacing),float(registry.combat_v3.deployment.lane_spacing)),"cooldowns":{},"busy":0.0,"stun":0.0,"shield":0.0,"shield_time":0.0,"shield_sources":{},"skills":n.skills.duplicate()+progress.get("unlocked_skills",[]),"skill_levels":progress.get("skill_levels",{}).duplicate(true),"gear_stats":gear_stats,"stats":all_stats,"forms":progress.get("forms",[]).duplicate(),"active_form":{},"form_cooldowns":{},"contract":progress.get("summon_contract",""),"contract_level":int(progress.get("contract_level",0)),"contract_cd":0.0,"last":"","quality":quality,"realm":int(progress.get("realm",floori(float(level-1)/20.0))),"pending":{},"cast_left":0.0})

	if use_depth:cp_resize(actors.back(),float(actors.back().max_chakra))
	Passive.attach(actors.back(),progress)

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
		if not allied and a.statuses.has("beguile_tactical") and int(a.statuses.beguile_tactical.source)==int(b.uid):continue
		var distance=a.pos.distance_to(b.pos)
		var score=0.0
		if allied:
			score=(1.0-clampf((float(b.hp)+float(b.shield))/maxf(1.0,float(b.max_hp)),0,1))*100.0-distance*2.0
			if use_passives and Passive.aura_source(self,b):score+=6.0 # DEV preserve support source
			if use_depth and b.hp<b.max_hp*0.3:score+=25.0
			if skill.ai.condition=="ally_dispellable_status":
				if not has_debuff(b):continue
				score+=60
			if use_tactical and cast_geometry(a,skill,b) and ai_condition(a,skill,b):score+=100.0
		else:
			score=-distance*5.0+(1-float(b.hp)/maxf(1.0,float(b.max_hp)))*12.0
			if has_status(b,"mark") or p2_has_mark(a,b):score+=10
			if skill.has("p2") and skill.p2.conditions.ai=="owned_valid_mark_or_explicit_swap" and skill.p2.effect.type!="position_swap" and not skill.p2.effect.params.get("mark_throw_before_teleport",false) and not p2_has_mark(a,b):continue
			if b.summon:score-=5
			if use_passives and Passive.aura_source(self,b):score+=6.0 # DEV counter enemy support source
			if use_passives and skill.element!="neutral":score+=clampf((float(registry.affinity.get(str(skill.element)+":"+str(b.element),1.0))-1.0)*10.0,-4.0,4.0)
			if distance<=float(skill.range_m)+body_radius(b) and clear_segment(a.pos,b.pos,0.03):score+=30
			if use_tactical and skill.kind!="basic" and cast_geometry(a,skill,b) and ai_condition(a,skill,b):score+=50.0
			if skill.shape in ["line","circle","cone","circle_ground","circle_target","zone_target","projectile_burst"]:
				var target_count=p2_targets(a,skill,b.pos,b.pos-a.pos,b).size() if use_passives and skill.has("p2") else targets_for(a,skill,b).size()
				score+=6*target_count
		if use_tactical and not a.summon:score+=Tactical.target_bonus(self,a,b,skill,allied)
		if use_e3_movement and not allied and skill.kind=="basic" and not a.summon and int(a.get("focus_uid",0))==int(b.uid) and ticks<int(a.get("focus_until",0)) and not pressure_mode:score+=20.0
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
	return cp_affordable(a,float(s.chakra)) and float(a.cooldowns.get(s.skill_id,0))<=0

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
	var factor=1.0 if use_depth else (1+0.02*(int(p.level)-1))*(1+0.12*(int(p.grade)-1))
	if not use_depth and str(p.branch).ends_with("-B1"):factor*=1.12
	if not use_depth and str(p.branch).ends_with("-B2"):
		s.radius_m=float(s.radius_m)*1.15
		s.line_width_m=float(s.line_width_m)*1.15
		if s.shape in ["line","circle"] and not s.has("p2"):s.max_targets=ceili(float(s.max_targets)*1.15)
		if s.has("p2") and s.shape in ["circle_ground","circle_self","circle_target","zone_target","projectile_burst"]:s.radius_m*=1.05
	if not a.active_form.is_empty():
		s.form_at_cast=a.active_form.id
		var empowered_rows=registry.p2_forms[a.active_form.id].effect.empowered_skills if use_p2 and registry.p2_forms.has(a.active_form.id) else registry.form_rules[a.active_form.id].empowered_skills
		for empowered in empowered_rows:
			if empowered.skill_id==id:
				factor*=float(empowered.coefficient_multiplier)
				s.form_empowered_factor=float(empowered.coefficient_multiplier)
	for e in s.effects:
		if e.has("coefficient"):e.coefficient=float(e.coefficient)*factor
		if e.has("tick_coefficient"):e.tick_coefficient=float(e.tick_coefficient)*factor
	if s.has("p2"):
		var params=s.p2.effect.params
		# DEV ocular strain: extra 6% maximum chakra, charged through ordinary cast transaction.
		if params.get("eye_strain",false):s.chakra+=float(a.max_chakra)*0.06
		if params.get("requires_clone_or_basic_fallback",false) and owned_clone(a).is_empty():
			s.p2.effect.hit_count=1
			for e in s.effects:
				if e.type=="damage":e.coefficient=minf(float(e.coefficient),0.85*factor)
		if params.has("conditional_variant") and not a.active_form.get("id","") in params.conditional_variant.throw_if_active_forms:
			s.shape=params.conditional_variant.default_shape
			s.range_m=float(params.conditional_variant.default_range_m)
			s.projectile_speed_m_s=0
			params.stop_m=0.65
		if params.has("field_modifier") and (environment=="storm" or elemental_fields.any(func(zone):return zone.element=="fire")):
			for e in s.effects:
				if e.has("coefficient"):e.coefficient=float(e.coefficient)*float(params.field_modifier.coefficient_multiplier)
	if use_depth:
		Depth.apply(registry,s,p,int(a.get("stars",1)))
		if id=="NIN-112-S4":s.cooldown_s=minf(float(s.cooldown_s),11.0*(1.0-rating(a,"cdr")))
	Passive.modify_skill(self,a,s)
	if use_depth and float(s.chakra)>0:s.chakra=maxf(1.0,ceilf(float(s.chakra)*100.0-0.0000001)/100.0)
	if use_depth and registry.depth_ultimates.has(id):s.kind="ultimate"
	return s

func utility(a: Dictionary,s: Dictionary,b: Dictionary) -> float:
	if not cast_geometry(a,s,b):return -INF
	if not ai_condition(a,s,b):return -INF
	if s.has("p2"):
		return p2_utility(a,s,b)+(Tactical.skill_bonus(self,a,b,s) if use_tactical and not a.summon else 0.0)
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
	if s.kind=="auto" and a.side==0 and not auto_player_ultimate and a.skills.size()>5 and not use_tactical and bool(s.ai.get("reserve_ultimate_chakra",true)):
		var ultimate_skill=effective_skill(a,a.skills[5])
		if a.chakra>=ultimate_skill.chakra and a.chakra-s.chakra<ultimate_skill.chakra: score-=35.0
	return score+(Tactical.skill_bonus(self,a,b,s) if use_tactical and not a.summon else 0.0)

func cast(a: Dictionary,s: Dictionary,b: Dictionary) -> bool:
	if not ready(a,s) or not cast_geometry(a,s,b) or not ai_condition(a,s,b):return false
	var ledger=skill_effect_ledger.get(s.skill_id,{"cast":0,"confirmed":0})
	ledger.cast+=1
	skill_effect_ledger[s.skill_id]=ledger
	if s.has("p2"):
		p2_casts+=1
		var params=s.p2.effect.params
		if params.get("once_per_battle",false) or params.get("finite_per_battle",false):
			if not a.has("p2_used"):a.p2_used={}
			a.p2_used[s.skill_id]=int(a.p2_used.get(s.skill_id,0))+1
	var before_cp=float(a.chakra)/maxf(1.0,float(a.max_chakra))
	cp_adjust(a,-float(s.chakra),"cast")
	a.cooldowns[s.skill_id]=float(s.cooldown_s)
	a.busy=float(s.cast_s)+float(s.recovery_s)/(1.0+rating(a,"attack_speed"))
	a.last=skill_name(s.skill_id)
	cast_seq+=1
	s=s.duplicate(true)
	s.passive_cast_id=cast_seq
	if s.chakra>0:Passive.queue(self,a,a,s,"chakra_threshold_crossed",before_cp,float(a.chakra)/maxf(1.0,float(a.max_chakra)))
	record_typed_passives(a,s,"cp")
	a.pending={"skill":s,"target_uid":b.uid,"origin":a.pos,"aim":b.pos,"cast_id":cast_seq}
	a.cast_left=float(s.cast_s)
	a.cast_started=ticks
	a.facing=(Vector2(b.pos)-Vector2(a.pos)).normalized() if b.uid!=a.uid else a.get("facing",Vector2.RIGHT if a.side==0 else Vector2.LEFT)
	animation_event(a,"attack" if s.kind=="basic" else "cast",s,b)
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
	if e.has("fixed_dot_total_coefficient"):key=id+":"+str(a.uid)+":"+str(e.get("fixed_dot_skill",""))
	if not b.statuses.has(key) and (rule.stack=="per_source" or e.has("fixed_dot_total_coefficient")):
		var count=0
		for item in b.statuses.values():
			if item.id==id:count+=1
		if count>=int(rule.max_stacks):return
	var duration=float(e.get("duration_s",rule.duration_s))
	if rule.hard_control:duration*=clampf((1.0+rating(a,"control_duration"))*(1.0-rating(b,"control_resist")),0.3,1.8)
	if id=="sleep" and b.uid==boss_actor_uid:duration=minf(duration,0.5)
	if id=="beguile_tactical" and b.uid==boss_actor_uid:duration=minf(duration,0.7)
	var mag=float(e.get("magnitude",0.2))
	if id=="attack_down":mag=clampf(mag,0.0,0.4)
	if rule.stack=="max" and b.statuses.has(key):
		duration=maxf(duration,float(b.statuses[key].remaining))
		mag=maxf(mag,float(b.statuses[key].magnitude))
	b.statuses[key]={"id":id,"source":a.uid,"remaining":duration,"magnitude":mag,"dot":float(e.get("tick_coefficient",0.0))*float(a.natk)*form_multiplier(a,"natk"),"next_tick":1.0}
	if e.has("fixed_dot_total_coefficient"):
		var count=maxi(1,ceili(duration))
		var total=maxi(0,roundi(float(e.fixed_dot_total_coefficient)*float(a.natk)*form_multiplier(a,"natk")))
		b.statuses[key].fixed_dot={"count":count,"done":0,"total":total,"unit":floori(float(total)/count),"elapsed":0.0,"interval":duration/count}
		b.statuses[key].dot=0.0
	if rule.hard_control and a.side!=b.side:credit(a,"control_applied_s",duration)
	art_event("status_applied",b.pos,0,id)

func hit(a: Dictionary,b: Dictionary,dmg: float,allow_counter: bool=true,source_skill: Dictionary={}) -> void:
	if a.side!=b.side and int(b.get("teleport_safe_until",0))>ticks:return
	if b.has("p2_arc") and int(b.p2_arc.expires)>ticks and b.p2_arc.hp>0 and a.uid!=b.uid:
		var facing=Vector2(b.p2_arc.facing)
		var incoming=(Vector2(a.pos)-Vector2(b.pos)).normalized()
		if facing.dot(incoming)>=cos(deg_to_rad(float(b.p2_arc.angle)*0.5)):
			var absorbed=minf(dmg,float(b.p2_arc.hp))
			b.p2_arc.hp=float(b.p2_arc.hp)-absorbed
			credit(b,"absorbed",absorbed)
			dmg-=absorbed
	if dmg<=0:return
	if use_passives:dmg*=1.0-clampf(float(b.get("passive_mods",{}).get("damage_reduction",0)),0,0.10)
	if allow_counter and a.side!=b.side and b.has("p2_evade") and int(b.p2_evade.expires)>ticks and int(b.p2_evade.left)>0:
		b.p2_evade.left=int(b.p2_evade.left)-1
		art_event("miss",b.pos)
		if b.p2_evade.get("decoy_counter",false) and not b.counter.is_empty():
			var response=b.counter
			b.counter={}
			hit(b,a,float(b.patk)*float(response.coefficient)*100.0/(100.0+float(a.armor)),false)
		return
	var blocked=minf(float(b.shield),dmg)
	if blocked>0:credit(b,"absorbed",blocked)
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
		credit(a,"damage",old-b.hp)
		credit(b,"taken",old-b.hp)
		b.hit_until=ticks+4
		b.hit_started=ticks
		animation_event(b,"hit",source_skill,a)
		if b.hp<=0:
			b.fall_started=ticks
			animation_event(b,"fall",source_skill,a)
		art_event("damage",b.pos,old-b.hp)
		last_progress_tick=ticks
		if a.side!=b.side:award_action(b,"vitality")
		if a.uid!=b.uid:a.hp=minf(float(a.max_hp),float(a.hp)+(old-b.hp)*rating(a,"lifesteal"))
	if allow_counter and b.hp>0 and b.side!=a.side and a.hp>0 and not hard_block(b):
		if not b.counter.is_empty():
			var counter=b.counter
			b.counter={}
			var before_counter_hp=float(a.hp)
			hit(b,a,float(b.patk)*float(counter.coefficient)*100.0/(100.0+float(a.armor)),false)
			if before_counter_hp>float(a.hp) and counter.has("parent_skill"):Passive.queue(self,b,a,counter.parent_skill,"counter_triggered")
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
	for key in ["passive_base","passive_mods","passive_progress","passive_timed","passive_icd","passive_rearm"]:b.erase(key)
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
	b.summon_parent=s.get("passive_cast_id",0)
	b.summon_tracking_sent=false
	b.ttl=float(e.lifetime_s)
	b.hp=float(a.max_hp)*float(e.hp_owner_fraction)
	b.max_hp=b.hp
	b.patk=float(a.patk)*float(e.attack_owner_fraction)
	b.natk=float(a.natk)*float(e.attack_owner_fraction)
	b.skills=[a.skills[0]]
	if e.has("p2_role"):
		var role=str(e.p2_role)
		var p=e.p2_params
		var summon_skill=skill_definition(a.skills[0]).duplicate(true)
		summon_skill.erase("p2")
		summon_skill.skill_id="SUMMON-RUNTIME-"+str(b.uid)
		summon_skill.shape="single"
		summon_skill.target="enemy_ai"
		summon_skill.range_m=4.0 if role in ["ranged","ranged_puppet","element_ranged"] else 1.2
		summon_skill.projectile_speed_m_s=0
		summon_skill.chakra=0
		summon_skill.effects=[{"type":"damage","coefficient":0.85,"damage_type":"physical"}]
		if role in ["track_bind","bind"]:summon_skill.effects.append({"type":"apply_status","status_id":"bind","chance":0.8,"duration_s":float(p.get("on_contact_status_s",1.0))})
		if role in ["guard","frontline"]:summon_skill.effects.append({"type":"apply_status","status_id":"taunt","chance":0.7,"duration_s":1.0})
		if role=="heal_ally":
			summon_skill.target="ally_lowest_effective_hp"
			summon_skill.range_m=4.0
			summon_skill.cooldown_s=float(p.get("interval_s",2))
			summon_skill.effects=[{"type":"heal","coefficient":float(p.get("heal_coefficient",0.35))}]
			summon_skill.ai.condition="ally_hp_below_0.75"
			b.natk=float(a.natk)
		encounter_skills[summon_skill.skill_id]=summon_skill
		encounter_names[summon_skill.skill_id]="Triệu hồi • "+role
		b.skills=[summon_skill.skill_id]
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
	for cp_key in ["cp_units","cp_max_units","cp_remainder"]:b.erase(cp_key)
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
					var defense=maxf(0.0,float(target.armor if physical else target.nres)*form_multiplier(target,"armor" if physical else "nres")*(1.0+magnitude(target,"defense_up"))-float(a.stats.get("armor_pen" if physical else "magic_pen",0)))
					if e.damage_type=="genjutsu":defense=float(target.stats.genjutsu_resist)
					defense*=formation_multiplier(target,"defense")
					var realm_factor=clampf(1.0+0.04*(int(a.realm)-int(target.realm)),0.75,1.25)
					var element_factor=float(registry.affinity.get(str(s.element)+":"+str(target.element),1.0))*maxf(field_factor,reaction(a,target,str(s.element)) if field_factor==1.0 else 1.0)*float(registry.environments.get(environment,{}).get("modifiers",{}).get(s.element,1.0))
					if s.element!="neutral":element_factor*=1.0+rating(a,"element_power")
					var hit_rate=clampf(0.85+(rating(a,"accuracy")-rating(target,"evasion"))/(200.0+absf(rating(a,"accuracy")-rating(target,"evasion")))+magnitude(a,"accuracy_up")-magnitude(a,"blind")-magnitude(a,"steam")-magnitude(target,"evasion"),0.15,0.99)
					if rng.randf()<hit_rate:
						if s.kind!="basic" and a.side!=target.side:
							var drain=minf(float(target.chakra),float(s.chakra)*rating(a,"chakra_drain")*(1.0-rating(target,"chakra_drain_resist")))
							var taken=-cp_adjust(target,-drain,"hostile_drain")
							if use_depth:refund_parent_cp(a,s,taken*rating(a,"chakra_conversion"),"conversion")
							else:cp_adjust(a,taken*rating(a,"chakra_conversion"),"conversion")
						var before_hp=float(target.hp)
						var crit=1.5+rating(a,"crit_damage") if e.damage_type!="genjutsu" and rng.randf()<maxf(0.0,rating(a,"pcrit" if physical else "ncrit")-rating(target,"crit_resist")) else 1.0
						hit(a,target,maxf(1.0,round(attack*float(e.coefficient)*100.0/(100.0+defense)*realm_factor*element_factor*crit*(1.0-minf(0.65,rating(target,"damage_reduction"))))),true,s)
						if before_hp-float(target.hp)>0.01 and target.side!=a.side:
							confirm_form_effect(a,s,"damage")
							combo_record(a,s,"contact_or_effect_confirmed",target,target.pos)
							record_typed_passives(a,s,"coefficient","damage")
							award_action(a,"strength" if physical else "intellect")
							if not a.summon and not target.summon and a.hp>0:
								if target.hp>0:
									Passive.queue(self,a,target,s,"hostile_damage_confirmed")
									Passive.queue(self,target,a,s,"damage_taken_confirmed")
									Passive.queue(self,target,a,s,"hp_threshold_crossed",before_hp/maxf(1.0,float(target.max_hp)),float(target.hp)/maxf(1.0,float(target.max_hp)))
								else:Passive.queue(self,a,target,s,"kill_confirmed")
								if crit>1.0:Passive.queue(self,a,target,s,"critical_hit_confirmed")
								Passive.queue(self,a,target,s,"contact_or_effect_confirmed")
				"heal":
					var before_hp=float(target.hp)
					target.hp=minf(float(target.max_hp),float(target.hp)+float(a.natk)*form_multiplier(a,"natk")*float(e.coefficient)*(1.0+rating(a,"healing"))*(1.0+float(target.get("passive_mods",{}).get("healing_received",0)))*(1.0-clampf(magnitude(target,"antiheal"),0.0,0.9)))
					if target.hp-before_hp>0.01:
						confirm_form_effect(a,s,"heal")
						combo_record(a,s,"heal_confirmed",target,target.pos)
						award_action(a,"spirit")
						record_typed_passives(a,s,"coefficient","heal")
						credit(a,"heal",float(target.hp)-before_hp)
						art_event("heal",target.pos,float(target.hp)-before_hp)
						Passive.queue(self,a,target,s,"heal_confirmed")
						Passive.queue(self,a,target,s,"contact_or_effect_confirmed")
				"shield":
					var prior_shield=float(target.shield)
					add_shield(a,target,float(a.natk)*form_multiplier(a,"natk")*float(e.coefficient),float(e.duration_s))
					if float(target.shield)>prior_shield:
						confirm_form_effect(a,s,"shield")
						record_typed_passives(a,s,"coefficient","shield")
						Passive.queue(self,a,target,s,"contact_or_effect_confirmed")
				"apply_status":
					var before_status=target.statuses.duplicate(true)
					apply_status(a,target,e)
					if before_status!=target.statuses:
						confirm_form_effect(a,s,"status")
						if target.side!=a.side:combo_record(a,s,"contact_or_effect_confirmed",target,target.pos)
						record_typed_passives(a,s,"duration",str(e.status_id))
						Passive.queue(self,a,target,s,"status_applied")
						Passive.queue(self,a,target,s,"contact_or_effect_confirmed")
						if a.uid==target.uid and str(e.status_id) in ["attack_up","defense_up","evasion","haste","accuracy_up","chakra_up"]:
							combo_record(a,s,"stance_effect_confirmed",target,target.pos)
							Passive.queue(self,a,target,s,"stance_effect_confirmed")
				"cleanse":
					var keys=target.statuses.keys()
					keys.sort_custom(func(x,y):return float(target.statuses[x].remaining)>float(target.statuses[y].remaining))
					var count=0
					for key in keys:
						if registry.status_catalog[target.statuses[key].id].dispellable and target.statuses[key].id in ["stun","bind","silence","slow","blind","burn","poison","wet","freeze","shock","mark","chakra_lock","taunt","antiheal","fear","mud","steam","sleep","attack_down","beguile_tactical"]:
							target.statuses.erase(key)
							count+=1
							if count>=int(e.max_statuses)+(1 if rng.randf()<rating(a,"cleanse") else 0):break
					if use_passives:count+=Passive.cleanse(target,maxi(0,int(e.max_statuses)-count))
					if count>0:
						combo_record(a,s,"cleanse_effective",target,target.pos)
						Passive.queue(self,a,target,s,"cleanse_effective")
						Passive.queue(self,a,target,s,"contact_or_effect_confirmed")
				"chakra_restore":
					var old_cp=float(a.chakra)
					cp_adjust(a,float(e.amount),"restore")
					if a.chakra>old_cp:Passive.queue(self,a,target,s,"resource_effect_confirmed")
				"dash":move_actor(a,target.pos,minf(float(e.max_distance_m),maxf(0.0,a.pos.distance_to(target.pos)-float(e.stop_distance_m))))
				"summon":
					var prior_count=actors.size()
					summon_actor(a,s,e)
					if actors.size()>prior_count:
						combo_record(a,s,"summon_spawned",a,a.pos)
						record_typed_passives(a,s,"summon")
						Passive.queue(self,a,target,s,"summon_spawned")
						Passive.queue(self,a,target,s,"contact_or_effect_confirmed")
				"temporary_stance":
					a.stance={"remaining":float(e.duration_s),"stat":e.stat,"multiplier":e.multiplier}
					combo_record(a,s,"stance_effect_confirmed",target,target.pos)
					Passive.queue(self,a,target,s,"stance_effect_confirmed")
				"counter":a.counter={"remaining":float(e.window_s),"coefficient":e.coefficient,"parent_skill":s}
				"activate_form":
					if activate_form(a,str(e.form_id),false,str(s.skill_id)):
						combo_record(a,s,"form_activated",a,a.pos)
						Passive.queue(self,a,target,s,"form_activated")
	if s.get("p2_subhit",false):return
	if int(a.side)==0 and not a.summon:
		mastery_counts[s.skill_id]=int(mastery_counts.get(s.skill_id,0))+maxi(1,roundi(1.0+rating(a,"mastery_speed")))
	if not use_p2 and not a.summon and not a.get("beast",false) and registry.ninjas.has(a.id) and registry.ninjas[a.id].unique_talent_design.skill_id==s.skill_id:
		signature_ticks[str(a.side)+":"+str(a.id)]=ticks
		try_combo(a)
	log.append(str(a.id)+" · "+skill_name(s.skill_id))
	if log.size()>6:log.pop_front()

func ultimate(index: int) -> bool:
	if index<0 or index>=actors.size():return false
	var a=actors[index]
	if a.side!=0 or a.hp<=0 or a.summon or a.skills.size()<6:return false
	if use_depth and ultimate_requests.get(a.uid,"")==a.skills[5]:return true
	return ultimate_skill(index,a.skills[5])

func ultimate_skill(index: int,id: String) -> bool:
	if not outcome.is_empty() or index<0 or index>=actors.size():return false
	var a=actors[index]
	if a.side!=0 or a.hp<=0 or a.summon or not id in a.skills:return false
	var s=effective_skill(a,id)
	if s.kind!="ultimate":return false
	if not use_depth:return cast(a,s,target_for(a,s))
	if ultimate_requests.get(a.uid,"")==id:
		ultimate_requests.erase(a.uid)
		ultimate_cancelled[id]=int(ultimate_cancelled.get(id,0))+1
		return true
	var prior=str(ultimate_requests.get(a.uid,""))
	if not prior.is_empty():ultimate_cancelled[prior]=int(ultimate_cancelled.get(prior,0))+1
	ultimate_requests[a.uid]=id
	return true

func ultimate_reason(a: Dictionary,id: String) -> String:
	if not outcome.is_empty():return "Trận đã kết thúc"
	if a.is_empty() or a.get("hp",0)<=0:return "KO"
	if not id in a.skills:return "Chưa mở khóa"
	var s=effective_skill(a,id)
	if s.kind!="ultimate":return "Không phải tuyệt kỹ"
	if not a.pending.is_empty() and a.pending.skill.skill_id==id:return "Đang thi triển"
	if float(a.cooldowns.get(id,0))>0:return "Hồi %.1fs" % float(a.cooldowns[id])
	if not cp_affordable(a,float(s.chakra)):return "Chờ CP"
	if s.has("p2"):
		var cond=s.p2.conditions
		if int(a.realm)<int(cond.get("unlock_realm",0)):return "Thiếu cảnh giới"
		if cond.has("any_active_forms") and not a.active_form.get("id","") in cond.any_active_forms:return "Cần hình thái"
		if cond.has("requires_unlocked_form") and not cond.requires_unlocked_form in a.forms:return "Chưa mở hình thái"
		if s.p2.effect.params.get("requires_clone",false) and owned_clone(a).is_empty():return "Cần phân thân"
		if s.p2.effect.params.get("requires_owned_clone_or_anchor",false) and cable_anchor(a).is_empty():return "Cần vật neo"
	if hard_block(a):return "Đang bị khống chế"
	if not ready(a,s):return "Chờ hành động/điều kiện"
	var target=target_for(a,s)
	if target.is_empty() and s.has("p2") and s.p2.conditions.ai=="owned_valid_mark_or_explicit_swap":return "Cần dấu ấn hợp lệ"
	if not cast_geometry(a,s,target) or not ai_condition(a,s,target):return "Chờ mục tiêu/tầm đánh"
	return "Sẵn sàng"

func update_status(a: Dictionary,dt: float) -> void:
	a.immune=maxf(0.0,float(a.immune)-dt)
	a.contract_cd=maxf(0.0,float(a.contract_cd)-dt)
	for id in a.form_cooldowns:a.form_cooldowns[id]=maxf(0.0,float(a.form_cooldowns[id])-dt)
	if not a.active_form.is_empty():
		a.active_form.remaining=float(a.active_form.remaining)-dt
		if use_p2 and registry.p2_forms.has(a.active_form.id):
			var drain=float(registry.p2_forms[a.active_form.id].effect.chakra_drain_per_s)*dt
			cp_continuous(a,-drain,"form_drain")
			if drain>0 and a.chakra<=0:a.active_form.remaining=0
		if a.active_form.remaining<=0:
			animation_event(a,"form_end",{"skill_id":a.active_form.id},a)
			a.active_form={}
	if a.get("combo_regen_until",0)>ticks and a.hp>0:
		var previous=float(a.hp)
		a.hp=minf(float(a.max_hp),float(a.hp)+float(a.max_hp)*0.01*dt*(1.0-clampf(magnitude(a,"antiheal"),0.0,0.9)))
		var source=actor_by_uid(int(a.get("combo_regen_owner",0)))
		if not source.is_empty():credit(source,"heal",float(a.hp)-previous)
			
	for id in a.forms:
		var rule=registry.form_rules[id]
		if rule.activation=="hp_threshold_or_manual" and a.hp/a.max_hp<=float(rule.hp_threshold) and not a.get("hp_auto_forms",{}).has(id):
			if activate_form(a,id,true):
				if not a.has("hp_auto_forms"):a.hp_auto_forms={}
				a.hp_auto_forms[id]=true
	a.hp=minf(float(a.max_hp),float(a.hp)+float(a.stats.get("hp_regen",0))*dt*(1.0-clampf(magnitude(a,"antiheal"),0.0,0.9)))
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
		if st.has("fixed_dot"):
			var budget=st.fixed_dot
			budget.elapsed=float(budget.elapsed)+dt
			while int(budget.done)<int(budget.count) and float(budget.elapsed)+0.00001>=float(budget.interval)*(int(budget.done)+1):
				var source=actor_by_uid(int(st.source))
				if source.is_empty() or source.hp<=0 or a.hp<=0:break
				budget.done=int(budget.done)+1
				var portion=int(budget.unit) if int(budget.done)<int(budget.count) else int(budget.total)-int(budget.unit)*(int(budget.count)-1)
				hit(source,a,float(portion),false)
		elif st.dot>0:
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

# A queued ultimate must not starve its own authored automatic form prerequisite.
func requested_form_route(a: Dictionary,requested: Dictionary) -> String:
	var required: Array=requested.get("p2",{}).get("conditions",{}).get("any_active_forms",[])
	if required.is_empty() or a.active_form.get("id","") in required or not a.active_form.is_empty():return ""
	for id in a.skills:
		var route=decision_skill(a,id)
		if route.kind=="ultimate" or not supported(route):continue
		if route.has("p2") and not p2_ready(a,route):continue
		for e in route.effects:
			if e.type=="activate_form" and e.form_id in required and form_ready(a,str(e.form_id),false,str(id)):return str(id)
	return ""

func tick(dt: float) -> void:
	if not outcome.is_empty():return
	var started=Time.get_ticks_usec()
	ticks+=1
	signature_ready_cache.clear()
	Passive.refresh(self)
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
			ultimate_requests.erase(a.uid)
			continue
		update_status(a,dt)
		if a.hp<=0:
			a.pending={}
			ultimate_requests.erase(a.uid)
			continue
		if a.uid==boss_actor_uid:update_boss(a)
		a.busy=maxf(0.0,float(a.busy)-dt)
		a.shield_time=maxf(0.0,float(a.shield_time)-dt)
		if a.shield_time<=0 and a.shield_sources.is_empty():a.shield=0.0
		cp_continuous(a,float(a.regen)*form_multiplier(a,"chakra_regen")*dt*formation_multiplier(a,"chakra")*(1.0+magnitude(a,"chakra_up"))*(1.0-clampf(magnitude(a,"chakra_lock"),0.0,0.9)),"regen")
		for id in a.cooldowns:a.cooldowns[id]=maxf(0.0,float(a.cooldowns[id])-dt)
		if not a.pending.is_empty():
			var pending=a.pending
			var skill=pending.skill
			if (hard_block(a) or (has_status(a,"silence") and skill.damage_type!="physical")) and skill.interruptible:
				cp_adjust(a,0.8*float(skill.chakra),"interrupt_refund")
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
		decision_effective.clear()
		decision_uid=int(a.uid)
		if use_depth and ultimate_requests.has(a.uid):
			var intent=str(ultimate_requests[a.uid])
			var requested=decision_skill(a,intent)
			if cast(a,requested,target_for(a,requested)):
				a.ai_goal=a.pos
				ultimate_requests.erase(a.uid)
				ultimate_executed[intent]=int(ultimate_executed.get(intent,0))+1
				continue
		if a.has("ai_goal") and ticks%int(registry.tactics.ai_interval_ticks)!=int(a.uid)%int(registry.tactics.ai_interval_ticks):
			var follow=true
			if use_e3_movement and not a.summon:
				var focus=actor_by_uid(int(a.get("focus_uid",0)))
				var dodging=ticks<int(a.get("dodge_until",0)) and Tactical.hazard(self,a,a.pos)>0
				var retreating=ticks<int(a.get("retreat_motion_until",0))
				if not dodging and not retreating and not ultimate_requests.has(a.uid):
					if focus.is_empty() or focus.hp<=0 or cast_geometry(a,decision_skill(a,a.skills[0]),focus):
						follow=false
						if Vector2(a.ai_goal).distance_to(a.pos)>0.05:e3_metrics.stale_goals_cancelled+=1
						a.ai_goal=a.pos
			if follow and not has_status(a,"bind"):move_actor(a,a.ai_goal,movement_speed(a)*dt)
			continue
		var basic=decision_skill(a,a.skills[0])
		var enemy=target_for(a,basic)
		if enemy.is_empty():continue
		if use_contract_v10 and a.summon and a.get("summon_skill","")=="NIN-004-S2" and not a.get("summon_tracking_sent",false) and enemy.side!=a.side:
			a.tracking_target_uid=enemy.uid
			if cast_geometry(a,basic,enemy):confirm_tracking(a,enemy)
		if use_tactical and not a.summon:
			if int(a.get("focus_uid",0))!=int(enemy.uid):
				tactical_metrics.focus_switches+=1
				a.focus_until=ticks+(30 if use_e3_movement else 16)
			a.focus_uid=enemy.uid
			if not has_status(a,"bind"):
				var dodge=Tactical.avoid(self,a)
				if dodge!=a.pos:
					a.ai_goal=dodge
					a.dodge_until=ticks+(20 if use_e3_movement else 10)
					move_actor(a,dodge,movement_speed(a)*dt)
					tactical_metrics.dodge_moves+=1
					continue
		var best={}
		var best_target={}
		var best_score=0.0
		var reservation={}
		var form_route=""
		var reserve_cp=0.0
		if use_depth and ultimate_requests.has(a.uid):
			reservation=decision_skill(a,str(ultimate_requests[a.uid]))
			form_route=requested_form_route(a,reservation)
			reserve_cp=float(reservation.chakra)
			if form_route!="":reserve_cp+=float(decision_skill(a,form_route).chakra)
			reserve_cp=minf(float(a.max_chakra),reserve_cp)
		if a.uid==boss_actor_uid and not boss_phases.priority.is_empty():
			var skill_id=str(boss_phases.priority[0])
			var priority_skill=effective_skill(a,skill_id)
			if cast(a,priority_skill,target_for(a,priority_skill)):
				boss_phases.priority.pop_front()
				continue
		for id in a.skills:
			var s=decision_skill(a,id)
			if (s.kind=="ultimate" and a.side==0 and not auto_player_ultimate) or not ready(a,s):continue
			if not reservation.is_empty() and s.kind!="ultimate":
				if form_route!="" and id==form_route:
					if not cp_affordable(a,reserve_cp):continue
				elif s.chakra>0 and a.chakra-s.chakra<reserve_cp and not survival_override(a,s):continue
				if form_route!="" and id!=form_route and s.effects.any(func(e):return e.type=="activate_form"):continue
			var b=target_for(a,s)
			var score=utility(a,s,b)
			if form_route!="" and id==form_route and score>-INF:score+=100.0
			if use_tactical and score>0:
				if not a.has("meaningful_since"):a.meaningful_since={}
				if not a.meaningful_since.has(id):a.meaningful_since[id]=ticks
				score+=minf(12.0,maxf(0.0,float(ticks-int(a.meaningful_since[id]))-float(s.cooldown_s)*40.0)*0.04)
			if score>best_score:
				best=s
				best_target=b
				best_score=score
		# A legal manually queued ultimate takes movement priority over repeated basic attacks.
		# Keep pathing, dodge, bind, costs and emergency allied support intact.
		if use_tactical and not reservation.is_empty() and form_route=="" and not has_status(a,"bind") and ready(a,reservation) and reservation.target!="self":
			var intended_target=target_for(a,reservation)
			if not intended_target.is_empty() and ai_condition(a,reservation,intended_target) and not cast_geometry(a,reservation,intended_target):
				if best.is_empty() or not survival_override(a,best):
					a.ai_goal=Vector2(intended_target.pos)
					a.goal_until=ticks+8
					move_actor(a,a.ai_goal,movement_speed(a)*dt)
					continue
		# Backline units may make a short safe retreat between casts. Do not delay
		# active ultimate requests, healing, control or a legal non-basic skill.
		if use_tactical and not a.summon and reservation.is_empty() and not has_status(a,"bind") and (best.is_empty() or best.kind=="basic") and ticks>=int(a.get("backline_until",0)):
			var retreat=Tactical.backline_goal(self,a,enemy,basic)
			if not retreat.is_equal_approx(a.pos):
				a.ai_goal=retreat
				a.goal_until=ticks+4
				a.backline_until=ticks+(48 if use_e3_movement else 16)
				a.retreat_motion_until=ticks+4
				move_actor(a,retreat,movement_speed(a)*dt)
				continue
		if not best.is_empty():
			if cast(a,best,best_target):
				runtime_metrics.cast_choices+=1
				if a.has("meaningful_since"):a.meaningful_since.erase(best.skill_id)
				if use_tactical and best_target.side!=a.side and best.kind=="basic":a.focus_uid=best_target.uid
			a.ai_goal=a.pos
			tactical_choices+=1
		elif not has_status(a,"bind"):
			var goal=tactical_goal(a,enemy,basic)
			if use_e3_movement and not a.summon and goal.distance_to(a.pos)<0.18:
				goal=a.pos
				e3_metrics.holds+=1
			a.ai_goal=goal
			a.goal_until=ticks+8
			move_actor(a,goal,movement_speed(a)*dt)
	# Remove dead temporary entities only once their launched projectiles resolve.
	for a in actors.duplicate():
		if a.summon and a.hp<=0 and not projectiles.any(func(p):return p.source==a.uid):actors.erase(a)
	decision_uid=0
	decision_effective.clear()
	Passive.flush(self)
	if use_tactical and ticks%10==0:sample_spacing()
	if use_tactical and ticks%100==0:update_pressure()
	runtime_metrics.max_actors=maxi(int(runtime_metrics.max_actors),actors.size())
	runtime_metrics.max_jobs=maxi(int(runtime_metrics.max_jobs),p2_jobs.size())
	runtime_metrics.max_projectiles=maxi(int(runtime_metrics.max_projectiles),projectiles.size())
	var elapsed=Time.get_ticks_usec()-started
	runtime_metrics.tick_usec_total+=elapsed
	runtime_metrics.tick_usec_max=maxi(int(runtime_metrics.tick_usec_max),elapsed)
	deadlock=ticks-last_progress_tick>=2400 or (pressure_mode and ticks-pressure_since>=1200)
	if primary_alive(1).is_empty():outcome="win"
	elif primary_alive(0).is_empty():outcome="loss"

func form_ready(a: Dictionary,id: String,manual: bool,trigger_id: String="") -> bool:
	if a.summon or a.hp<=0 or not id in a.forms or not a.active_form.is_empty():return false
	if float(a.form_cooldowns.get(id,0))>0:return false
	var rule=registry.form_rules[id]
	if use_contract_v10 and form_routes_dev.has(id):
		var contract=form_routes_dev[id]
		if a.id!=contract.ninja or int(a.realm)<int(contract.unlock_realm):return false
		if manual:
			var permitted=contract.mode in ["manual_stance","hp_threshold_or_manual"] or rule.activation in ["manual","manual_stance","hp_threshold_or_manual"]
			return permitted and cp_affordable(a,float(contract.manual_cp)) and not hard_block(a)
		return trigger_id in a.skills and contract.skill_routes.any(func(route):return route.id==trigger_id)
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
	if use_p2 and registry.p2_forms.has(id):
		var route=registry.p2_forms[id].activation
		if route.mode in ["manual_stance","hp_threshold_or_manual"] or not route.legacy_routes.is_empty():return a.chakra>=float(route.manual_chakra) and not hard_block(a)
	return rule.activation!="skill_trigger" and a.chakra>=float(rule.manual_chakra) and not hard_block(a)

func activate_form(a: Dictionary,id: String,manual: bool,trigger_id: String="") -> bool:
	if not form_ready(a,id,manual,trigger_id):return false
	var rule=registry.form_rules[id]
	var p2_rule=registry.p2_forms.get(id,{}).get("activation",{}) if use_p2 else {}
	if manual:
		var cost=float(form_routes_dev[id].manual_cp) if use_contract_v10 and form_routes_dev.has(id) else float(p2_rule.get("manual_chakra",rule.manual_chakra))
		cp_adjust(a,-cost,"manual_form")
	a.active_form={"id":id,"remaining":float(p2_rule.get("duration_s",rule.duration_s))}
	a.form_cooldowns[id]=float(p2_rule.get("cooldown_s",rule.cooldown_s))
	form_receipts[id]=int(form_receipts.get(id,0))+1
	animation_event(a,"form",{"skill_id":id},a)
	art_event("form_activated",a.pos,0,id)
	return true

func form_multiplier(a: Dictionary,stat: String) -> float:
	if a.active_form.is_empty():return 1.0
	if use_p2 and registry.p2_forms.has(a.active_form.id):return float(registry.p2_forms[a.active_form.id].effect.stat.get(stat,1.0))
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
		cp_adjust(a,float(modifier.get("chakra_restore",0)),"talent")
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
	cp_adjust(a,-30.0,"contract")
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
	var nearby_allies=primary_alive(int(a.side)) if use_depth else []
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
			if use_depth:
				for ally in nearby_allies:
					if ally.uid==a.uid:continue
					var spacing=body_radius(a)+body_radius(ally)+0.35
					score-=maxf(0.0,spacing-candidate.distance_to(ally.pos))*2.0
			if score>best:
				best=score
				chosen=candidate
		if chosen==origin:break
		a.pos=chosen
		remaining-=amount
	if a.pos.distance_to(initial)>0.001:
		if use_contract_v10 and a.summon and a.get("summon_skill","")=="NIN-004-S2":
			var tracked=actor_by_uid(int(a.get("tracking_target_uid",0)))
			if not tracked.is_empty() and a.pos.distance_to(tracked.pos)<initial.distance_to(tracked.pos):confirm_tracking(a,tracked)
		var direction_now=(Vector2(a.pos)-initial).normalized()
		if not a.summon:
			e3_metrics.distance+=a.pos.distance_to(initial)
			if a.has("e3_last_motion") and ticks-int(a.get("e3_last_motion_tick",0))<=8 and direction_now.dot(Vector2(a.e3_last_motion))< -0.5:e3_metrics.reversals+=1
			a.e3_last_motion=direction_now
			a.e3_last_motion_tick=ticks
		a.facing=direction_now
		if int(a.get("move_until",0))<ticks:a.move_started=ticks
		a.move_until=ticks+3
		if use_tactical:tactical_metrics.movement_steps+=1

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
	return float(rules.body_radius)* (0.65 if int(a.get("p2_shrink_until",0))>ticks else 1.0)

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
	if use_passives and Passive.has_debuff(a):return true
	for status in a.statuses.values():
		if registry.status_catalog[status.id].dispellable and status.id in ["stun","bind","silence","slow","blind","burn","poison","wet","freeze","shock","mark","chakra_lock","taunt","antiheal","fear","mud","steam","sleep","attack_down","beguile_tactical"]:return true
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
	if a.statuses.has("beguile_tactical") and int(a.statuses.beguile_tactical.source)==int(b.uid):return false
	if s.target.begins_with("ally")!=(a.side==b.side):return false
	return a.pos.distance_to(b.pos)<=float(s.range_m)+body_radius(b) and clear_segment(a.pos,b.pos,0.03)

func tactical_goal(a: Dictionary,enemy: Dictionary,basic: Dictionary) -> Vector2:
	if use_tactical and not a.summon:return Tactical.goal(self,a,enemy,basic)
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
		if blocked and use_passives:
			for wall in terrain:
				if not wall.has("owner") or not wall.has("parent_skill"):continue
				var owner=actor_by_uid(int(wall.owner))
				if owner.is_empty() or owner.side==source.side:continue
				var rect: Rect2=wall.rect.grow(0.03)
				if rect.has_point(to) or rect.has_point(from) or Geometry2D.segment_intersects_segment(from,to,rect.position,Vector2(rect.end.x,rect.position.y))!=null or Geometry2D.segment_intersects_segment(from,to,rect.position,Vector2(rect.position.x,rect.end.y))!=null or Geometry2D.segment_intersects_segment(from,to,rect.end,Vector2(rect.end.x,rect.position.y))!=null or Geometry2D.segment_intersects_segment(from,to,rect.end,Vector2(rect.position.x,rect.end.y))!=null:
					Passive.queue(self,owner,source,wall.parent_skill,"wall_blocked")
					break
		if not blocked and p2_intercept_segment(source,from,to):blocked=true
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
				if skill.has("p2") and target.has("p2_absorb") and int(target.p2_absorb.expires)>ticks and int(target.p2_absorb.left)>0 and Vector2(target.p2_absorb.facing).dot(-Vector2(p.direction))>=cos(deg_to_rad(float(target.p2_absorb.angle)*0.5)):
					target.p2_absorb.left=int(target.p2_absorb.left)-1
					var old_absorb_cp=float(target.chakra)
					cp_adjust(target,float(target.p2_absorb.chakra),"absorb")
					if target.chakra>old_absorb_cp and target.p2_absorb.has("parent_skill"):Passive.queue(self,target,source,target.p2_absorb.parent_skill,"resource_effect_confirmed")
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
					if skill.get("mark_teleport_throw",false):
						if source.hp<=0:continue
						var marked=hits[0]
						p2_set_mark(source,marked,skill.p2.effect.params)
						Passive.queue(self,source,marked,skill,"mark_effect_confirmed")
						if not land_near(source,marked):continue
						source.teleport_safe_until=ticks+roundi(float(skill.p2.effect.params.invulnerability_s)*20)
						Passive.queue(self,source,marked,skill,"teleport_arrived")
						art_event("teleport",source.pos,0,str(skill.skill_id))
					var actual=hits if skill.shape!="projectile_burst" else p2_targets(source,skill,hits[0].pos,Vector2(p.direction),hits[0])
					p2_schedule(source,skill,hits[0].pos,Vector2(p.direction),actual,int(p.cast_id))
				else:release(source,skill,hits[0],hits)

func movement_speed(a: Dictionary) -> float:
	return 2.2*formation_multiplier(a,"move")*(1.0+rating(a,"move_speed"))*(1.0+magnitude(a,"haste"))*(1.0-clampf(maxf(magnitude(a,"slow"),magnitude(a,"mud")),0.0,0.8))*terrain_speed(a.pos)

func p2_ready(a: Dictionary,s: Dictionary) -> bool:
	var cond=s.p2.conditions
	var params=s.p2.effect.params
	if params.get("requires_clone",false) and owned_clone(a).is_empty():return false
	if params.get("requires_owned_clone_or_anchor",false) and cable_anchor(a).is_empty():return false
	if params.has("retrieve") and retrieved_count(a)>=int(params.max_objects):return false
	if params.get("once_per_battle",false) or params.get("finite_per_battle",false):
		if int(a.get("p2_used",{}).get(s.skill_id,0))>=int(params.get("charges",1)):return false
	if int(a.realm)<int(cond.get("unlock_realm",0)):return false
	if cond.has("any_active_forms") and not a.active_form.get("id","") in cond.any_active_forms:return false
	if cond.has("forbidden_active_forms") and a.active_form.get("id","") in cond.forbidden_active_forms:return false
	if cond.has("requires_unlocked_form") and not str(cond.requires_unlocked_form) in a.forms:return false
	return true

func p2_condition(a: Dictionary,s: Dictionary,b: Dictionary) -> bool:
	if b.is_empty():return false
	var p=s.p2.effect.params
	if p.get("requires_owned_mark",false) and not p2_has_mark(a,b):return false
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
		"owned_valid_mark_or_explicit_swap":return s.p2.effect.type=="position_swap" or p.get("mark_throw_before_teleport",false) or p2_has_mark(a,b)
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
	var effective_coefficient=0.0
	for e in s.effects:
		if e.type in ["damage","heal","shield"]:effective_coefficient+=float(e.get("coefficient",0))
	var score=(effective_coefficient if use_tactical else float(s.p2.effect.total_coefficient))*18*count
	if kind in ["heal","heal_pulse"]:score=45.0 if not use_depth else 20.0+65.0*(1.0-float(b.hp)/maxf(1.0,float(b.max_hp)))
	if kind in ["shield","directional_shield"]:score=24.0 if b.shield<=0 else -25.0
	if use_depth and kind in ["shield","directional_shield"] and b.hp<b.max_hp*0.35:score+=25.0
	if kind in ["stance","team_buff","chakra_regen"]:score=18.0
	if kind=="summon":score=32.0
	if kind in ["cleanse","absorb","counter","activate_form"]:score=35.0
	if kind in ["wall","teleport","position_swap","mark","chakra_restore"]:score=17.0
	if kind in ["zone_damage","zone_drain","trap","beguile_tactical"]:score+=12
	if s.kind=="auto" and a.side==0 and not auto_player_ultimate and a.skills.size()>5 and not use_tactical:
		var ult=effective_skill(a,a.skills[5])
		if a.chakra>=ult.chakra and a.chakra-s.chakra<ult.chakra:score-=30
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
		elif shape=="cone":include=offset.length()<=float(s.range_m)+body_radius(b) and dir.dot(offset.normalized())>=cos(deg_to_rad(float(raw.effect.params.get("angle_deg",raw.geometry.extent))*0.5))
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
	if p2_marks.has(prefix+str(b.uid)):
		p2_marks[prefix+str(b.uid)]=ticks+roundi(float(p.get("mark_ttl_s",p.get("duration_s",8)))*20)
		return
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
	if s.shape=="wall":point=Vector2(a.pos).lerp(point,0.5)
	var direction=(point-Vector2(a.pos)).normalized()
	if s.shape not in ["circle_ground","zone_target","wall"] and not cast_geometry(a,s,b):
		missed_casts+=1
		art_event("miss",point,0,str(s.skill_id))
		return
	if s.shape in ["circle_ground","zone_target","wall"] and (a.pos.distance_to(point)>float(s.range_m)+0.35 or not clear_segment(a.pos,point,0.02)):
		missed_casts+=1
		return
	animation_event(a,"release",s,b)
	art_event("release",point,0,str(s.skill_id))
	if p.get("requires_owned_clone_or_anchor",false):
		var anchor=cable_anchor(a)
		if anchor.is_empty():return
		var end=Vector2(anchor.pos)
		var start=Vector2(a.pos)
		if start.distance_to(end)>float(s.range_m) or not clear_segment(start,end,0.02):return
		var victims=[]
		for target in alive(1-int(a.side)):
			if target.pos.distance_to(Geometry2D.get_closest_point_to_segment(target.pos,start,end))<=float(s.line_width_m)*0.5+body_radius(target):victims.append(target)
		victims.sort_custom(func(x,y):return x.pos.distance_to(start)<y.pos.distance_to(start))
		p2_schedule(a,s,end,(end-start).normalized(),victims.slice(0,int(s.max_targets)),int(pending.cast_id))
		return
	if p.get("mark_throw_before_teleport",false):
		# DEV throw speed 12m/s; swept hostile contact required before any mark or teleport.
		var thrown=s.duplicate(true)
		thrown.projectile_speed_m_s=12.0
		thrown.mark_teleport_throw=true
		projectiles.append({"source":a.uid,"target":b.uid,"skill":thrown,"origin":a.pos,"pos":a.pos,"direction":direction,"remaining":float(s.range_m)/12.0,"distance_left":float(s.range_m),"hit_ids":[],"cast_id":pending.cast_id,"contact_cap":1})
		art_event("projectile_spawn",a.pos,0,str(s.skill_id))
		return
	if kind=="projectile_intercept":
		var length_value=float(p.get("width_m",2.0))
		var thickness=float(p.get("thickness_m",0.45))
		var size_value=Vector2(thickness,length_value) if absf(direction.x)>=absf(direction.y) else Vector2(length_value,thickness)
		p2_intercepts.append({"owner":a.uid,"side":a.side,"rect":Rect2(point-size_value/2,size_value),"left":int(p.get("max_projectiles",1)),"expires":ticks+roundi(float(p.get("duration_s",6))*20)})
		p2_confirm(a,s,point,"contact_or_effect_confirmed")
		return
	if kind=="ritual_zone":
		if not p2_has_mark(a,b):return
		ritual_zones.append({"owner":a.uid,"point":point,"radius":float(p.trigger_radius_m),"expires":ticks+roundi(float(p.duration_s)*20),"cast_id":pending.cast_id})
		p2_schedule(a,s,point,direction,[],int(pending.cast_id))
		return
	if s.shape=="wall":
		var size_value=Vector2(float(p.get("thickness_m",0.45)),float(p.get("width_m",2.2)))
		var rect=Rect2(point-size_value/2,size_value)
		for unit in actors:
			if unit.hp>0 and rect.grow(body_radius(unit)).has_point(unit.pos):return
		if p.has("retrieve") and not retrieve_object(a,s,point,int(pending.cast_id),true):return
		terrain.append({"rect":rect,"kind":"obstacle","speed":1.0,"expires":ticks+roundi(float(p.get("duration_s",6))*20),"owner":a.uid,"parent_skill":s})
		p2_confirm(a,s,point,"contact_or_effect_confirmed")
		return
	if p.get("requires_owned_mark",false) and not p2_has_mark(a,b):return
	if p.has("retrieve") and not retrieve_object(a,s,point,int(pending.cast_id),false):return
	if int(p.get("consume_clone",0))>0:
		var clone=owned_clone(a)
		if clone.is_empty():return
		# Consume the clone on launch, before swept movement; it must not obstruct its owner.
		clone.hp=0
		art_event("expire",clone.pos,0,str(s.skill_id))
	if s.shape=="dash_contact":
		move_actor(a,b.pos,maxf(0.0,a.pos.distance_to(b.pos)-float(p.get("stop_m",0.65))))
		if a.pos.distance_to(b.pos)>body_radius(a)+body_radius(b)+0.25:return
	if p.get("consume_mark",false):p2_marks.erase(str(a.uid)+":"+str(b.uid))
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
		Passive.queue(self,a,b,s,"teleport_arrived")
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
	if kind in ["zone_damage","zone_drain","beguile_tactical"]:hits=mini(hits,maxi(1,int(p.get("hit_budget",hits))))
	var interval_exact=maxf(1.0,float(p.get("interval_s",p.get("tick_s",0.12)))*20.0)
	var interval=ceili(interval_exact)
	var dynamic=s.shape in ["circle_ground","zone_target"] or kind=="trap"
	var ids=targets.map(func(b):return b.uid)
	var start=ticks+roundi(float(p.get("delay_s",0))*20)
	var job={"source":a.uid,"skill":s,"point":point,"direction":direction,"ids":ids,"dynamic":dynamic,"cast_id":cast_id,"index":0,"hits":hits,"interval":interval,"interval_exact":interval_exact,"start":start,"next":start,"expires":start+maxi(hits*interval,roundi(float(p.get("duration_s",0))*20))+2,"confirmed":false}
	if p2_jobs.size()<256:p2_jobs.append(job)
	advance_p2()

func advance_p2() -> void:
	for zone in ritual_zones.duplicate():
		var owner=actor_by_uid(int(zone.owner))
		if int(zone.expires)<=ticks or owner.is_empty() or owner.hp<=0:ritual_zones.erase(zone)
	for item in retrieved_objects.duplicate():
		var owner=actor_by_uid(int(item.owner))
		if int(item.expires)<=ticks or owner.is_empty() or owner.hp<=0:retrieved_objects.erase(item)
	for barrier in p2_intercepts.duplicate():
		if int(barrier.expires)<=ticks or int(barrier.left)<=0:p2_intercepts.erase(barrier)
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
		if s.p2.effect.type=="ritual_zone":
			if not ritual_zones.any(func(zone):return int(zone.cast_id)==int(job.cast_id)):p2_jobs.erase(job);continue
			targets=targets.filter(func(unit):return p2_has_mark(a,unit)).slice(0,int(s.max_targets))
		if s.p2.effect.type in ["trap","ritual_zone"] and targets.is_empty():
			job.next=ticks+1
			continue
		for b in targets:
			var key=str(job.cast_id)+":"+str(b.uid)+":"+str(job.index)
			if p2_hits.has(key):continue
			p2_hits[key]=ticks
			var before_hp=float(b.hp)
			var before_actor_count=actors.size()
			var before_form=str(a.active_form.get("id",""))
			var before_chakra=float(b.chakra)
			var before_shield=float(b.shield)
			var before_status=b.statuses.duplicate(true)
			var before_pos=Vector2(a.pos)
			var before_evade=a.get("p2_evade",{}).duplicate(true)
			var before_shrink=int(a.get("p2_shrink_until",0))
			p2_apply(a,s,b,int(job.hits),int(job.index))
			var event="effect"
			if actors.size()>before_actor_count:event="summon_spawned"
			elif before_form!=str(a.active_form.get("id","")):event="form_activated"
			elif float(b.hp)>before_hp:event="heal_confirmed"
			elif float(b.hp)<before_hp or float(b.shield)!=before_shield or float(b.chakra)!=before_chakra or before_status!=b.statuses or before_pos!=a.pos or before_evade!=a.get("p2_evade",{}) or before_shrink!=int(a.get("p2_shrink_until",0)):event="contact_or_effect_confirmed"
			elif s.p2.effect.type in ["directional_shield","absorb","mark","projectile_mark","counter","teleport","position_swap"]:event="contact_or_effect_confirmed"
			if not job.confirmed and event!="effect":
				job.confirmed=true
				p2_confirm(a,s,b.pos,event,int(b.uid))
		job.index=int(job.index)+1
		job.next=maxi(ticks+1,int(job.get("start",ticks))+ceili(float(job.index)*float(job.get("interval_exact",job.interval))))
		if int(job.index)>=int(job.hits):p2_jobs.erase(job)
	for key in p2_hits.keys():
		if ticks-int(p2_hits[key])>600:p2_hits.erase(key)

func p2_apply(a: Dictionary,s: Dictionary,b: Dictionary,hits: int,index: int) -> void:
	var raw=s.p2
	var p=raw.effect.params
	var kind=str(raw.effect.type)
	var before_hp=float(b.hp)
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
	if p.get("interrupt_on_hit",false) and float(b.hp)<before_hp and not b.pending.is_empty() and b.pending.skill.interruptible:
		b.pending={}
		b.busy=0.0
		art_event("interrupt",b.pos,0,str(s.skill_id))
	if p.get("decoy_evasion_once",false) and index==0:
		a.p2_evade={"left":1,"expires":ticks+roundi(float(p.get("duration_s",4))*20),"decoy_counter":true}
	if p.has("shrink_target") and index==0:
		# Only caster body shrinks; no living target can be stored/shrunk by another unit.
		a.p2_shrink_until=ticks+roundi(float(p.get("duration_s",3))*20)
	if p.has("max_avoided_hits"):
		a.p2_evade={"left":int(p.max_avoided_hits),"expires":ticks+roundi(float(p.get("duration_s",3))*20)}
	if kind=="directional_shield":
		var facing=Vector2.RIGHT if a.side==0 else Vector2.LEFT
		for enemy in alive(1-int(a.side)):
			facing=(Vector2(enemy.pos)-Vector2(a.pos)).normalized()
			break
		var shield_coef=float(raw.effect.total_coefficient)
		for e in s.effects:
			if e.type=="shield":shield_coef=float(e.coefficient);break
		a.p2_arc={"hp":float(a.natk)*form_multiplier(a,"natk")*shield_coef,"angle":float(p.get("angle_deg",120)),"facing":facing,"expires":ticks+roundi(float(p.get("duration_s",4))*20)}
	if kind=="absorb":
		var facing=Vector2.RIGHT if a.side==0 else Vector2.LEFT
		for enemy in alive(1-int(a.side)):
			facing=(Vector2(enemy.pos)-Vector2(a.pos)).normalized()
			break
		a.p2_absorb={"left":int(p.get("max_projectiles",1)),"chakra":float(p.get("chakra_return",15)),"expires":ticks+roundi(float(p.get("duration_s",3))*20),"facing":facing,"angle":float(p.get("angle_deg",120)),"parent_skill":s}
	if kind in ["mark","projectile_mark"]:
		p2_set_mark(a,b,p)
		if p2_has_mark(a,b):
			combo_record(a,s,"mark_effect_confirmed",b,b.pos)
			Passive.queue(self,a,b,s,"mark_effect_confirmed")
	if kind=="chakra_restore":
		var old_cp=float(b.chakra)
		cp_adjust(b,float(p.get("chakra_amount",12)),"restore")
		if b.chakra>old_cp:Passive.queue(self,a,b,s,"resource_effect_confirmed")
	if kind in ["chakra_drain","zone_drain"]:
		var old_cp=float(b.chakra)
		var amount=0.0
		if b.side!=a.side:
			amount=-cp_adjust(b,-minf(float(b.chakra),float(p.get("chakra_amount",p.get("chakra_per_tick",3)))),"hostile_drain")
			var give=amount*float(p.get("transfer_fraction",0.3))
			if use_depth or s.get("depth_drain_contract",false):refund_parent_cp(a,s,give,"bounded_drain_refund")
			else:cp_adjust(a,give,"drain_refund")
		if amount>0:
			Passive.queue(self,a,b,s,"resource_effect_confirmed")
			if a.side!=b.side and not a.summon:Passive.queue(self,b,a,s,"chakra_threshold_crossed",old_cp/maxf(1.0,float(b.max_chakra)),float(b.chakra)/maxf(1.0,float(b.max_chakra)))
	var push=float(p.get("push_m",p.get("distance_m",0)))
	if push>0 and b.uid!=boss_actor_uid:
		var direction=(Vector2(b.pos)-Vector2(a.pos)).normalized()
		if p.get("direction","away")=="towards_caster":direction=-direction
		move_actor(b,Vector2(b.pos)+direction*push,push)

func p2_confirm(a: Dictionary,s: Dictionary,point: Vector2,event: String,target_uid: int=0) -> void:
	p2_resolved+=1
	var ledger=skill_effect_ledger.get(s.skill_id,{"cast":0,"confirmed":0})
	ledger.confirmed+=1
	skill_effect_ledger[s.skill_id]=ledger
	if a.side==0 and not a.summon:
		var parent=str(a.uid)+":"+str(s.get("passive_cast_id",0))+":"+str(s.skill_id)
		if not mastery_casts.has(parent) or int(s.get("passive_cast_id",0))==0:
			mastery_casts[parent]=true
			mastery_counts[s.skill_id]=int(mastery_counts.get(s.skill_id,0))+maxi(1,roundi(1.0+rating(a,"mastery_speed")))
	animation_event(a,"contact",s,actor_by_uid(target_uid),point)
	art_event("contact",point,0,str(s.skill_id))
	if not a.summon and not a.get("beast",false):
		if use_contract_v10:
			combo_record(a,s,event,actor_by_uid(target_uid),point)
		else:
			p2_events[str(a.side)+":"+str(s.skill_id)]={"tick":ticks,"uid":a.uid,"event":event,"target_uid":target_uid,"point":point}
			p2_combo(a,point,target_uid)
	log.append(str(a.id)+" · "+skill_name(s.skill_id))
	if log.size()>6:log.pop_front()

func p2_combo(a: Dictionary,point: Vector2,target_uid: int) -> void:
	if use_contract_v10:
		combo_resolve(a)
		return
	for combo in registry.p2_combos.values():
		if not a.id in combo.member_ids:continue
		var key=str(a.side)+":"+str(combo.id)
		if ticks-int(combo_clock.get(key,-100000))<int(combo.cooldown_s)*20:continue
		var good=true
		var entries=[]
		for signature in combo.signature_events:
			var record=p2_events.get(str(a.side)+":"+str(signature.skill_id),{})
			if record.is_empty() or ticks-int(record.tick)>float(combo.window_s)*20:
				good=false;break
			var owner=actor_by_uid(int(record.uid))
			if owner.is_empty() or owner.hp<=0 or owner.summon:
				good=false;break
			if signature.event=="contact_or_effect_confirmed":
				if not record.event in ["contact_or_effect_confirmed","heal_confirmed","form_activated","summon_spawned"]:good=false;break
			elif record.event!=signature.event:good=false;break
			entries.append(record)
		if not good:continue
		if combo.id in ["COMBO-001","COMBO-005"]:
			var target=int(entries[0].target_uid)
			if target<=0 or entries.any(func(x):return int(x.target_uid)!=target):continue
		combo_clock[key]=ticks
		for signature in combo.signature_events:p2_events.erase(str(a.side)+":"+str(signature.skill_id))
		var effect=combo.effect
		var passive_combo_factor=1.0+Passive.combo_bonus(self,combo,entries)
		var candidates=alive(int(a.side) if effect.type in ["shield","buff"] else 1-int(a.side))
		var center=Vector2(a.pos) if effect.shape=="circle_self" else point
		var selected=[]
		for b in candidates:
			if (effect.shape=="single" and b.uid==target_uid) or (effect.shape!="single" and b.pos.distance_to(center)<=float(effect.radius_m)+body_radius(b)):selected.append(b)
		selected.sort_custom(func(x,y):return x.pos.distance_to(center)<y.pos.distance_to(center))
		for b in selected.slice(0,int(effect.max_targets)):
			match str(effect.type):
				"damage":
					hit(a,b,float(a.natk)*float(effect.total_coefficient)*passive_combo_factor*100/(100+float(b.nres)),false)
					if combo.id=="COMBO-006":apply_status(a,b,{"status_id":"stun","chance":1.0,"duration_s":0.5})
				"bind","control":apply_status(a,b,{"status_id":"bind" if effect.type=="bind" else "slow","chance":1.0,"duration_s":1.0 if effect.type=="bind" else 1.5})
				"chakra_drain":cp_adjust(b,-12.0,"combo_drain")
				"shield":add_shield(a,b,float(a.natk)*float(effect.total_coefficient)*passive_combo_factor,5)
				"buff":
					apply_status(a,b,{"status_id":"defense_up","chance":1.0,"duration_s":6.0,"magnitude":0.12})
					apply_status(a,b,{"status_id":"chakra_up","chance":1.0,"duration_s":6.0,"magnitude":0.12})
		art_event("combo",center,0,str(combo.id))
		log.append(str(combo.name_vi))

func owned_clone(a: Dictionary) -> Dictionary:
	for b in actors:
		if b.summon and b.owner==a.uid and b.hp>0:return b
	return {}

# Projectile-only barrier: does not alter actor pathing; consumes one hostile projectile.
func p2_intercept_segment(source: Dictionary,from: Vector2,to: Vector2) -> bool:
	for barrier in p2_intercepts:
		if int(barrier.side)==int(source.side) or int(barrier.left)<=0 or int(barrier.expires)<=ticks:continue
		var rect: Rect2=barrier.rect.grow(0.03)
		var corners=[rect.position,Vector2(rect.end.x,rect.position.y),rect.end,Vector2(rect.position.x,rect.end.y)]
		var contact=rect.has_point(from) or rect.has_point(to)
		for i in range(4):
			if Geometry2D.segment_intersects_segment(from,to,corners[i],corners[(i+1)%4])!=null:contact=true
		if not contact:continue
		barrier.left=int(barrier.left)-1
		art_event("intercept",to)
		return true
	return false

func cable_anchor(a: Dictionary) -> Dictionary:
	# Kakashi's authored tracking summon is a DEV anchor; not an arbitrary living ally.
	for b in actors:
		if b.summon and b.owner==a.uid and b.hp>0 and b.get("summon_skill","")=="NIN-004-S2" and a.pos.distance_to(b.pos)<=4.0:return b
	return {}

func land_near(a: Dictionary,b: Dictionary) -> bool:
	for i in range(8):
		var dest=clamp_body(Vector2(b.pos)+Vector2.RIGHT.rotated(i*TAU/8.0)*0.9,body_radius(a))
		if position_clear(a,dest):
			a.pos=dest
			return true
	return false

func retrieved_count(a: Dictionary) -> int:
	return retrieved_objects.filter(func(item):return item.owner==a.uid and int(item.expires)>ticks).size()

func retrieve_object(a: Dictionary,s: Dictionary,point: Vector2,parent: int,solid: bool) -> bool:
	var p=s.p2.effect.params
	if p.get("retrieve","")!="preauthored_nonliving_object" or retrieved_count(a)>=int(p.max_objects):return false
	if not point.is_equal_approx(clamp_body(point,0.05)) or not clear_segment(point,point,0.02):return false
	# DEV nonliving preauthored effect token. Never stores or moves a living actor.
	var duration=float(p.get("duration_s",0.1))
	retrieved_objects.append({"owner":a.uid,"skill":s.skill_id,"point":point,"parent":parent,"solid":solid,"expires":ticks+maxi(2,roundi(duration*20))})
	art_event("object_retrieved",point,0,str(s.skill_id))
	return true

# Fixed point CP for battle only, integer hundredths; chakra is compatible read mirror.
func cp_affordable(a: Dictionary,cost: float) -> bool:
	return roundi(float(a.chakra)*100.0)>=roundi(cost*100.0) if use_depth else float(a.chakra)>=cost

func cp_adjust(a: Dictionary,delta: float,reason: String) -> float:
	var before=float(a.chakra)
	if use_depth:
		var capacity=maxi(0,roundi(float(a.max_chakra)*100.0))
		var old=clampi(roundi(before*100.0),0,capacity)
		var next=clampi(old+roundi(delta*100.0),0,capacity)
		if next!=old:a.erase("cp_resize_exact_ratio")
		a.cp_units=next
		a.cp_max_units=capacity
		a.chakra=float(next)/100.0
		var actual=next-old
		cp_telemetry[reason]=int(cp_telemetry.get(reason,0))+actual
		return float(actual)/100.0
	a.chakra=clampf(before+delta,0.0,float(a.max_chakra))
	return float(a.chakra)-before

func cp_continuous(a: Dictionary,delta: float,reason: String) -> float:
	if not use_depth:return cp_adjust(a,delta,reason)
	if not a.has("cp_remainder"):a.cp_remainder={}
	var precise=absf(delta)*100.0+float(a.cp_remainder.get(reason,0.0))
	var whole=floori(precise+0.0000001)
	a.cp_remainder[reason]=maxf(0.0,precise-whole)
	var result=cp_adjust(a,float(whole)/100.0*(1.0 if delta>=0 else -1.0),reason)
	if (delta>=0 and a.chakra>=a.max_chakra) or (delta<0 and a.chakra<=0):a.cp_remainder[reason]=0.0
	return result

func cp_resize(a: Dictionary,new_max: float) -> void:
	var old_max=maxf(0.01,float(a.max_chakra))
	var ratio=clampf(float(a.chakra)/old_max,0.0,1.0)
	if use_depth and a.has("cp_resize_exact_ratio") and roundi(float(a.chakra)*100.0)==int(a.get("cp_units",-1)):ratio=float(a.cp_resize_exact_ratio)
	var capacity=float(maxi(1,roundi(new_max*100.0)))/100.0 if use_depth else new_max
	if is_equal_approx(old_max,capacity) and (not use_depth or a.has("cp_units")):return
	a.max_chakra=capacity
	a.chakra=ratio*capacity
	if use_depth:
		a.chakra=float(roundi(float(a.chakra)*100.0))/100.0
		a.cp_units=roundi(float(a.chakra)*100.0)
		a.cp_max_units=roundi(capacity*100.0)
		a.cp_resize_exact_ratio=ratio

func credit(a: Dictionary,key: String,amount: float) -> void:
	if amount<=0 or a.is_empty():return
	var primary=actor_by_uid(int(a.owner)) if a.summon else a
	if primary.is_empty():return
	var row=contribution.get(primary.uid,{"id":primary.id,"side":primary.side,"damage":0.0,"heal":0.0,"taken":0.0,"absorbed":0.0,"control_applied_s":0.0})
	row[key]=float(row.get(key,0))+amount
	contribution[primary.uid]=row

func animation_event(a: Dictionary,phase: String,s: Dictionary,b: Dictionary={},point: Vector2=Vector2.INF) -> void:
	if a.is_empty():return
	animation_seq+=1
	var facing=Vector2(a.get("facing",Vector2.RIGHT if a.side==0 else Vector2.LEFT))
	var target_point=Vector2(b.get("pos",a.pos)) if point==Vector2.INF else point
	animation_events.append({"event_id":animation_seq,"tick":ticks,"phase":phase,"actor_uid":a.uid,"target_uid":int(b.get("uid",0)),"parent_cast_id":int(s.get("passive_cast_id",0)),"skill_id":str(s.get("skill_id","")),"foot":Vector2(a.pos),"point":target_point,"facing":facing,"direction":animation_direction(facing)})
	if animation_events.size()>512:animation_events.pop_front()

func animation_direction(v: Vector2) -> String:
	# World x+/y+ map to screen SE/SW, x-/y- to NW/NE.
	if absf(v.x)>=absf(v.y):return "SE" if v.x>=0 else "NW"
	return "SW" if v.y>=0 else "NE"

func animation_state(a: Dictionary) -> Dictionary:
	var phase="Idle"
	if a.hp<=0:phase="Fall"
	elif int(a.get("hit_until",0))>ticks:phase="Hit"
	elif not a.pending.is_empty():phase="Attack" if a.pending.skill.kind=="basic" else "Cast"
	elif int(a.get("move_until",0))>ticks:phase="Move"
	var start=0
	match phase:
		"Fall":start=int(a.get("fall_started",ticks))
		"Hit":start=int(a.get("hit_started",ticks))
		"Attack","Cast":start=int(a.get("cast_started",ticks))
		"Move":start=int(a.get("move_started",ticks))
	return {"action":phase,"direction":animation_direction(Vector2(a.get("facing",Vector2.RIGHT if a.side==0 else Vector2.LEFT))),"foot":Vector2(a.pos),"tick":ticks,"started_tick":start}

func sample_spacing() -> void:
	for side in [0,1]:
		var units=primary_alive(side)
		for i in range(units.size()):
			for j in range(i+1,units.size()):
				var gap=units[i].pos.distance_to(units[j].pos)
				tactical_metrics.minimum_gap=minf(float(tactical_metrics.minimum_gap),gap)
				tactical_metrics.pair_samples+=1
				if gap<1.15:tactical_metrics.crowded_pairs+=1

func load_combat_contracts() -> void:
	for row in registry.read_json("res://data/skill-depth-v5/combo-contracts.json"):
		combo_contracts_dev[row.id]=row
		for sig in row.signature_events:
			var key=str(sig.skill_id)+":"+str(sig.event)
			if not combo_index.has(key):combo_index[key]=[]
			if not row.id in combo_index[key]:combo_index[key].append(row.id)
			if not combo_skill_index.has(sig.skill_id):combo_skill_index[sig.skill_id]=[]
			if not row.id in combo_skill_index[sig.skill_id]:combo_skill_index[sig.skill_id].append(row.id)
	for row in registry.read_json("res://data/skill-depth-v5/form-routes.json").rows:form_routes_dev[row.id]=row

func combo_record(a: Dictionary,s: Dictionary,event: String,b: Dictionary,point: Vector2) -> void:
	if not use_contract_v10 or a.summon or a.get("beast",false) or a.hp<=0 or int(s.get("passive_cast_id",0))<=0:return
	var id=str(s.skill_id)
	var interested=combo_index.get(id+":"+event,[])
	if interested.is_empty():return
	var consumed_key=str(a.uid)+":"+str(s.passive_cast_id)+":"+id+":"+event
	if combo_consumed.has(consumed_key):return
	var key=str(a.side)+":"+id+":"+event
	var history=combo_event_history.get(key,[])
	var target_uid=int(b.get("uid",0))
	if history.any(func(r):return int(r.parent)==int(s.passive_cast_id) and int(r.target_uid)==target_uid):return
	var row={"tick":ticks,"uid":a.uid,"event":event,"target_uid":target_uid,"point":point,"parent":int(s.passive_cast_id),"side":a.side,"actor_form":str(a.active_form.get("id","")),"hp_at_event":float(a.hp)}
	history.append(row)
	history=history.filter(func(r):return ticks-int(r.tick)<=120)
	if history.size()>32:history=history.slice(history.size()-32)
	combo_event_history[key]=history
	p2_events[key]=row
	combo_resolve(a)

func combo_resolve(a: Dictionary) -> void:
	for contract in combo_contracts_dev.values():
		if not a.id in contract.members:continue
		var key=str(a.side)+":"+str(contract.id)
		if ticks-int(combo_clock.get(key,-100000))<float(contract.cooldown_s)*20:continue
		var entries=[]
		var keys=[]
		var parent_ids=[]
		var owner_ids=[]
		var hostile=[]
		var linked_ally=0
		var common_anchor=combo_common_anchor(int(a.side),contract)
		if str(contract.anchor_rule).begins_with("same_hostile") and common_anchor==0:continue
		var good=true
		for sig in contract.signature_events:
			var event_key=str(a.side)+":"+str(sig.skill_id)+":"+str(sig.event)
			var row=combo_pick_event(event_key,contract,common_anchor if sig.hostile_anchor else 0)
			if row.is_empty() or ticks-int(row.tick)>float(contract.window_s)*20 or row.parent in parent_ids or row.uid in owner_ids:good=false;break
			var owner=actor_by_uid(int(row.uid))
			if owner.is_empty() or owner.hp<=0 or owner.summon or owner.side!=a.side or owner.id!=sig.actor_id:good=false;break
			var target=actor_by_uid(int(row.target_uid))
			if sig.hostile_anchor:
				if target.is_empty() or target.side==a.side:good=false;break
				hostile.append(int(row.target_uid))
			if sig.event=="cleanse_effective":
				if target.is_empty() or target.side!=a.side or target.summon:good=false;break
				linked_ally=target.uid
			parent_ids.append(row.parent)
			owner_ids.append(row.uid)
			entries.append(row)
			keys.append(event_key)
		if not good:continue
		if str(contract.anchor_rule).begins_with("same_hostile") and (hostile.is_empty() or hostile.any(func(uid):return uid!=hostile[0])):continue
		if contract.id=="COMBO-004":
			var cleaned=actor_by_uid(linked_ally)
			if cleaned.is_empty() or cleaned.hp<=0:continue
			var linked=false
			for owner_uid in owner_ids:
				var owner=actor_by_uid(int(owner_uid))
				if owner_uid!=linked_ally and owner.pos.distance_to(cleaned.pos)<=float(registry.combat_v3.links.range):linked=true
			if not linked:continue
		if contract.id=="COMBO-012":
			var form_owner=actor_by_uid(int(entries.back().uid))
			if form_owner.is_empty() or entries.back().get("actor_form","")=="" or form_owner.active_form.get("id","")!=entries.back().actor_form or entries.any(func(row):return float(row.get("hp_at_event",0))<=0):continue
		var effect=registry.p2_combos[contract.id].effect
		var payload=contract.payload
		var center=Vector2(a.pos) if effect.shape=="circle_self" else Vector2(entries.back().point)
		if not hostile.is_empty():
			var anchor=actor_by_uid(int(hostile[0]))
			if not anchor.is_empty():center=anchor.pos if effect.shape=="single" or contract.id in ["COMBO-003","COMBO-004","COMBO-012"] else center
		var targets=[]
		for target in alive(int(a.side) if effect.type in ["shield","buff"] else 1-int(a.side)):
			if effect.shape=="single":
				if not hostile.is_empty() and target.uid==hostile[0]:targets.append(target)
			elif target.pos.distance_to(center)<=float(effect.radius_m)+body_radius(target):targets.append(target)
		targets.sort_custom(func(x,y):return x.pos.distance_to(center)<y.pos.distance_to(center))
		if targets.is_empty():continue
		combo_clock[key]=ticks
		for i in range(keys.size()):
			var event_key=keys[i]
			var used=entries[i]
			var parts=event_key.split(":")
			combo_consumed[str(used.uid)+":"+str(used.parent)+":"+parts[1]+":"+parts[2]]=ticks
			var history=combo_event_history.get(event_key,[]).filter(func(r):return int(r.parent)!=int(used.parent))
			combo_event_history[event_key]=history
			if history.is_empty():p2_events.erase(event_key)
			else:p2_events[event_key]=history.back()
		var bonus=1.0+Passive.combo_bonus(self,contract,entries)
		for target in targets.slice(0,int(effect.max_targets)):
			if float(payload.get("damage_coefficient",0))>0:hit(a,target,float(a.natk)*float(payload.damage_coefficient)*bonus*100.0/(100.0+float(target.nres)),false)
			if payload.has("bind_s"):apply_status(a,target,{"status_id":"bind","chance":1.0,"duration_s":payload.bind_s})
			if payload.has("stagger_s"):apply_status(a,target,{"status_id":"stun","chance":1.0,"duration_s":payload.stagger_s})
			if payload.has("slow_fraction"):apply_status(a,target,{"status_id":"slow","chance":1.0,"duration_s":payload.duration_s,"magnitude":payload.slow_fraction})
			if payload.has("drain_cp_max"):cp_adjust(target,-float(payload.drain_cp_max),"combo_drain")
			if payload.has("shield_coefficient"):add_shield(a,target,float(a.natk)*float(payload.shield_coefficient)*bonus,float(payload.duration_s))
			if payload.has("defense_multiplier"):
				apply_status(a,target,{"status_id":"defense_up","chance":1.0,"duration_s":payload.duration_s,"magnitude":float(payload.defense_multiplier)-1.0})
				target.combo_regen_until=ticks+roundi(float(payload.duration_s)*20)
				target.combo_regen_owner=a.uid
		combo_receipts[contract.id]=int(combo_receipts.get(contract.id,0))+1
		combo_evidence[contract.id]={"tick":ticks,"parents":parent_ids,"owners":owner_ids,"hostile":hostile,"cleanse_uid":linked_ally,"target_count":mini(targets.size(),int(effect.max_targets))}
		art_event("combo",center,0,str(contract.id))
		log.append(str(registry.p2_combos[contract.id].name_vi))

func record_typed_passives(a: Dictionary,s: Dictionary,category: String,detail: String="") -> void:
	for row in s.get("passive_typed",[]):
		if row.category!=category or (detail!="" and row.get("detail","")!="" and row.detail!=detail):continue
		var key=str(s.get("passive_cast_id",0))+":"+str(a.uid)+":"+str(row.id)
		if int(s.get("passive_cast_id",0))<=0 or typed_passive_effects.has(key):continue
		typed_passive_effects[key]={"id":row.id,"category":category,"before":row.before,"after":row.after}
		if a.side==0:passive_mastery[row.id]=1

func formation_pairs(side: int) -> Array:
	var result=[]
	if not side_formations.has(side):return result
	var units=primary_alive(side)
	var rule=registry.formations[side_formations[side]]
	for i in range(units.size()):
		for j in range(i+1,units.size()):
			var a=units[i]
			var b=units[j]
			if a.pos.distance_to(b.pos)<=float(registry.combat_v3.links.range) and Formation.linked(int(a.deployment_slot),int(b.deployment_slot),str(rule.link)):result.append([a.pos,b.pos])
	return result

func refund_parent_cp(a: Dictionary,s: Dictionary,requested: float,reason: String) -> float:
	var parent=int(s.get("passive_cast_id",0))
	if parent<=0 or a.summon:return 0.0
	var key=str(parent)+":"+str(a.uid)
	var paid=maxi(0,roundi(float(s.chakra)*100.0))
	var used=int(cp_refund_units.get(key,0))
	var amount=minf(requested,float(maxi(0,paid-used))/100.0)
	var actual=cp_adjust(a,maxf(0.0,amount),reason)
	cp_refund_units[key]=used+roundi(actual*100.0)
	return actual

func decision_skill(a: Dictionary,id: String) -> Dictionary:
	if decision_uid!=int(a.uid):return effective_skill(a,id)
	if not decision_effective.has(id):decision_effective[id]=effective_skill(a,id)
	return decision_effective[id]

func survival_override(a: Dictionary,s: Dictionary) -> bool:
	var b=target_for(a,s)
	if b.is_empty() or b.side!=a.side or b.hp>b.max_hp*0.15:return false
	if Tactical.threat(self,b)<=0:return false
	return s.effects.any(func(e):return e.type in ["heal","shield","cleanse"])

func prospective_links(a: Dictionary,p: Vector2) -> int:
	if a.summon or not side_formations.has(a.side):return 0
	var rule=registry.formations[side_formations[a.side]]
	var result=0
	for b in primary_alive(int(a.side)):
		if b.uid!=a.uid and p.distance_to(b.pos)<=float(registry.combat_v3.links.range) and Formation.linked(int(a.deployment_slot),int(b.deployment_slot),str(rule.link)):result+=1
	return mini(result,int(registry.combat_v3.links.max_neighbors))

func update_pressure() -> void:
	# No artificial damage or timeout; change legal tactical priorities.
	var sample=[0.0,0.0]
	for a in actors:
		if not a.summon:sample[int(a.side)]+=float(a.hp)/maxf(1.0,float(a.max_hp))
	pressure_sample.append(sample)
	if pressure_sample.size()>7:pressure_sample.pop_front()
	var flat=pressure_sample.size()==7 and absf(float(pressure_sample.front()[0])-float(sample[0]))<0.10 and absf(float(pressure_sample.front()[1])-float(sample[1]))<0.10
	if flat and not pressure_mode:
		pressure_since=ticks
		runtime_metrics.pressure_entries+=1
	pressure_mode=flat
	for key in combo_consumed.keys():
		if ticks-int(combo_consumed[key])>1200:combo_consumed.erase(key)
	for key in combo_event_history.keys():
		combo_event_history[key]=combo_event_history[key].filter(func(r):return ticks-int(r.tick)<=120)

func combo_target_bonus(a: Dictionary,b: Dictionary,s: Dictionary) -> float:
	if not use_contract_v10 or a.summon:return 0.0
	var bonus=0.0
	for contract_id in combo_skill_index.get(s.skill_id,[]):
		var contract=combo_contracts_dev[contract_id]
		if not a.id in contract.members:continue
		if not contract.signature_events.any(func(sig):return sig.skill_id==s.skill_id and sig.hostile_anchor):continue
		if not str(contract.anchor_rule).begins_with("same_hostile"):continue
		for sig in contract.signature_events:
			if sig.actor_id==a.id or not sig.hostile_anchor:continue
			var event=combo_pick_event(str(a.side)+":"+str(sig.skill_id)+":"+str(sig.event),contract,int(b.uid))
			if not event.is_empty():bonus+=48.0
	return bonus

func combo_skill_bonus(a: Dictionary,b: Dictionary,s: Dictionary) -> float:
	if not use_contract_v10 or a.summon:return 0.0
	var bonus=0.0
	for contract_id in combo_skill_index.get(s.skill_id,[]):
		var contract=combo_contracts_dev[contract_id]
		if not a.id in contract.members:continue
		if ticks-int(combo_clock.get(str(a.side)+":"+str(contract.id),-100000))<float(contract.cooldown_s)*20:continue
		var partners=0
		var confirmed=0
		for sig in contract.signature_events:
			if sig.actor_id==a.id:continue
			for ally in primary_alive(int(a.side)):
				if ally.id!=sig.actor_id or not sig.skill_id in ally.skills:continue
				partners+=1
				var own_hostile=contract.signature_events.any(func(x):return x.skill_id==s.skill_id and x.hostile_anchor)
				var event=combo_pick_event(str(a.side)+":"+str(sig.skill_id)+":"+str(sig.event),contract,int(b.uid) if own_hostile and sig.hostile_anchor and str(contract.anchor_rule).begins_with("same_hostile") else 0)
				if not event.is_empty():confirmed+=1
		if partners==contract.signature_events.size()-1:
			var sync=0.0
			for sig in contract.signature_events:
				if sig.actor_id!=a.id and signature_near_ready(int(a.side),sig,float(contract.window_s)):sync+=8.0
			bonus=maxf(bonus,8.0+sync+float(confirmed)*48.0)
	return bonus

func confirm_tracking(a: Dictionary,target: Dictionary) -> void:
	if a.get("summon_tracking_sent",false) or target.hp<=0 or target.side==a.side:return
	var owner=actor_by_uid(int(a.owner))
	if owner.is_empty() or owner.hp<=0 or int(a.get("summon_parent",0))<=0:return
	a.summon_tracking_sent=true
	combo_record(owner,{"skill_id":"NIN-004-S2","passive_cast_id":a.summon_parent},"summon_tracking_confirmed",target,target.pos)

func conditional_passive_active(a: Dictionary,row: Dictionary) -> bool:
	if row.trigger.event=="while_form_active":
		if not a.active_form.get("id","") in row.trigger.form_ids:return false
	if not a.pending.is_empty() and a.pending.skill.get("passive_typed",[]).any(func(e):return e.id==row.id):return true
	for p in projectiles:
		if p.source==a.uid and p.skill.get("passive_typed",[]).any(func(e):return e.id==row.id):return true
	for job in p2_jobs:
		if job.source==a.uid and job.skill.get("passive_typed",[]).any(func(e):return e.id==row.id):return true
	return false

func combo_pick_event(key: String,contract: Dictionary,anchor: int=0) -> Dictionary:
	var history=combo_event_history.get(key,[])
	for i in range(history.size()-1,-1,-1):
		var row=history[i]
		if ticks-int(row.tick)>float(contract.window_s)*20:continue
		if anchor>0 and int(row.target_uid)!=anchor:continue
		var owner=actor_by_uid(int(row.uid))
		if owner.is_empty() or owner.hp<=0 or owner.summon:continue
		return row
	return {}

func combo_common_anchor(side: int,contract: Dictionary) -> int:
	if not str(contract.anchor_rule).begins_with("same_hostile"):return 0
	var candidates=[]
	for sig in contract.signature_events:
		if not sig.hostile_anchor:continue
		var key=str(side)+":"+str(sig.skill_id)+":"+str(sig.event)
		var found=[]
		for r in combo_event_history.get(key,[]):
			if ticks-int(r.tick)<=float(contract.window_s)*20 and int(r.target_uid)>0 and not int(r.target_uid) in found:found.append(int(r.target_uid))
		if found.is_empty():return 0
		if candidates.is_empty():candidates=found
		else:
			candidates=candidates.filter(func(uid):return uid in found)
			if candidates.is_empty():return 0
	for uid in candidates:
		var target=actor_by_uid(uid)
		if not target.is_empty() and target.hp>0 and target.side!=side:return uid
	return 0

func signature_near_ready(side: int,sig: Dictionary,window: float) -> bool:
	var key=str(side)+":"+str(sig.actor_id)+":"+str(sig.skill_id)+":"+str(window)
	if signature_ready_cache.has(key):return signature_ready_cache[key]
	var ok=false
	for ally in primary_alive(side):
		if ally.id!=sig.actor_id or not sig.skill_id in ally.skills:continue
		if not ally.pending.is_empty() and ally.pending.skill.skill_id==sig.skill_id:
			if float(ally.cast_left)<=window:ok=true;break
			continue
		var s=effective_skill(ally,sig.skill_id)
		if s.kind=="ultimate" and side==0 and not auto_player_ultimate and ultimate_requests.get(ally.uid,"")!=sig.skill_id:continue
		if s.has("p2") and not p2_ready(ally,s):continue
		if hard_block(ally) or (has_status(ally,"silence") and s.damage_type!="physical"):continue
		if s.effects.any(func(e):return e.type=="activate_form" and not form_ready(ally,str(e.form_id),false,str(s.skill_id))):continue
		if float(ally.cooldowns.get(sig.skill_id,0))+float(ally.busy)>window:continue
		if float(ally.chakra)+float(ally.regen)*form_multiplier(ally,"chakra_regen")*window<float(s.chakra):continue
		ok=true
		break
	signature_ready_cache[key]=ok
	return ok

func confirm_form_effect(a: Dictionary,s: Dictionary,kind: String) -> void:
	var id=str(s.get("form_at_cast",""))
	if id=="" or int(s.get("passive_cast_id",0))<=0:return
	# A launched empowered skill retains its authored coefficient after form expiry.
	if not kind in ["damage","heal","shield"]:return
	if float(s.get("form_empowered_factor",1.0))<=1.0:return
	form_effect_evidence[id]={"skill":s.skill_id,"parent":s.passive_cast_id,"kind":kind,"factor":s.form_empowered_factor,"tick":ticks}
