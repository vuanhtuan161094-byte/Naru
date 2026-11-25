extends RefCounted
const P2Adapter=preload("res://game/skill_p2_adapter.gd")
var ninjas: Dictionary = {}
var skills: Dictionary = {}
var names: Dictionary = {}
var stages: Dictionary = {}
var npcs: Dictionary = {}
var recruit: Dictionary = {}
var initial: Dictionary = {}
var growth: Dictionary = {}
var buildings: Dictionary = {}
var recipes: Dictionary = {}
var resources: Dictionary = {}
var professions: Dictionary = {}
var territories: Dictionary = {}
var factions: Dictionary = {}
var chapters: Dictionary = {}
var bosses: Dictionary = {}
var boss_rules: Dictionary = {}
var quests: Dictionary = {}
var beasts: Dictionary = {}
var beast_combat: Dictionary = {}
var contracts: Dictionary = {}
var combos: Dictionary = {}
var bloodlines: Dictionary = {}
var routes: Array = []
var relation_defs: Array = []
var supply: Array = []
var stat_rules: Dictionary = {}
var trials: Dictionary = {}
var forms: Dictionary = {}
var form_rules: Dictionary = {}
var status_catalog: Dictionary = {}
var reactions: Array = []
var affinity: Dictionary = {}
var gear_templates: Dictionary = {}
var gear_rules: Dictionary = {}
var affix_pools: Dictionary = {}
var environments: Dictionary = {}
var skill_policies: Dictionary = {}
var combat_v3: Dictionary = {}
var p2_skills: Dictionary={}
var p2_fallback: Dictionary={}
var p2_design: Dictionary={}
var p2_forms: Dictionary={}
var p2_combos: Dictionary={}
var tactics: Dictionary = {}
var formations: Dictionary = {}
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
	var tactical=read_json("res://data/combat_v3_tactics.json")
	if tactical is Dictionary:tactics=tactical
	else:errors.append("Missing tactical rules")
	var v3=read_json("res://data/combat_v3.json")
	if v3 is Dictionary:
		combat_v3=v3
		for rule in v3.get("formations",[]):formations[rule.id]=rule
	if formations.size()!=8 or int(combat_v3.get("version",0))!=3:errors.append("Missing Combat V3 rules")
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
	var g = read_json("res://data/d4/ninja_growth.json")
	if g is Dictionary: growth = g
	if growth.get("stars",[]).size()!=14: errors.append("Missing star rules")
	buildings=indexed("res://data/buildings.json")
	recipes=indexed("res://data/recipes.json")
	resources=indexed("res://data/resources.json")
	professions=indexed("res://data/professions.json")
	territories=indexed("res://data/territories.json")
	factions=indexed("res://data/faction_profiles.json")
	chapters=indexed("res://data/campaign_chapters.json")
	bosses=indexed("res://data/bosses.json")
	boss_rules=indexed("res://data/d4/boss_contracts.json","boss_id")
	quests=indexed("res://data/quests.json")
	beasts=indexed("res://data/bijuu.json")
	beast_combat=indexed("res://data/d4/dev_beast_combat.json")
	if beast_combat.size()!=9:errors.append("Missing DEV beast combat")
	contracts=indexed("res://data/summons.json")
	combos=indexed("res://data/combo_skills.json")
	var bloodline_data=read_json("res://data/d4/bloodline_rules.json")
	if bloodline_data is Dictionary:
		for item in bloodline_data.bloodline:bloodlines[item.id]=item
	if chapters.size()!=24 or bosses.size()!=24 or boss_rules.size()!=24 or quests.size()!=81 or beasts.size()!=9 or contracts.size()!=11 or combos.size()!=12:errors.append("Missing campaign content")
	var route_data=read_json("res://data/world_routes.json")
	if route_data is Array:routes=route_data
	var relation_data=read_json("res://data/diplomatic_relations.json")
	if relation_data is Array:relation_defs=relation_data
	if factions.size()!=9 or routes.size()!=71 or relation_defs.size()!=36:errors.append("Missing world content")
	var supplies=read_json("res://data/d4/direct_supply.json")
	if supplies is Array:supply=supplies
	if buildings.size()!=30 or recipes.size()!=63 or resources.size()!=150 or professions.size()!=15 or territories.size()!=60:errors.append("Missing village content")
	stat_rules=indexed("res://data/stat_formulas.json","stat_id")
	trials=indexed("res://data/personal_trials.json")
	forms=indexed("res://data/ninja_forms.json")
	form_rules=indexed("res://data/d4/form_contracts.json","form_id")
	if stat_rules.size()!=48 or trials.size()!=288 or form_rules.size()!=54: errors.append("Missing growth definitions")
	status_catalog=indexed("res://data/d4/status_catalog.json")
	var reaction_data=read_json("res://data/d4/reactions.json")
	if reaction_data is Array: reactions=reaction_data
	var affinity_data=read_json("res://data/d4/element_affinity.json")
	if affinity_data is Array:
		for item in affinity_data: affinity[str(item.attack)+":"+str(item.defense)]=float(item.multiplier)
	if status_catalog.size()!=25 or reactions.size()!=7: errors.append("Missing combat rules")
	gear_templates=indexed("res://data/equipment_templates.json")
	skill_policies=indexed("res://data/skill_progression_policies.json","skill_id")
	var gear_data=read_json("res://data/d4/equipment_rules.json")
	if gear_data is Dictionary: gear_rules=gear_data
	var pool_data=read_json("res://data/equipment_affix_pools.json")
	if pool_data is Dictionary:affix_pools=pool_data
	environments=indexed("res://data/d4/environment.json")
	if gear_templates.size()!=128 or skill_policies.size()!=1008: errors.append("Missing progression data")
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
	load_p2()
	return errors.is_empty()

func load_p2() -> void:
	for letter in ["A","B","C","D","E","F","G","H","I"]:
		var records=read_json("res://data/skill-p2/SKILL-P2-"+letter+".json")
		if records is Dictionary:records=records.get("skills",[])
		if not records is Array:errors.append("Missing P2 "+letter);continue
		for raw in records:
			var id=str(raw.skill_id)
			if not skills.has(id) or p2_design.has(id):errors.append("Invalid P2 ID "+id);continue
			p2_design[id]=raw
			var compiled=P2Adapter.compile(raw,skills[id])
			if compiled.has("skill"):p2_skills[id]=compiled.skill
			else:p2_fallback[id]=compiled.reason
	p2_forms=indexed("res://data/skill-p2/forms.json","form_id")
	p2_combos=indexed("res://data/skill-p2/combos.json")
	if p2_design.size()!=1152 or p2_forms.size()!=54 or p2_combos.size()!=12:errors.append("Incomplete P2 overlay")
	# Preserve D4 status definitions; append explicitly authored extensions.
	for row in read_json("res://data/skill-p2/status_extensions.json"):
		status_catalog[row.id]={"id":row.id,"duration_s":row.duration_s,"stack":row.stack,"dispellable":row.dispellable,"hard_control":row.id=="sleep","max_stacks":1}
	print("NARU_P2_REGISTRY ",p2_skills.size(),"/1152 fallback=",p2_fallback.size())
