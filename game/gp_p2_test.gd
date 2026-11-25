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
	var source=full.actors[0]
	var target=full.actors[6]
	full.apply_status(source,target,{"status_id":"burn","chance":1.0,"duration_s":3.0,"tick_coefficient":0.1})
	check(full.has_status(target,"burn"),"burn applied")
	var before=float(target.hp)
	full.update_status(target,1.0)
	check(float(target.hp)<before or target.shield>0,"dot tick")
	full.apply_status(source,target,{"status_id":"stun","chance":1.0,"duration_s":0.1})
	full.update_status(target,0.2)
	check(target.immune>0,"control immunity")
	var summon_skill=reg.skills["NIN-001-S1"]
	full.summon_actor(source,summon_skill,summon_skill.effects[0])
	check(full.summon_count(source,summon_skill.skill_id)==1,"summon spawned")
	check(full.primary_alive(0).size()<=6,"summon excluded from team limit")
	target.element_tick=full.ticks
	target.last_element="water"
	target.reaction_tick=-1000
	check(is_equal_approx(full.reaction(source,target,"lightning"),1.2),"water lightning reaction")
	store.state.inventory["RES-119"]=1000
	var skill_id="NIN-001-S2"
	check(store.upgrade_skill(reg,"NIN-001",skill_id),"skill level transaction")
	var p=store.state.owned["NIN-001"]
	p.skill_levels[skill_id].level=20
	p.skill_levels[skill_id].fails=4
	check(store.advance_skill(reg,"NIN-001",skill_id)=="success","skill grade pity")
	check(int(p.skill_levels[skill_id].grade)==2,"skill grade persisted")
	check(store.craft_gear(reg,"EQ-001-Q1").is_empty(),"gear locked without workshop")
	# Explicit CI fixture, not a player grant.
	store.state.building_states["BLD-017"]={"level":1}
	store.state.inventory["RES-059"]=100
	store.state.inventory["RES-110"]=100
	store.state.inventory["RES-113"]=100
	store.state.inventory["RES-114"]=100
	store.state.inventory["RES-132"]=100
	store.state.inventory["RES-077"]=5
	var gear_id=store.craft_gear(reg,"EQ-001-Q1")
	check(not gear_id.is_empty(),"gear craft costs")
	check(store.equip_gear(reg,"NIN-001",gear_id),"equip gear")
	check(not store.equip_gear(reg,"NIN-003",gear_id),"reject shared gear")
	store.state.gear_instances[gear_id].fails=20
	check(store.enhance_gear(gear_id)=="success","enhance pity")
	check(store.refine_gear(gear_id),"refine gear")
	check(store.refine_gear(gear_id,true),"evolve gear")
	check(store.socket_gear(reg,gear_id,"RES-077"),"socket gem")
	check(store.socket_gear(reg,gear_id,"RES-077",true),"return gem")
	var equipped=Combat.new()
	equipped.setup(reg,store.state,stage,42)
	check(float(equipped.actors[0].gear_stats.get("hp",0))>10,"gear stats affect combat")
	var persisted=Store.new()
	persisted.save_path=store.save_path
	persisted.load_or_new(reg)
	check(persisted.state.gear_instances[gear_id].owner=="NIN-001","gear reload")
	quit(0 if failures==0 else 1)
