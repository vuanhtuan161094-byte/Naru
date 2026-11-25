extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Guard=preload("res://game/save_guard.gd")
const Village=preload("res://game/village_service.gd")
const Rewards=preload("res://game/world_rewards.gd")
const Quotes=preload("res://game/progression_quotes.gd")
var failures=0
func check(ok: bool,description: String) -> void:
	if not ok:
		failures+=1
		push_error("WORLD_PROGRESSION_FAIL "+description)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():
		quit(1)
		return
	var store=Store.new()
	store.save_path="user://world_progression_ci.json"
	for suffix in ["",".bak",".tmp"]:
		if FileAccess.file_exists(store.save_path+suffix):DirAccess.remove_absolute(store.save_path+suffix)
	store.new_game(reg)
	check(Guard.valid(reg,store.state),"fresh save")
	check(store.setup_starter_jobs(reg),"starter jobs")
	var now=int(store.state.high_water_timestamp)
	check(store.advance_clock(reg,now+600),"natural clock progression")
	check(not store.advance_clock(reg,now+600),"same clock not paid twice")
	check(Guard.valid(reg,store.state),"natural save")
	# Explicit capacity boundary fixture, not natural progression evidence.
	var cap=Rewards.capacity(store.state,"RES-022")
	store.state.inventory["RES-022"]=cap
	Rewards.deliver(store.state,"RES-022",7)
	check(int(store.state.inventory["RES-022"])==cap and int(store.state.reward_inbox["RES-022"])==7,"overflow conserved")
	store.state.building_states["BLD-012"].production={"recipe":"RCP-001","repeat":false,"remaining":12,"reserved":{"RES-022":2}}
	check(store.cancel_production("BLD-012"),"cancel at full storage")
	check(store.state.building_states["BLD-012"].production.is_empty() and int(store.state.reward_inbox["RES-022"])==9,"refund in inbox")
	check(not store.cancel_production("BLD-012"),"cancel once")
	store.state.inventory["RES-022"]=cap-4
	check(store.collect_reward_inbox("RES-022"),"partial inbox claim")
	check(int(store.state.inventory["RES-022"])==cap and int(store.state.reward_inbox["RES-022"])==5,"partial exact quantity")
	check(not store.collect_reward_inbox("RES-022"),"no duplicate claim at cap")
	var corrupt=store.state.duplicate(true)
	corrupt.world_seconds=600
	check(not Guard.valid(reg,corrupt),"reject invalid clock")
	corrupt=store.state.duplicate(true)
	corrupt.world_location="TER-UNKNOWN"
	check(not Guard.valid(reg,corrupt),"reject invalid location")
	corrupt=store.state.duplicate(true)
	corrupt.owned["NIN-001"].summon_contract="MISSING"
	check(not Guard.valid(reg,corrupt),"reject dangling summon")
	corrupt=store.state.duplicate(true)
	corrupt.owned["NIN-001"].beast_id="MISSING"
	check(not Guard.valid(reg,corrupt),"reject dangling beast")
	corrupt=store.state.duplicate(true)
	corrupt.travel={"destination":"TER-001","remaining":10,"path":["TER-UNKNOWN"],"team":corrupt.team.duplicate()}
	check(not Guard.valid(reg,corrupt),"reject invalid travel path")
	check(store.save_now(),"persist")
	var loaded=Store.new()
	loaded.save_path=store.save_path
	loaded.load_or_new(reg)
	check(int(loaded.state.get("reward_inbox",{}).get("RES-022",0))==5,"reload overflow")
	check(Guard.valid(reg,loaded.state),"reload valid")
	progression_checks(reg)
	coverage_checks(reg)
	batch_checks(reg)
	p4_checks(reg)
	p5_checks(reg)
	full_recipe_fixture(reg)
	beast_capture_fixture(reg)
	review_checks(reg)
	p6_checks(reg)
	if failures==0:print("NARU_WORLD_PROGRESSION_PASS")
	quit(0 if failures==0 else 1)

