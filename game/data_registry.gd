extends RefCounted
var ninjas: Dictionary = {}
var skills: Dictionary = {}
var names: Dictionary = {}
var stages: Dictionary = {}
var npcs: Dictionary = {}
var recruit: Dictionary = {}
var initial: Dictionary = {}
var errors: Array[String] = []

func read_json(path: String) -> Variant:
	if not FileAccess.file_exists(path):
		errors.append("Missing "+path)
		return null
	var parser = JSON.new()
	if parser.parse(FileAccess.get_file_as_string(path)) != OK:
		errors.append(path+": "+parser.get_error_message())
		return null
	return parser.data

func indexed(path: String, key: String = "id") -> Dictionary:
	var result: Dictionary = {}
	var rows = read_json(path)
	if not rows is Array:
		errors.append("Expected array "+path)
		return result
	for row in rows:
		if not row is Dictionary or not row.has(key):
			errors.append("Invalid record "+path)
			continue
		var id = str(row[key])
		if result.has(id):
			errors.append("Duplicate "+id)
		result[id] = row
	return result

func load_all() -> bool:
	ninjas = indexed("res://data/ninjas.json")
	skills = indexed("res://data/d4/skill_contracts.json","skill_id")
	names = indexed("res://data/skills.json")
	names.merge(indexed("res://data/additional_skills.json"))
	stages = indexed("res://data/campaign_stages.json")
	npcs = indexed("res://data/encounter_npcs.json")
	var r = read_json("res://data/d4/recruitment.json")
	var s = read_json("res://data/d4/initial_save_seed.json")
	if r is Dictionary: recruit = r
	if s is Dictionary: initial = s
	if ninjas.size()!=144 or skills.size()!=1152 or stages.size()!=120:
		errors.append("Expected 144/1152/120")
	for row in ninjas.values():
		for id in row.skills+row.additional_skill_ids:
			if not skills.has(id) or not names.has(id):
				errors.append("Missing skill "+str(id))
	for stage in stages.values():
		for id in stage.enemy_ids:
			if not npcs.has(id): errors.append("Missing NPC "+str(id))
	for npc in npcs.values():
		if not ninjas.has(npc.template_ninja_id):
			errors.append("Missing template "+str(npc.template_ninja_id))
	return errors.is_empty()
