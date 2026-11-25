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