func progression_checks(reg) -> void:
	var store=Store.new()
	store.save_path="user://world_progression_p2_ci.json"
	store.new_game(reg)
	store.rng.seed=42
	check(store.setup_starter_jobs(reg),"P2 starter jobs")
	check(store.construct(reg,"BLD-001"),"P2 starter HQ")
	var now=int(store.state.high_water_timestamp)
	check(store.advance_clock(reg,now+3600),"P2 earn resource")
	check(Village.level(store.state,"BLD-001")==2,"P2 HQ2 reached")
	var money=int(store.state.inventory["RES-001"])
	check(store.buy_training_scrolls("RES-117",2),"P2 purchase earned scrolls")
	check(int(store.state.inventory["RES-001"])==money-1200,"P2 exact purchase debit")
	check(store.train_batch(reg,"NIN-001","RES-117",2),"P2 real training")
	var ninja=store.state.owned["NIN-001"]
	check(int(ninja.level)>1,"P2 level gained")
	var points=int(ninja.points)
	if points>=10:
		check(store.allocate("NIN-001","strength",10),"P2 bulk points")
		check(int(ninja.points)==points-10,"P2 exact point debit")
	check(not store.allocate("NIN-001","strength",101),"P2 invalid batch")
	# Explicit book fixture verifies atomic quote, not organic material proof.
	var skill="NIN-001-S1"
	var book=store.skill_book(reg,skill)
	store.state.inventory[book]=100
	var quote=Quotes.skill_batch(1,1,100,20)
	check(store.upgrade_skill(reg,"NIN-001",skill,20),"P2 bulk skill")
	check(int(store.skill_progress(ninja,skill).level)==1+int(quote.count),"P2 quoted levels")
	check(int(store.state.inventory[book])==100-int(quote.cost),"P2 exact book cost")
	check(Quotes.grade_chance(1,4)==1.0 and Quotes.realm_chance(5)==1.0 and Quotes.enhancement_chance(30,20)==1.0,"P2 pity quotes")
	var held=""
	for key in reg.passives:
		if reg.passives[key].ninja_id=="NIN-001" and reg.passive_ledger[key]!="DEV_CANDIDATE":
			held=key
			break
	if held!="":
		ninja.realm=100
		check(not store.upgrade_passive(reg,"NIN-001",held),"P2 HOLD backend no spend")
	print("NARU_WORLD_P2_ORGANIC_HQ ",Village.level(store.state,"BLD-001")," LEVEL ",ninja.level," RYO ",store.state.inventory["RES-001"])

func coverage_checks(reg) -> void:
	var sources={}
	for source in reg.supply:sources[source.resource_id]=true
	for recipe in reg.recipes.values():sources[recipe.output.resource_id]=true
	for quest in reg.quests.values():
		for reward in quest.reward:sources[reward.resource_id]=true
	for stage in reg.stages.values():
		for reward in stage.first_clear_rewards+stage.repeat_rewards:sources[reward.resource_id]=true
	check(sources.size()==reg.resources.size(),"P2 150 resource references")
	for gear in reg.gear_templates.values():
		for item in gear.craft.inputs:check(sources.has(item.resource_id),"gear source "+str(gear.id))
	print("NARU_WORLD_P2_STRUCTURAL_RESOURCES ",sources.size()," GEAR ",reg.gear_templates.size())

func batch_checks(reg) -> void:
	var store=Store.new()
	store.save_path="user://world_progression_p3_ci.json"
	store.new_game(reg)
	store.setup_starter_jobs(reg)
	check(store.construct(reg,"BLD-012"),"P3 farm upgrade")
	check(store.advance_clock(reg,int(store.state.high_water_timestamp)+3600),"P3 natural farm stock")
	check(Village.level(store.state,"BLD-012")==2,"P3 farm level")
	var before=int(store.state.inventory.get("RES-033",0))
	check(store.production(reg,"BLD-012","RCP-001",false,5),"P3 earned finite production")
	check(store.advance_clock(reg,int(store.state.high_water_timestamp)+1800),"P3 production clock")
	check(store.state.building_states["BLD-012"].production.is_empty(),"P3 finite queue completes")
	check(int(store.state.inventory.get("RES-033",0))>=before+5,"P3 five actual outputs")
	var event=store.begin_stage(reg.stages["STG-001"])
	check(event!="","P3 start battle")
	check(store.begin_stage(reg.stages["STG-001"])=="","P3 no concurrent battle")
	var snapshot=store.export_save()
	check(store.import_save(reg,snapshot),"P3 interrupted import")
	check(store.state.ledger[event].status=="interrupted","P3 interrupted ledger settled")
	var stamina=int(store.state.stamina)
	check(not store.recover_interrupted(reg) and int(store.state.stamina)==stamina,"P3 refund not repeated")
	check(Guard.valid(reg,store.state),"P3 natural save")
	# Deliberate fixture for all template instantiation and special transaction coverage.
	for id in reg.ninjas:
		if not store.state.owned.has(id):store.grant(reg,id)
	check(store.state.owned.size()==144,"P3 144 owned fixture")
	for resource in reg.resources:store.state.inventory[resource]=100000
	for id in ["BLD-017","BLD-019","BLD-026"]:store.state.building_states[id].level=10
	var crafted=0
	for id in reg.gear_templates:
		var item=store.craft_gear(reg,id)
		if item!="":crafted+=1
	check(crafted==128,"P3 128 gear craft transactions fixture")
	var n=store.state.owned["NIN-001"]
	n.shards=10000
	for i in range(14):check(store.raise_star(reg,"NIN-001"),"P3 star step "+str(i))
	check(int(n.stars)==15 and not store.raise_star(reg,"NIN-001"),"P3 star cap")
	for id in reg.contracts:
		check(store.make_contract(reg,id),"P3 contract "+str(id))
		check(store.train_contract(id,5),"P3 contract batch "+str(id))
		check(int(store.state.summon_contracts[id].level)==6,"P3 contract level "+str(id))
	for id in reg.beasts:
		store.state.beasts[id]={"host":"","level":1,"xp":0}
		check(store.train_beast(reg,id,10),"P3 beast batch "+str(id))
		check(int(store.state.beasts[id].level)>1,"P3 beast level "+str(id))
	print("NARU_WORLD_P3_FIXTURE ninja=",store.state.owned.size()," gear=",crafted," contracts=",store.state.summon_contracts.size()," beasts=",store.state.beasts.size())

