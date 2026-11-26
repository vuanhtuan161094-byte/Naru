extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Combat=preload("res://game/combat.gd")
const Depth=preload("res://game/skill_depth_service.gd")
const Snapshot=preload("res://game/combat_stat_snapshot.gd")
var failed=0
func check(ok: bool,label: String) -> void:
	if ok:print("PRODUCT_V11_OK ",label)
	else:failed+=1;push_error("PRODUCT_V11_FAIL "+label)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	check(reg.depth_exact_branches.size()==432,"432 published branch rows")
	var applied=[]
	var special=[]
	var unresolved=[]
	for row in reg.depth_exact_branches.values():
		var id=str(row.skill)
		if not reg.p2_skills.has(id):
			unresolved.append(row.id+":fallback")
			continue
		var s=reg.p2_skills[id].duplicate(true)
		Depth.apply(reg,s,{"grade":3,"level":20,"branch":row.id},10)
		if reg.depth_branches.has(row.id):
			if s.get("depth_drain_contract",false) or s.effects.any(func(e):return e.has("fixed_dot_total_coefficient")):special.append(row.id)
			else:unresolved.append(row.id+":special")
		elif s.get("depth_exact_branch","")==row.id:applied.append(row.id)
		else:unresolved.append(row.id+":typed")
	print("NARU_V11_BRANCHES exact=",applied.size()," special=",special.size()," HOLD=",unresolved)
	check(applied.size()+special.size()+unresolved.size()==432,"branch IDs reconciled")
	var sim=Combat.new()
	sim.registry=reg
	sim.use_depth=true
	sim.use_tactical=true
	sim.use_contract_v10=true
	sim.load_combat_contracts()
	for stars in [1,5,10,15]:
		var id="NIN-041"
		var p={"level":140,"quality":4,"realm":6,"stars":stars,"permanent":{},"allocated":{"strength":11},"training":{"strength":4}}
		var snap=Snapshot.snapshot(reg,reg.ninjas[id],140,4,{},p,{},true)
		sim.add_actor(id,0,140,4,{},0,1.0,p)
		check(sim.actors.back().stats==snap.stats,"preview parity stars "+str(stars))
		check(is_equal_approx(float(snap.natural_star_multiplier),1.0+0.04*(stars-1)),"natural-only multiplier")
	# Actual mixed-team rotations; no injected combo event, CP grant or cooldown skip.
	var combos={}
	var proc={}
	var typed={}
	var forms={}
	var pressure=0
	var settled=0
	for contract in sim.combo_contracts_dev.values():
		var fight=Combat.new()
		fight.registry=reg
		fight.use_depth=true
		fight.use_tactical=true
		fight.use_contract_v10=true
		fight.use_passives=true
		fight.load_combat_contracts()
		fight.rng.seed=1100+int(str(contract.id).right(3))
		fight.side_formations={0:"FRM-03",1:"FRM-04"}
		fight.side_levels={0:10,1:10}
		fight.environment="forest"
		fight.configure_terrain()
		var roster=contract.members.duplicate()
		for id in ["NIN-055","NIN-043","NIN-007","NIN-093","NIN-021","NIN-022"]:
			if roster.size()>=6:break
			if not id in roster:roster.append(id)
		var enemies=["NIN-001","NIN-002","NIN-003","NIN-016","NIN-070","NIN-068"]
		for side in [0,1]:
			for i in range(6):
				var id=str(roster[i] if side==0 else enemies[i])
				var n=reg.ninjas[id]
				fight.add_actor(id,side,140,4,{},i,1.0,{"realm":7,"stars":5,"forms":n.form_ids,"unlocked_skills":n.additional_skill_ids})
		for step in range(1000):
			if step%20==0:
				for i in range(6):
					var a=fight.actors[i]
					# Simulated player explicitly requests signature ultimate, if part of this combo.
					for signature in contract.signature_events:
						if a.id==signature.actor_id and reg.depth_ultimates.has(signature.skill_id) and not fight.ultimate_requests.has(a.uid):fight.ultimate_skill(i,signature.skill_id)
			fight.tick(0.05)
			if not fight.outcome.is_empty():break
		for id in fight.combo_receipts:combos[id]=true
		for id in fight.passive_receipts:proc[id]=true
		for r in fight.typed_passive_effects.values():typed[r.id]=true
		for id in fight.form_receipts:forms[id]=true
		pressure+=int(fight.runtime_metrics.pressure_entries)
		if not fight.outcome.is_empty():settled+=1
		print("NARU_V11_ROTATION ",contract.id," outcome=",fight.outcome if not fight.outcome.is_empty() else "OBSERVED_ONLY"," combos=",fight.combo_receipts," metrics=",fight.runtime_metrics," spacing=",fight.tactical_metrics)
	print("NARU_V11_ORGANIC combos=",combos.keys()," forms=",forms.keys()," event_passives=",proc.size()," typed=",typed.size()," pressure=",pressure," settled=",settled)
	print("NARU_PRODUCT_V11_PASS" if failed==0 else "NARU_PRODUCT_V11_FAIL")
	quit(0 if failed==0 else 1)
