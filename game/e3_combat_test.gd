extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Combat=preload("res://game/combat.gd")
var failures=0
func check(ok:bool,desc:String)->void:
	if not ok:failures+=1;push_error("E3_FAIL "+desc)
func sample(reg,modern:bool,seed_value:int)->Dictionary:
	var sim=Combat.new()
	sim.registry=reg
	sim.use_depth=true
	sim.use_tactical=true
	sim.use_e3_movement=modern
	sim.use_contract_v10=true
	sim.use_passives=true
	sim.load_combat_contracts()
	sim.rng.seed=seed_value
	sim.environment="forest"
	sim.side_formations={0:"FRM-01",1:"FRM-02"}
	sim.side_levels={0:1,1:1}
	sim.configure_terrain()
	var teams=[["NIN-041","NIN-042","NIN-093","NIN-043","NIN-060","NIN-004"],["NIN-001","NIN-016","NIN-002","NIN-003","NIN-070","NIN-068"]]
	for side in [0,1]:
		for k in range(6):
			var id=teams[side][k]
			sim.add_actor(id,side,40,int(reg.ninjas[id].initial_quality),{},k,1.0,{"realm":1,"stars":3})
	check(sim.ultimate_skill(0,str(sim.actors[0].skills[5])),"manual queue")
	check(sim.ultimate_requests.has(sim.actors[0].uid),"queue retained")
	check(sim.ultimate_skill(0,str(sim.actors[0].skills[5])),"manual cancel")
	check(not sim.ultimate_requests.has(sim.actors[0].uid),"cancel removed")
	for tick in range(480):
		if tick%80==0:
			for k in range(6):sim.ultimate(k)
		sim.tick(0.05)
		if not sim.outcome.is_empty():break
	check(sim.runtime_metrics.cast_choices>0,"actual casts")
	check(sim.actors.all(func(a):return a.chakra>=0 and a.chakra<=a.max_chakra+0.01),"chakra limits")
	return {"motion":sim.e3_metrics,"casts":sim.runtime_metrics.cast_choices,"focus":sim.tactical_metrics.focus_switches,"moves":sim.tactical_metrics.movement_steps,"ultimate_executed":sim.ultimate_executed,"outcome":sim.outcome}
func _initialize()->void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	for seed_value in [42,113,812]:
		var baseline=sample(reg,false,seed_value)
		var modern=sample(reg,true,seed_value)
		print("NARU_E3_COMPARE ",JSON.stringify({"seed":seed_value,"baseline":baseline,"modern":modern}))
		check(int(modern.casts)>0,"E3 remains playable")
	if failures==0:print("NARU_E3_COMBAT_PASS")
	quit(0 if failures==0 else 1)
