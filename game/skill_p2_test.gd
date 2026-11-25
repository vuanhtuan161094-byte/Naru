extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Combat=preload("res://game/combat.gd")
var fails=0
func check(ok: bool,message: String) -> void:
	if not ok:fails+=1;push_error("P2_FAIL "+message)
	else:print("P2_OK "+message)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	check(reg.p2_design.size()==1152 and reg.p2_skills.size()+reg.p2_fallback.size()==1152,"coverage and explicit fallback")
	var shapes={}
	var fallback={}
	for id in reg.p2_fallback:
		var reason=reg.p2_fallback[id]
		fallback[reason]=int(fallback.get(reason,0))+1
	for id in reg.p2_skills:
		var shape=reg.p2_skills[id].shape
		shapes[shape]=int(shapes.get(shape,0))+1
	print("P2_ADAPTER_COUNTS ",reg.p2_skills.size()," FALLBACK ",reg.p2_fallback.size()," SHAPES ",shapes," REASONS ",fallback)
	var sim=Combat.new()
	sim.registry=reg
	sim.qa_hold_ai=true
	sim.add_actor("NIN-001",0,20,2,{},0,1.0)
	sim.add_actor("NIN-002",1,20,2,{},0,1.0)
	var a=sim.actors[0]
	var b=sim.actors[1]
	a.pos=Vector2(5,5)
	b.pos=Vector2(6,5)
	var skill=sim.effective_skill(a,"NIN-001-S0")
	check(skill.has("p2") and sim.cast(a,skill,b),"actual P2 basic cast")
	for i in range(80):sim.tick(0.05)
	check(sim.p2_resolved>0 and sim.effect_dispatch_count>0,"actual P2 effect pipeline")
	var confirmed=0
	var cast_only=[]
	var rejected=[]
	var by_shape={}
	for id in reg.p2_skills:
		var raw=reg.p2_design[id]
		var result=fixture(reg,id)
		if result==2:
			confirmed+=1
			by_shape[raw.geometry.shape]=int(by_shape.get(raw.geometry.shape,0))+1
		elif result==1:cast_only.append(id)
		else:rejected.append(id)
	print("P2_TIMED_AUDIT confirmed=",confirmed," cast_only=",cast_only.size()," rejected=",rejected.size()," shapes=",by_shape)
	print("P2_CAST_ONLY_IDS ",JSON.stringify(cast_only))
	print("P2_REJECTED_IDS ",JSON.stringify(rejected))
	# Distinguish coverage from observed effects. These ID lists are not a blanket PASS.
	check(confirmed+cast_only.size()+rejected.size()==reg.p2_skills.size(),"P2 per-ID timed audit reconciled")
	check(cast_only.is_empty() and rejected.is_empty(),"all enabled P2 candidates confirm at least one actual effect in valid fixture")
	var combos_ok=0
	for combo in reg.p2_combos.values():
		var trial=Combat.new()
		trial.registry=reg
		trial.qa_hold_ai=true
		for id in combo.member_ids:trial.add_actor(id,0,20,2,{},trial.actors.size(),1.0)
		trial.add_actor("NIN-003",1,20,2,{},0,1.0)
		var target=trial.actors.back()
		target.pos=Vector2(6,5)
		for index in range(combo.signature_events.size()):
			var sig=combo.signature_events[index]
			var unit=trial.actors[index]
			unit.pos=Vector2(5,5+index*0.6)
			trial.p2_events["0:"+str(sig.skill_id)]={"tick":0,"uid":unit.uid,"event":sig.event,"target_uid":target.uid,"point":target.pos}
		trial.p2_combo(trial.actors[0],target.pos,target.uid)
		if trial.combo_clock.has("0:"+str(combo.id)):combos_ok+=1
	check(combos_ok==12,"12 combo signature dispatcher fixtures (synthetic confirmed events)")
	print("NARU_SKILL_P2_PASS" if fails==0 else "NARU_SKILL_P2_FAIL")
	quit(0 if fails==0 else 1)

func fixture(reg,id: String) -> int:
	var raw=reg.p2_design[id]
	var best=0
	for seed_value in [42,83,117]:
		var sim=Combat.new()
		sim.registry=reg
		sim.qa_hold_ai=true
		sim.rng.seed=seed_value
		var n=reg.ninjas[raw.ninja_id]
		sim.add_actor(raw.ninja_id,0,160,int(n.initial_quality),{},0,1.0,{"forms":n.form_ids,"unlocked_skills":n.additional_skill_ids})
		sim.add_actor("NIN-003",1,160,4,{},0,1.0)
		var a=sim.actors[0]
		var b=sim.actors[1]
		a.pos=Vector2(5,5)
		var distance=minf(3.0,float(raw.geometry.range_m)*0.85) if raw.geometry.shape in ["wall","teleport_mark","dash_contact"] else 1.0
		b.pos=Vector2(5+maxf(0.85,distance),5)
		a.hp=a.max_hp*0.55
		b.hp=b.max_hp*0.9
		a.chakra=a.max_chakra*0.95
		b.chakra=b.max_chakra*0.8
		if raw.conditions.ai in ["chakra_below_70pct","ally_chakra_below_70pct"]:a.chakra=a.max_chakra*0.5
		if raw.conditions.ai=="ally_has_dispellable_status":sim.apply_status(b,a,{"status_id":"slow","chance":1.0,"duration_s":20})
		if raw.conditions.has("any_active_forms"):a.active_form={"id":raw.conditions.any_active_forms[0],"remaining":20.0}
		if raw.conditions.ai=="owned_valid_mark_or_explicit_swap" or raw.effect.params.get("requires_owned_mark",false):sim.p2_set_mark(a,b,{"duration_s":20})
		if raw.effect.params.get("requires_clone",false):sim.summon_actor(a,{"skill_id":"QA-CLONE"},{"template_id":"QA-CLONE","cap":1,"lifetime_s":20,"hp_owner_fraction":0.25,"attack_owner_fraction":0.3})
		if raw.conditions.ai=="incoming_absorbable_projectile":
			var dummy=reg.skills["NIN-003-S0"].duplicate(true)
			dummy.projectile_speed_m_s=0.01
			sim.projectiles.append({"source":b.uid,"target":a.uid,"skill":dummy,"origin":b.pos,"pos":b.pos,"direction":Vector2.LEFT,"remaining":100.0,"distance_left":1.0,"hit_ids":[],"cast_id":0})
		var skill=sim.effective_skill(a,id)
		var target=sim.target_for(a,skill)
		if not sim.cast(a,skill,target):continue
		best=1
		for i in range(240):
			sim.tick(0.05)
			if sim.p2_resolved>0:return 2
	return best
