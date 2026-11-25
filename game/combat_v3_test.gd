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
	# All eight formations, upgrade cap and exact stable skill records.
	for id in reg.formations:
		check(store.select_formation(reg,id),"select "+id)
		var test_sim=Combat.new()
		test_sim.setup(reg,store.state,reg.stages["STG-001"],42)
		var unit=test_sim.primary_alive(0)[0]
		check(test_sim.formation_multiplier(unit,reg.formations[id].stat)>=1.03,"formation stat "+id)
	store.state.formation_levels["FRM-08"]=20
	check(not store.upgrade_formation(reg,"FRM-08"),"formation cap")
	store.grant(reg,"NIN-002")
	check(store.set_world_squad("SQUAD-2",["NIN-002"]),"secondary roster")
	check(store.set_squad_formation(reg,"SQUAD-2","FRM-08",8,"NIN-002"),"secondary ninth slot and formation")
	var guard=preload("res://game/save_guard.gd")
	check(guard.valid(reg,store.state),"secondary formation save")
	var obstacle=Combat.new()
	obstacle.registry=reg
	obstacle.environment="forest"
	obstacle.configure_terrain({"terrain":[{"center":[0.5,0.5],"size":[1.0,2.0],"kind":"obstacle"}]})
	obstacle.add_actor("NIN-001",0,20,2,{},0,1.0)
	obstacle.add_actor("NIN-002",1,20,2,{},0,1.0)
	var runner=obstacle.actors[0]
	var blocker=obstacle.actors[1]
	runner.pos=Vector2(5,5)
	blocker.pos=Vector2(10,5)
	check(not obstacle.clear_segment(runner.pos,blocker.pos,0.03),"obstacle blocks line of sight")
	for i in range(100):obstacle.move_actor(runner,Vector2(9,5),0.12)
	check(runner.pos.x>7.8 and obstacle.position_clear(runner,runner.pos),"continuous detour around terrain")
	runner.pos=Vector2(9,5)
	blocker.pos=Vector2(10,5)
	for i in range(10):obstacle.move_actor(runner,blocker.pos,0.1)
	check(runner.pos.distance_to(blocker.pos)>=0.68,"opposing body collision")
	var shot=Combat.new()
	shot.registry=reg
	shot.qa_hold_ai=true
	shot.add_actor("NIN-001",0,20,2,{},0,1.0)
	shot.add_actor("NIN-002",1,20,2,{},0,1.0)
	var source=shot.actors[0]
	var victim=shot.actors[1]
	source.pos=Vector2(4,5)
	victim.pos=Vector2(7,5)
	var line={}
	for rule in reg.skills.values():
		if rule.shape=="line" and float(rule.projectile_speed_m_s)>0:line=rule.duplicate(true);break
	line.range_m=6.0
	line.chakra=0
	source.chakra=source.max_chakra
	check(shot.cast(source,line,victim),"fixed projectile cast")
	for i in range(60):
		shot.tick(0.05)
		if not shot.projectiles.is_empty():break
	victim.pos=Vector2(7,9)
	for i in range(100):shot.tick(0.05)
	check(shot.missed_casts==1 and shot.effect_dispatch_count==0,"fixed trajectory can be dodged")
	# Timed cast pipeline, not only direct dispatcher. Controlled fixture for every current record.
	var timed=0
	var count_by_shape={}
	var failed_ids=[]
	for id in reg.skills:
		var raw=reg.skills[id]
		var run=Combat.new()
		run.registry=reg
		run.qa_hold_ai=true
		run.rng.seed=42
		run.add_actor(raw.ninja_id,0,20,int(reg.ninjas[raw.ninja_id].initial_quality),{},0,1.0,{"forms":reg.ninjas[raw.ninja_id].form_ids,"unlocked_skills":reg.ninjas[raw.ninja_id].additional_skill_ids})
		run.add_actor("NIN-001",1,20,2,{},0,1.0)
		var caster=run.actors[0]
		var enemy=run.actors[1]
		caster.pos=Vector2(5,5)
		enemy.pos=Vector2(6,5)
		caster.hp=caster.max_hp*0.55
		caster.chakra=caster.max_chakra*0.95
		if raw.ai.condition=="self_chakra_below_0.5":caster.chakra=caster.max_chakra*0.4
		if raw.ai.condition=="ally_dispellable_status":run.apply_status(enemy,caster,{"status_id":"slow","chance":1.0,"duration_s":10})
		var skill=run.effective_skill(caster,id)
		var target=run.target_for(caster,skill)
		if run.cast(caster,skill,target):
			for i in range(160):
				run.tick(0.05)
				if caster.pending.is_empty() and run.projectiles.is_empty():break
			if run.effect_dispatch_count>0:
				timed+=1
				count_by_shape[raw.shape]=int(count_by_shape.get(raw.shape,0))+1
			else:failed_ids.append(id+" release")
		else:failed_ids.append(id+" cast")
	print("NARU_SKILL_TIMED ",timed,"/1152 ",count_by_shape," FAILED=",failed_ids)
	check(timed==1152,"all 1152 timed cast and effect dispatch")
	if failures==0:print("NARU_COMBAT_V3_PASS")
	quit(0 if failures==0 else 1)
