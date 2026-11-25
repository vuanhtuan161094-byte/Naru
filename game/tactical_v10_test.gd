extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Combat=preload("res://game/combat.gd")
const Passive=preload("res://game/passive_service.gd")
var failures=0
func check(ok: bool,label: String) -> void:
	if ok:print("TACTICAL_V10_OK ",label)
	else:failures+=1;push_error("TACTICAL_V10_FAIL "+label)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	var fallback_ids=reg.p2_fallback.keys()
	fallback_ids.sort()
	check(fallback_ids==["NIN-006-S7","NIN-016-S7","NIN-064-S5","NIN-064-S7","NIN-139-S1","NIN-139-S5"],"exact 6 inherited gates")
	var baseline={"pairs":0,"crowd":0}
	var modern={"pairs":0,"crowd":0}
	var procs={}
	var typed={}
	var combos={}
	var forms={}
	for i in range(reg.depth_teams.size()):
		for enabled in [false,true]:
			var sim=Combat.new()
			sim.registry=reg
			sim.use_depth=true
			sim.use_tactical=enabled
			sim.use_contract_v10=enabled
			sim.use_passives=true
			sim.use_passive_pilot=i%2==1
			sim.load_combat_contracts()
			sim.rng.seed=600+i
			sim.side_formations={0:"FRM-%02d" % (i%8+1),1:"FRM-%02d" % ((i+3)%8+1)}
			sim.side_levels={0:[1,10,20][i%3],1:[1,10,20][i%3]}
			sim.environment=["forest","desert","cave"][i%3]
			sim.configure_terrain()
			for side in [0,1]:
				var team=reg.depth_teams[i if side==0 else (i+1)%reg.depth_teams.size()]
				for slot in range(6):
					var id=str(team.members[slot].id)
					var n=reg.ninjas[id]
					var skill_levels={}
					for sid in n.skills:skill_levels[sid]={"grade":[1,3,10][i%3],"level":20,"branch":""}
					sim.add_actor(id,side,140,4,{},slot,1.0,{"realm":6,"stars":[1,5,10,15][i%4],"forms":n.form_ids,"unlocked_skills":n.additional_skill_ids,"skill_levels":skill_levels})
			for step in range(360):
				if step%20==0:
					for slot in range(6):sim.ultimate(slot)
				sim.tick(0.05)
				if not enabled and step%10==0:sim.sample_spacing()
				if sim.outcome!="":break
			var group=modern if enabled else baseline
			group.pairs+=int(sim.tactical_metrics.pair_samples)
			group.crowd+=int(sim.tactical_metrics.crowded_pairs)
			if enabled:
				for id in sim.passive_receipts:procs[id]=true
				for row in sim.typed_passive_effects.values():typed[row.id]=true
				for id in sim.combo_receipts:combos[id]=true
				for id in sim.form_receipts:forms[id]=true
				check(sim.actors.all(func(a):return a.chakra>=0 and a.chakra<=a.max_chakra+0.01),"CP bounded team "+str(i+1))
			print("NARU_V10_TEAM ",i+1," tactical=",enabled," outcome=",sim.outcome if sim.outcome!="" else "OBSERVATION_WINDOW"," metrics=",sim.tactical_metrics," contribution=",sim.contribution.size())
	print("NARU_V10_SPACING baseline=",baseline," tactical=",modern)
	print("NARU_V10_OBSERVED proc_ids=",procs.size()," typed_ids=",typed.size()," combos=",combos.keys()," forms=",forms.keys())
	check(baseline.pairs>0 and modern.pairs>0,"paired spatial samples")
	var form_sim=Combat.new()
	form_sim.registry=reg
	form_sim.use_depth=true
	form_sim.use_contract_v10=true
	form_sim.load_combat_contracts()
	check(form_sim.form_routes_dev.size()==54 and form_sim.combo_contracts_dev.size()==12,"54 form and 12 combo contracts loaded")
	var activated=[]
	var unresolved=[]
	for contract in form_sim.form_routes_dev.values():
		var sim=Combat.new()
		sim.registry=reg
		sim.use_depth=true
		sim.use_contract_v10=true
		sim.load_combat_contracts()
		var n=reg.ninjas[contract.ninja]
		sim.add_actor(contract.ninja,0,140,4,{},0,1.0,{"realm":6,"forms":[contract.id],"unlocked_skills":n.additional_skill_ids})
		var a=sim.actors[0]
		a.chakra=a.max_chakra
		var ok=false
		if sim.form_ready(a,contract.id,true):ok=sim.activate_form(a,contract.id,true)
		else:
			for route in contract.skill_routes:
				if sim.activate_form(a,contract.id,false,route.id):ok=true;break
		if ok:activated.append(contract.id)
		else:unresolved.append(contract.id)
	print("NARU_V10_FORM_ROUTES activation_fixture=",activated.size()," unresolved=",unresolved)
	check(activated.size()+unresolved.size()==54,"form routes reconciled")
	print("NARU_TACTICAL_V10_PASS" if failures==0 else "NARU_TACTICAL_V10_FAIL")
	quit(0 if failures==0 else 1)
