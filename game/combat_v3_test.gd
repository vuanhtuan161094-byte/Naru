extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Combat=preload("res://game/combat.gd")
const Formation=preload("res://game/formation_service.gd")
var failures=0
func check(ok: bool,message: String) -> void:
	if not ok:
		failures+=1
		push_error("COMBAT_V3_FAIL "+message)
	else:print("COMBAT_V3_OK "+message)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():
		quit(1)
		return
	var store=Store.new()
	store.save_path="user://combat_v3_ci.json"
	for suffix in ["",".bak",".tmp"]:DirAccess.remove_absolute(store.save_path+suffix)
	store.new_game(reg)
	check(reg.formations.size()==8,"eight formations")
	var a=str(store.state.team[0])
	var b=str(store.state.team[1])
	check(store.set_formation_slot(8,a),"move to ninth slot")
	check(int(store.state.formation_slots[a])==8,"slot persisted")
	check(store.set_formation_slot(7,b),"adjacent rear slots")
	check(not store.set_formation_slot(9,a),"invalid slot rejected")
	check(store.select_formation(reg,"FRM-03"),"choose formation")
	store.state.inventory["RES-001"]=10000
	check(store.upgrade_formation(reg,"FRM-03"),"upgrade")
	check(int(store.state.inventory["RES-001"])==9750 and int(store.state.formation_levels["FRM-03"])==2,"transaction")
	var reload=Store.new()
	reload.save_path=store.save_path
	reload.load_or_new(reg)
	check(int(reload.state.formation_slots[a])==8 and int(reload.state.formation_levels["FRM-03"])==2,"reload")
	var legacy=store.state.duplicate(true)
	legacy.erase("formation_slots")
	legacy.erase("formation_levels")
	legacy.erase("formation_id")
	Formation.ensure(reg,legacy)
	check(legacy.formation_slots.size()==legacy.team.size() and legacy.formation_id=="FRM-01","legacy migration")
	var sim=Combat.new()
	sim.setup(reg,store.state,reg.stages["STG-001"],42)
	check(sim.map_width==14 and sim.map_height==10,"standard")
	var actor={}
	var ally={}
	for unit in sim.primary_alive(0):
		if unit.id==a:actor=unit
		if unit.id==b:ally=unit
	check(int(actor.deployment_slot)==8 and actor.pos.is_equal_approx(Formation.spawn(0,8,14,10)),"actual ninth slot spawn")
	check(sim.link_count(actor)>=1 and sim.formation_multiplier(actor,"defense")>1.064,"linked defense")
	ally.pos=Vector2(13,9)
	check(sim.link_count(actor)==0,"distance breaks link")
	ally.pos=actor.pos+Vector2(0,1.5)
	ally.hp=0
	check(sim.link_count(actor)==0,"death breaks link")
	sim.move_actor(actor,Vector2(-100,-100),200.0)
	check(actor.pos.x>=0.2 and actor.pos.y>=0.2,"continuous movement bounded")
	var compact=Combat.new()
	compact.setup(reg,store.state,reg.stages["STG-002"],42)
	check(compact.map_width==12 and compact.map_height==8,"compact stage")
	var large=Combat.new()
	large.setup(reg,store.state,reg.stages["STG-120"],42)
	check(large.map_width==18 and large.map_height==12,"large stage")
	var custom=reg.stages["STG-001"].duplicate(true)
	custom.map_width=22
	custom.map_height=15
	var arbitrary=Combat.new()
	arbitrary.setup(reg,store.state,custom,42)
	check(arbitrary.map_width==22 and arbitrary.map_height==15,"custom dimensions")
	for slot in range(9):
		var left=Formation.spawn(0,slot,14,10)
		var right=Formation.spawn(1,slot,14,10)
		check(is_equal_approx(left.x+right.x,14.0) and is_equal_approx(left.y,right.y),"mirrored "+str(slot))
	if failures==0:print("NARU_COMBAT_V3_PASS")
	quit(0 if failures==0 else 1)
