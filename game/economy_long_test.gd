extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Village=preload("res://game/village_service.gd")
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():
		quit(1)
		return
	var game=Store.new()
	game.save_path="user://gp_economy_long_ci.json"
	game.new_game(reg)
	var s=game.state
	# No inventory fixture: only starter seed, three original ninjas, repeating Ryo mission.
	if not Village.assign(reg,s,"NIN-001","BLD-015","JOB-10") or not Village.assign(reg,s,"NIN-003","BLD-014","JOB-10") or not Village.assign(reg,s,"NIN-005","BLD-012","JOB-09"):
		quit(1)
		return
	var content=preload("res://game/content_service.gd")
	if not content.start_mission(reg,s,"NIN-001","RES-001",true):
		quit(1)
		return
	var time=int(s.high_water_timestamp)
	for day in range(1,91):
		if Village.level(s,"BLD-001")<15:Village.construct(reg,s,"BLD-001")
		time+=86400
		Village.advance(reg,s,time)
		if day in [1,7,30,90]:
			print("NARU_ECONOMY_DAY ",day," HQ=",Village.level(s,"BLD-001")," RYO=",s.inventory.get("RES-001",0)," WOOD=",s.inventory.get("RES-006",0)," STONE=",s.inventory.get("RES-009",0)," JOB=",Village.worker_level(s,"BLD-015")," NPC_WARS=",s.npc_war_count)
		for qty in s.inventory.values():
			if int(qty)<0:
				quit(1)
				return
	if int(s.npc_war_count)>360:
		push_error("NPC wars exceed global 6-hour cadence")
		quit(1)
		return
	if Village.level(s,"BLD-001")<15 or not game.save_now():
		quit(1)
		return
	print("NARU_ECONOMY_90D_PASS")
	quit()