func p4_checks(reg) -> void:
	var store=Store.new()
	store.save_path="user://world_progression_p4_ci.json"
	store.new_game(reg)
	check(store.craft_gear(reg,"EQ-001-Q1",true)=="","P4 starter HQ gate")
	store.setup_starter_jobs(reg)
	check(store.construct(reg,"BLD-001"),"P4 HQ build")
	check(store.advance_clock(reg,int(store.state.high_water_timestamp)+3600),"P4 natural economy")
	var before=int(store.state.inventory["RES-001"])
	var gear=store.craft_gear(reg,"EQ-001-Q1",true)
	check(gear!="" and int(store.state.inventory["RES-001"])==before-180,"P4 earned starter gear")
	if gear!="":
		check(int(store.state.gear_instances[gear].quality)==1 and store.equip_gear(reg,"NIN-001",gear),"P4 fixed Q1 equip")
	check(store.craft_gear(reg,"EQ-001-Q2",true)=="","P4 no high tier bypass")
	check(not store.exchange_shards("NIN-001",1),"P4 shard gate")
	# Market fixture for same-stock-boundary quote; no positive round trip at any tested volume.
	var world=preload("res://game/world_service.gd")
	for qty in [1,10,100]:
		var stock=store.state.faction_states["FAC-001"].stock
		var initial=int(stock.get("RES-006",0))
		var buy=world.quote_trade(reg,store.state,"FAC-001","RES-006",qty,true)
		stock["RES-006"]=initial-qty
		var sell=world.quote_trade(reg,store.state,"FAC-001","RES-006",qty,false)
		check(buy>=sell,"P4 no reversal profit "+str(qty))
		stock["RES-006"]=initial
	# Explicit progression fixture; not evidence of naturally reaching HQ5 or harvest gate.
	store.state.building_states["BLD-001"].level=5
	store.state.building_states["BLD-009"].level=1
	store.state.inventory["RES-134"]=10
	var shards=int(store.state.owned["NIN-001"].shards)
	check(store.exchange_shards("NIN-001",5),"P4 targeted exchange")
	check(int(store.state.owned["NIN-001"].shards)==shards+5 and int(store.state.inventory["RES-134"])==0,"P4 shard exact cost")
	check(not store.exchange_shards("NIN-001",1),"P4 no free shard")
	check(not store.harvest_territory(reg,"TER-057","RES-095"),"P4 unowned harvest")
	store.state.territory_states["TER-057"].owner="FAC-009"
	store.state.building_states["BLD-019"].level=6
	check(store.assign_job(reg,"NIN-005","BLD-019","JOB-10"),"P4 workshop crew")
	var old=int(store.state.inventory.get("RES-095",0))
	check(store.harvest_territory(reg,"TER-057","RES-095"),"P4 supplemental harvest")
	check(int(store.state.inventory.get("RES-095",0))==old+1,"P4 exact harvest")
	check(not store.harvest_territory(reg,"TER-057","RES-095"),"P4 cooldown")
	check(not store.harvest_territory(reg,"TER-058","RES-006"),"P4 no raw double harvest")
	check(not store.beast_capture_ready(reg,"NIN-001","BIJ-1"),"P4 beast gate")
	check(not store.beast_bind_ready(reg,"NIN-001","BIJ-1"),"P4 no uncaptured beast bind")
	check(Guard.valid(reg,store.state),"P4 save valid")
	print("NARU_WORLD_P4_TRANSACTIONS_PASS")

