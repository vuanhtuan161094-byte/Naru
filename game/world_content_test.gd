extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Village=preload("res://game/village_service.gd")
const Catalog=preload("res://game/world_content_catalog.gd")
const Guard=preload("res://game/save_guard.gd")
func check(ok:bool,msg:String) -> bool:
	if not ok:push_error("WORLD_CONTENT_FAIL "+msg)
	return ok

func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	var store=Store.new()
	store.save_path="user://world_content_fixture.json"
	store.new_game(reg)
	var s=store.state
	var ok=true
	var ids={}
	for row in Catalog.all():
		ok=check(not ids.has(row.id) and reg.stages.has(row.stage) and reg.resources.has(row.resource),"catalog reference") and ok
		ids[row.id]=true
	ok=check(ids.size()==24 and store.begin_expedition(reg,"EXP-01").is_empty(),"locked expedition") and ok
	for variant in Catalog.VARIANTS:
		var stage_variant=Catalog.battle_stage(reg,variant.id)
		ok=check(stage_variant.enemy_ids!=reg.stages[stage_variant.id].enemy_ids and stage_variant.enemy_ids.size()<=6 and reg.bosses[stage_variant.boss_id].primary_enemy_id in stage_variant.enemy_ids,"variant roster "+variant.id) and ok
		for npc in stage_variant.enemy_ids:ok=check(reg.npcs.has(npc),"variant npc") and ok
	ok=check(reg.gear_templates.size()==160,"32 gear variants") and ok
	for profession in reg.professions:
		var focus=Village.profession_focus(profession)
		ok=check(not focus.is_empty() and is_equal_approx(Village.profession_bonus(profession,focus,100,true),0.04) and Village.profession_bonus(profession,focus,100,false)==0.0,"profession focus "+profession) and ok
	for number in range(1,6):s.cleared["STG-%03d"%number]=true
	s.building_states["BLD-001"].level=2
	var resource="RES-116"
	var before=int(s.inventory.get(resource,0))
	var stamina=int(s.stamina)
	var event=store.begin_expedition(reg,"EXP-01")
	ok=check(not event.is_empty() and int(s.stamina)==stamina-12,"entry transaction") and ok
	if event.is_empty():quit(1);return
	# Settlement fixture deliberately exercises existing battle transaction, not a claim of combat win QA.
	var stage=reg.stages["STG-005"]
	ok=check(store.finish_stage(reg,stage,event,true,{}),"settlement") and ok
	var repeat_qty=0
	for reward in stage.repeat_rewards:
		if reward.resource_id==resource:repeat_qty+=int(reward.qty)
	ok=check(int(s.inventory.get(resource,0))==before+repeat_qty+4,"exact bonus") and ok
	ok=check(store.begin_expedition(reg,"EXP-01").is_empty() and not store.finish_stage(reg,stage,event,true,{}),"cooldown and duplicate reward") and ok
	var recipe=reg.recipes["RCP-001"]
	var building=str(recipe.building_id)
	var output=str(recipe.output.resource_id)
	s.building_states[building].level=2
	var ninja=str(s.owned.keys()[0])
	ok=check(Village.assign(reg,s,ninja,building,"JOB-09"),"staff fixture") and ok
	for input in recipe.inputs:s.inventory[input.resource_id]=100
	s.inventory[output]=20
	ok=check(store.production(reg,building,"RCP-001",true,1,20),"target queue") and ok
	var job=s.building_states[building].production
	ok=check(job.reserved.is_empty() and Village.target_reached(s,job,recipe),"target no predebit") and ok
	s.inventory[output]=19
	var cost=Village.effective_recipe_cost(s,recipe)
	var start_stock={}
	for key in cost:start_stock[key]=int(s.inventory.get(key,0))
	ok=check(Village.reserve(s,job,recipe),"resume") and ok
	for key in cost:ok=check(int(s.inventory[key])==int(start_stock[key])-int(cost[key]),"one reserve") and ok
	ok=check(store.cancel_production(building),"cancel") and ok
	for key in cost:ok=check(int(s.inventory[key])==int(start_stock[key]),"refund") and ok
	var Projects=preload("res://game/world_economy_projects.gd")
	s.building_states["BLD-028"].level=1
	s.inventory["RES-068"]=100
	s.inventory["RES-086"]=100
	s.inventory["RES-001"]=10000
	var duration=Village.batch_seconds(s,recipe)
	ok=check(store.upgrade_world_project("TECH-01") and Village.batch_seconds(s,recipe)<duration,"research actual speed") and ok
	ok=check(not store.upgrade_world_project("TECH-01"),"research level gate") and ok
	s.building_states["BLD-001"].level=3
	s.inventory["RES-056"]=100
	s.inventory["RES-057"]=100
	var home=str(s.world_location)
	ok=check(store.develop_territory(reg,home) and int(s.territory_states[home].development)==1,"territory investment") and ok
	ok=check(not store.develop_territory(reg,home),"territory HQ gate") and ok
	ok=check(Guard.valid(reg,s),"save compatibility") and ok
	if not ok:quit(1);return
	print("NARU_WORLD_CONTENT_PASS 24 catalog refs, cooldown settlement and target queue; no simulated combat claim")
	quit()
