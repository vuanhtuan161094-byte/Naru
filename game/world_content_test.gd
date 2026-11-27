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
	for row in Catalog.EXPEDITIONS:
		ok=check(not ids.has(row.id) and reg.stages.has(row.stage) and reg.resources.has(row.resource),"catalog reference") and ok
		ids[row.id]=true
	ok=check(ids.size()==12 and store.begin_expedition(reg,"EXP-01").is_empty(),"locked expedition") and ok
	s.cleared["STG-005"]=true
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
	ok=check(Guard.valid(reg,s),"save compatibility") and ok
	if not ok:quit(1);return
	print("NARU_WORLD_CONTENT_PASS 12 catalog refs, cooldown settlement and target queue; no simulated combat claim")
	quit()
