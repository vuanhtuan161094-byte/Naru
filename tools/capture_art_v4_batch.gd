extends SceneTree


func _initialize() -> void:
	call_deferred("run_capture")

func run_capture() -> void:
	if "--lint-only" in OS.get_cmdline_user_args():
		print("ART_V4_CAPTURE_SCRIPT_PARSE_OK")
		quit(0)
		return
	var ids: Array[String] = []
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--ids="):
			for raw_id in arg.trim_prefix("--ids=").split(",", false):
				ids.append(raw_id.strip_edges())
	if ids.size() != 6:
		push_error("ART_V4_CAPTURE requires exactly six comma-separated IDs")
		quit(2)
		return
	var scene: PackedScene = load("res://game/Main.tscn")
	if scene == null:
		push_error("ART_V4_CAPTURE could not load Main.tscn")
		quit(5)
		return
	var main = scene.instantiate()
	root.add_child(main)
	await process_frame
	main.art.enabled = true
	for id in ids:
		var path = "res://art/factory/production/%s/runtime/%s.json" % [id, id]
		if not FileAccess.file_exists(path):
			push_error("ART_V4_CAPTURE missing runtime kit: " + path)
			quit(3)
			return
		if not main.art.import_character_overlay(FileAccess.get_file_as_string(path), id):
			push_error("ART_V4_CAPTURE rejected runtime kit %s: %s" % [id, main.art.error])
			quit(4)
			return
	print("ART_V4_CAPTURE_KITS ", ids)
	main.start_art_review()
	main.sim.actors.clear()
	main.sim.next_uid = 0
	for side in range(2):
		for slot in range(6):
			var id = ids[slot]
			var ninja = main.reg.ninjas[id]
			main.sim.add_actor(id, side, 20, int(ninja.initial_quality), {}, slot, 1.0)
	main.battle_view()
	for _frame in range(90):
		await process_frame
	var draws: Dictionary = {}
	for id in ids:
		draws[id] = main.art.character_clip_draws(id)
	print("ART_V4_CAPTURE_READY ids=", ids, " authored_draws=", draws)
	await create_timer(18.0).timeout
	print("ART_V4_CAPTURE_FINISHED")
	quit(0)
