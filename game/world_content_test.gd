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
	ok=check(ids.size()==30 and store.begin_expedition(reg,"EXP-01").is_empty(),"locked expedition") and ok
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
	var Activities=preload("res://game/world_activities.gd")
	s.inventory["RES-034"]=10
	s.inventory["RES-035"]=10
	s.stamina=50
	ok=check(store.use_world_food("RES-035") and int(s.stamina)==62,"food actual stamina") and ok
	ok=check(store.use_world_food("RES-035") and store.use_world_food("RES-035") and not store.use_world_food("RES-034"),"food daily cap") and ok
	var tower_event=store.begin_tower(reg,1)
	ok=check(not tower_event.is_empty(),"tower start") and ok
	if tower_event.is_empty():quit(1);return
	var tower_stage=Activities.tower_stage(reg,1)
	var before_ryo=int(s.inventory["RES-001"])
	ok=check(store.finish_stage(reg,tower_stage,tower_event,true,{}) and int(s.tower_best)==1 and int(s.inventory["RES-001"])==before_ryo+300,"tower settlement") and ok
	ok=check(store.begin_tower(reg,1).is_empty() and not store.finish_stage(reg,tower_stage,tower_event,true,{}),"tower duplicate prevention") and ok
	ok=check(store.begin_tower(reg,3).is_empty(),"tower order") and ok
	for floor_number in range(1,31):
		var ts=Activities.tower_stage(reg,floor_number)
		ok=check(not ts.is_empty() and not Activities.tower_rewards(floor_number).is_empty(),"tower floor data") and ok
	s.building_states["BLD-030"].level=1
	s.inventory["RES-057"]=100
	s.inventory["RES-059"]=100
	ok=check(store.fortify_home() and int(s.fortification)==1 and is_equal_approx(float(Activities.defense_quote(s).loss_rate),0.088),"fortification") and ok
	ok=check(not store.fortify_home(),"fortification gate") and ok
	var raw_cost=Village.effective_recipe_cost(s,recipe)
	var before_stock={}
	for key in raw_cost:before_stock[key]=int(s.inventory.get(key,0))
	ok=check(store.enqueue_recipe(reg,building,"RCP-001",2),"waiting order") and ok
	for key in raw_cost:ok=check(int(s.inventory[key])==int(before_stock[key]),"queue no upfront cost") and ok
	ok=check(Village.promote_waiting(reg,s,building),"promote queue") and ok
	ok=check(s.building_states[building].get("waiting_orders",[]).is_empty() and int(s.building_states[building].production.batches_left)==2,"queue active") and ok
	ok=check(store.cancel_production(building),"cancel queue active") and ok
	var Content=preload("res://game/content_service.gd")
	Content.bump(s,"clear_stage",20)
	ok=check(store.claim_weekly("WK-01") and not store.claim_weekly("WK-01"),"weekly claim once") and ok
	var gear_id=store.craft_gear(reg,"EQ-006-Q3")
	if gear_id.is_empty():
		var def=reg.gear_templates["EQ-006-Q3"]
		s.building_states[def.craft.building_id].level=10
		for item in def.craft.inputs:s.inventory[item.resource_id]=100
		gear_id=store.craft_gear(reg,"EQ-006-Q3")
	ok=check(not gear_id.is_empty() and store.salvage_gear(reg,gear_id) and not store.salvage_gear(reg,gear_id),"salvage once") and ok
	s.building_states["BLD-002"].level=2
	s.inventory["RES-068"]=100
	ok=check(store.train_profession(reg,ninja) and not store.train_profession(reg,ninja),"profession training cooldown") and ok
	var World=preload("res://game/world_service.gd")
	s.building_states["BLD-021"].level=1
	var faction="FAC-001"
	s.relations[World.relation_key("FAC-009",faction)]={"score":20,"state":"trade"}
	s.faction_states[faction].stock["RES-006"]=100
	s.inventory["RES-006"]=50
	s.inventory["RES-001"]=10000
	ok=check(store.set_trade_order(reg,"1",faction,"RES-006",true,60) and not store.set_trade_order(reg,"2",faction,"RES-006",true,60),"order limit") and ok
	s.trade_orders["1"].due=int(s.simulation_seconds)
	World.run_trade_orders(reg,s)
	ok=check(int(s.inventory["RES-006"])==60 and int(s.faction_states[faction].stock["RES-006"])==90 and int(s.inventory["RES-001"])<10000,"paid trade") and ok
	ok=check(store.remove_trade_order("1"),"remove trade order") and ok
	# Tax is a conversion of a real deposit. Full storage blocks both deposit and tax.
	var tax_region=Projects.source_region(reg,s,"RES-006")
	ok=check(not tax_region.is_empty() and store.set_territory_tax(tax_region,20),"tax policy") and ok
	var old_wood=int(s.inventory["RES-006"])
	var old_ryo=int(s.inventory["RES-001"])
	var levy=Projects.levy_quote(reg,s,tax_region,"RES-006",10)
	ok=check(int(levy.qty)==8 and int(levy.levy)==2 and int(levy.ryo)>0,"tax conversion") and ok
	ok=check(Village.put_territory_yield(reg,s,tax_region,"RES-006",10) and int(s.inventory["RES-006"])==old_wood+8 and int(s.inventory["RES-001"])==old_ryo+int(levy.ryo),"actual taxed deposit") and ok
	s.inventory["RES-006"]=Village.capacity(s,"RES-006")
	old_ryo=int(s.inventory["RES-001"])
	ok=check(not Village.put_territory_yield(reg,s,tax_region,"RES-006",10) and int(s.inventory["RES-001"])==old_ryo,"no tax on blocked production") and ok
	s.inventory["RES-006"]=old_wood
	ok=check(store.set_territory_tax(tax_region,0) and not store.set_territory_tax(tax_region,100),"tax range") and ok
	# Validate all authored variants and initialize actual Godot combat for representative battles.
	var Combat=preload("res://game/combat.gd")
	for variant in Catalog.CHALLENGES:
		var encounter=Catalog.battle_stage(reg,variant.id)
		ok=check(reg.bosses[encounter.boss_id].primary_enemy_id in encounter.enemy_ids and encounter.enemy_ids.size()<=6,"boss challenge primary") and ok
		for npc in encounter.enemy_ids:ok=check(reg.npcs.has(npc),"boss challenge npc") and ok
	for encounter in [Catalog.battle_stage(reg,"EXP-13"),Catalog.battle_stage(reg,"EXP-25"),Catalog.battle_stage(reg,"EXP-26"),Activities.tower_stage(reg,1),Activities.tower_stage(reg,30)]:
		var sim=Combat.new()
		sim.setup(reg,s,encounter,731)
		ok=check(sim.actors.size()==s.team.size()+encounter.enemy_ids.size(),"real combat setup "+str(encounter.name_vi)) and ok
		for tick in range(120):
			if sim.outcome!="":break
			sim.tick(0.05)
		ok=check(not sim.actors.is_empty(),"combat tick "+str(encounter.name_vi)) and ok
	ok=check(Guard.valid(reg,s),"save compatibility") and ok
	if not ok:quit(1);return
	print("NARU_WORLD_CONTENT_PASS 30 catalog refs, cooldown settlement and target queue; no simulated combat claim")
	quit()
