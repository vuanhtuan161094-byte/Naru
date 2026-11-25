extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Combat=preload("res://game/combat.gd")
var failures=0
func check(ok: bool,label: String) -> void:
	if not ok:
		failures+=1
		push_error("GP_P2_FAIL "+label)
	else: print("GP_P2_OK "+label)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():
		push_error(str(reg.errors))
		quit(1)
		return
	var store=Store.new()
	store.save_path="user://gp_p2_ci.json"
	for suffix in ["",".bak",".tmp"]:
		DirAccess.remove_absolute(store.save_path+suffix)
	store.new_game(reg)
	store.rng.seed=42
	var draw=store.draw(reg)
	check(not draw.is_empty() and store.state.owned.has(draw),"recruit")
	check(int(store.state.inventory["RES-002"])==900,"recruit debit")
	var team=store.state.owned.keys()
	check(store.set_team(team),"formation")
	check(not store.set_team([team[0],team[0]]),"reject duplicate")
	var stage=reg.stages["STG-001"]
	var event=store.begin_stage(stage)
	check(not event.is_empty() and int(store.state.stamina)==114,"stage debit")
	var sim=Combat.new()
	sim.setup(reg,store.state,stage,42)
	for i in range(24000):
		sim.tick(0.05)
		if not sim.outcome.is_empty(): break
	check(sim.outcome=="win","actual first stage victory")
	var ryo=int(store.state.inventory["RES-001"])
	check(store.finish_stage(reg,stage,event,sim.outcome=="win",sim.counts),"reward commit")
	check(int(store.state.inventory["RES-001"])==ryo+120,"first reward")
	check(not store.finish_stage(reg,stage,event,true,{}),"reject duplicate reward")
	var ninja=str(team[0])
	var xp=int(store.state.owned[ninja].level)
	check(store.train(ninja),"consume XP scroll")
	check(int(store.state.owned[ninja].level)>xp or int(store.state.owned[ninja].xp)>0,"growth")
	check(store.allocate(ninja,"strength"),"allocate point")
	var reload=Store.new()
	reload.save_path=store.save_path
	reload.load_or_new(reg)
	check(reload.state.cleared.has("STG-001") and int(reload.state.owned[ninja].allocated.strength)==1,"reload persisted progression")
	check(not reload.finish_stage(reg,stage,event,true,{}),"reject duplicate after reload")
	var six=store.state.duplicate(true)
	six.team=reg.ninjas.keys().slice(0,6)
	for id in six.team:
		if not six.owned.has(id): six.owned[id]={"level":1,"quality":reg.ninjas[id].initial_quality,"permanent":{}}
	var full=Combat.new()
	full.setup(reg,six,reg.stages["STG-080"],42)
	check(full.alive(0).size()==6 and full.alive(1).size()==6,"6v6 setup")
	for i in range(200): full.tick(0.05)
	check(full.ticks>0,"6v6 ticks")
	quit(0 if failures==0 else 1)