func p5_checks(reg) -> void:
	var store=Store.new()
	store.save_path="user://world_progression_p5_ci.json"
	store.new_game(reg)
	check(store.merchant_quote(reg,"RES-006").is_empty(),"P5 merchant hall gate")
	# Scoped capacity/limit fixture; not organic proof.
	store.state.building_states["BLD-021"].level=1
	store.state.building_states["BLD-001"].level=11
	var cap=Village.capacity(store.state,"RES-006")
	store.state.inventory["RES-006"]=cap
	var q=store.merchant_quote(reg,"RES-006")
	var ryo=int(store.state.inventory["RES-001"])
	check(store.fulfill_merchant_order(reg,"RES-006"),"P5 merchant first")
	check(int(store.state.inventory["RES-001"])==ryo+int(q.total) and int(store.state.inventory["RES-006"])==cap-int(q.qty),"P5 merchant exact exchange")
	check(store.fulfill_merchant_order(reg,"RES-006"),"P5 merchant second")
	check(not store.fulfill_merchant_order(reg,"RES-006"),"P5 reserve floor")
	store.state.inventory["RES-009"]=cap
	check(store.fulfill_merchant_order(reg,"RES-009"),"P5 merchant third")
	check(not store.fulfill_merchant_order(reg,"RES-009"),"P5 daily limit")
	check(store.advance_clock(reg,int(store.state.high_water_timestamp)+86400),"P5 day advance")
	check(store.fulfill_merchant_order(reg,"RES-009"),"P5 next day order")
	check(store.buy_training_scrolls("RES-116",50),"P5 bulk scroll purchase")
	store.state.building_states["BLD-003"].level=1
	store.state.inventory["RES-118"]=20
	check(store.train_stat(reg,"NIN-001","strength",5),"P5 stat batch")
	check(float(store.state.owned["NIN-001"].training.strength)>=5,"P5 stat gain")
	check(Guard.valid(reg,store.state),"P5 new save compatible")
	var invalid=store.state.duplicate(true)
	invalid.merchant_orders.used=4
	check(not Guard.valid(reg,invalid),"P5 rejects invalid merchant count")
	print("NARU_WORLD_P5_TRANSACTIONS_PASS")

func full_recipe_fixture(reg) -> void:
	var store=Store.new()
	store.save_path="user://world_recipe_full_p5.json"
	store.new_game(reg)
	for resource in reg.resources:store.state.inventory[resource]=10000
	store.state.building_states["BLD-001"].level=15
	var assigned={}
	var index=0
	var ninjas=reg.ninjas.keys()
	for recipe in reg.recipes.values():
		var building=str(recipe.building_id)
		if assigned.has(building):continue
		store.state.building_states[building].level=9
		var ninja=str(ninjas[index])
		index+=1
		if not store.state.owned.has(ninja):store.grant(reg,ninja)
		check(store.assign_job(reg,ninja,building,Village.specialty(building)),"P5 recipe worker "+building)
		assigned[building]=true
	var count=0
	for recipe in reg.recipes.values():
		var building=str(recipe.building_id)
		var resource=str(recipe.output.resource_id)
		var before=int(store.state.inventory.get(resource,0))
		if not store.production(reg,building,str(recipe.id),false):
			check(false,"P5 recipe enqueue "+str(recipe.id))
			continue
		store.advance_clock(reg,int(store.state.high_water_timestamp)+600)
		var settled=store.state.building_states[building].production.is_empty() and int(store.state.inventory.get(resource,0))>before
		check(settled,"P5 recipe settle "+str(recipe.id))
		if settled:count+=1
	check(count==63,"P5 all recipes real transactions fixture")
	check(Guard.valid(reg,store.state),"P5 recipe fixture save")
	print("NARU_WORLD_P5_RECIPE_FIXTURE ",count,"/63")

