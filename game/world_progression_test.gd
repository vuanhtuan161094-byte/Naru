extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Guard=preload("res://game/save_guard.gd")
const Village=preload("res://game/village_service.gd")
const Rewards=preload("res://game/world_rewards.gd")
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
	if failures==0:print("NARU_WORLD_PROGRESSION_PASS")
	quit(0 if failures==0 else 1)