func beast_capture_fixture(reg) -> void:
	var store=Store.new()
	store.save_path="user://world_beast_full_p5.json"
	store.new_game(reg)
	store.state.building_states["BLD-001"].level=15
	store.state.building_states["BLD-027"].level=1
	store.state.inventory["RES-100"]=1000
	var veteran=store.state.owned["NIN-001"]
	veteran.realm=14
	veteran.level=280
	veteran.permanent={"strength":100000,"vitality":100000,"intellect":100000,"spirit":100000,"agility":100000}
	var captured=0
	var bound=0
	for beast_id in reg.beasts:
		var won=store.capture_beast(reg,"NIN-001",beast_id)
		check(won,"P5 capture "+str(beast_id))
		if not won:continue
		captured+=1
		check(not store.capture_beast(reg,"NIN-001",beast_id),"P5 capture unique "+str(beast_id))
		for host in reg.beasts[beast_id].compatibility.preferred_host_ids:
			if not store.state.owned.has(host):store.grant(reg,host)
			if store.bind_beast(reg,host,beast_id):
				bound+=1
				break
		check(str(store.state.beasts[beast_id].host)!="","P5 compatible bind "+str(beast_id))
		check(store.train_beast(reg,beast_id),"P5 train captured "+str(beast_id))
	check(captured==9 and bound==9,"P5 capture and bind all fixture")
	check(Guard.valid(reg,store.state),"P5 beast fixture save")
	print("NARU_WORLD_P5_BEAST_FIXTURE captured=",captured," bound=",bound)

func review_checks(reg) -> void:
	var store=Store.new()
	store.save_path="user://world_review_p5_ci.json"
	store.new_game(reg)
	store.rng.seed=12345
	check(store.save_now(),"review seed save")
	check(str(store.state.rng_seed)==str(store.rng.seed),"review seed persisted")
	var raw=store.export_save()
	var loaded=Store.new()
	loaded.save_path=store.save_path
	loaded.load_or_new(reg)
	check(loaded.rng.seed==store.rng.seed and loaded.rng.state==store.rng.state,"review RNG reload")
	var next=store.rng.randi()
	check(loaded.rng.randi()==next,"review RNG reproducible")
	check(loaded.import_save(reg,raw),"review RNG import")
	var content=preload("res://game/content_service.gd")
	var cap=Rewards.capacity(store.state,"RES-001")
	store.state.inventory["RES-001"]=cap
	check(store.start_mission(reg,"NIN-001","RES-001",true),"review full wallet mission")
	content.step(store.state,1000)
	check(int(store.state.inventory["RES-001"])==cap and int(store.state.missions["NIN-001"].remaining)==0,"review currency cap waits")
	store.state.inventory["RES-001"]=cap-1000
	content.step(store.state,1)
	check(int(store.state.inventory["RES-001"])>cap-1000 and int(store.state.inventory["RES-001"])<=cap,"review mission resumes")
	print("NARU_WORLD_REVIEW_PASS")

func p6_checks(reg) -> void:
	var store=Store.new()
	store.save_path="user://world_p6_ci.json"
	store.new_game(reg)
	var guide=preload("res://game/resource_guide.gd")
	var plan=guide.plan(reg,{"RES-110":1,"RES-111":1},{})
	check(int(plan.orders.get("RCP-051",0))==2,"P6 shared intermediate exact requirement")
	check(plan.raw.has("RES-011"),"P6 underlying raw dependency")
	var preview=store.player_preview(reg,"NIN-001")
	check(preview.has("hp") and preview.has("natk"),"P6 shared snapshot")
	store.state.owned["NIN-001"].stars=5
	var expected=preload("res://game/combat_stat_snapshot.gd").snapshot(reg,reg.ninjas["NIN-001"],1,int(store.state.owned["NIN-001"].quality),{},store.state.owned["NIN-001"],{},true).stats
	check(is_equal_approx(float(store.player_preview(reg,"NIN-001").hp),float(expected.hp)),"P6 exact star snapshot")
	check(store.xp_to_cap("NIN-001")>0,"P6 XP quote")
	check(store.beast_capture_reason(reg,"NIN-001","BIJ-1")!="","P6 beast gate reason")
	store.state.building_states["BLD-026"].level=1
	store.state.inventory["RES-148"]=10
	check(store.make_contract(reg,"SUM-001"),"P6 contract create")
	check(store.assign_contract("SUM-001","NIN-001"),"P6 contract assign")
	check(store.unassign_contract("SUM-001") and store.assign_contract("SUM-001","NIN-003"),"P6 reassign contract")
	check(Guard.valid(reg,store.state),"P6 save valid")
	print("NARU_WORLD_P6_TRANSACTIONS_PASS")
