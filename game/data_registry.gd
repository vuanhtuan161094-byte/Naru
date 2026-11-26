extends RefCounted
const P2Adapter=preload("res://game/skill_p2_adapter.gd")
var ninjas: Dictionary = {}
var skills: Dictionary = {}
var names: Dictionary = {}
var stages: Dictionary = {}
var campaign_xp: Dictionary = {}
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
var passives: Dictionary={}
var passives_by_ninja: Dictionary={}
var passive_ledger: Dictionary={}
var passive_rules: Dictionary={}
var synergy_active: Dictionary={}
var synergy_passive: Dictionary={}
var synergy_links: Dictionary={}
var synergy_gaps: Dictionary={}
var passive_pilot: Dictionary={}
var depth_growth: Dictionary={}
var depth_exact_branches: Dictionary={}
var depth_branches: Dictionary={}
var depth_ultimates: Dictionary={}
var depth_teams: Array=[]
var passive_pilot_rows: Dictionary={}
var passive_pilot_ninjas: Dictionary={}
const Passive=preload("res://game/passive_service.gd")
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
	campaign_xp=indexed("res://data/campaign_xp_dev.json","stage_id")
	if campaign_xp.size()!=120:errors.append("Missing DEV campaign XP")
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
	load_passives()
	load_synergy_reference()
	load_depth_reference()
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

func load_passives() -> void:
	for i in range(1,13):
		var path="res://data/passive-p1/passives-%02d.json" % i
		for row in read_json(path):
			if passives.has(row.id) or not ninjas.has(row.ninja_id):errors.append("Invalid passive "+str(row.id));continue
			passives[row.id]=row
	var overlay=read_json("res://data/passive-p1/review-overlay.json")
	for patch in overlay.patches:
		if not passives.has(patch.id):errors.append("Invalid passive overlay");continue
		for key in patch.patch:passives[patch.id][key]=patch.patch[key]
	passive_rules=read_json("res://data/passive-p1/stacking-rules.json")
	var counts={}
	for row in passives.values():
		if not passives_by_ninja.has(row.ninja_id):passives_by_ninja[row.ninja_id]=[]
		passives_by_ninja[row.ninja_id].append(row)
		var state=Passive.gate(row)
		passive_ledger[row.id]=state
		counts[state]=int(counts.get(state,0))+1
	if passives.size()!=864 or passive_ledger.size()!=864 or passives_by_ninja.size()!=144:errors.append("Incomplete passive registry")
	for id in passives_by_ninja:
		if passives_by_ninja[id].size()!=6:errors.append("Invalid passive kit "+id)
	print("NARU_PASSIVE_REGISTRY ",passives.size()," ",counts)

func load_synergy_reference() -> void:
	# Structural candidate index only, never dispatch an event from its predictions.
	for i in range(1,4):
		var active=read_json("res://data/combat-synergy-p1/active-index-%02d.json" % i)
		var passive=read_json("res://data/combat-synergy-p1/passive-index-%02d.json" % i)
		for row in active.records:
			if not skills.has(row.id) or synergy_active.has(row.id):errors.append("Invalid synergy active "+str(row.id));continue
			synergy_active[row.id]=row
		for row in passive.records:
			if not passives.has(row.id) or synergy_passive.has(row.id):errors.append("Invalid synergy passive "+str(row.id));continue
			synergy_passive[row.id]=row
	var audit=read_json("res://data/combat-synergy-p1/interaction-audit.json")
	for kit in audit.kits:
		for row in kit.passives:
			synergy_links[row.id]=row
			for id in row.explicit_skill_ids+row.event_candidates:
				if not skills.has(id):errors.append("Invalid synergy reference "+str(id))
	for row in audit.gaps:synergy_gaps[row.id]=row.type
	var pilot=read_json("res://data/passive-p2/pilot-overlay.json")
	for row in pilot.patches:
		passive_pilot[row.id]=row
		if passives.has(row.id):passive_pilot_ninjas[passives[row.id].ninja_id]=true
	if synergy_active.size()!=1152 or synergy_passive.size()!=864 or synergy_links.size()!=864 or passive_pilot.size()!=72 or passive_pilot_ninjas.size()!=12:errors.append("Incomplete synergy reference")
	print("NARU_SYNERGY_REFERENCE ",synergy_active.size()+synergy_passive.size()," pilot=",passive_pilot.size()," gaps=",synergy_gaps.size()," STRUCTURAL_ONLY")

func load_depth_reference() -> void:
	for row in read_json("res://data/skill-depth-v3/branch-contracts.json").rows:depth_exact_branches[row.id]=row
	if depth_exact_branches.size()!=432:errors.append("Incomplete V3 branch contracts")
	for row in read_json("res://data/skill-depth-v4/growth-resolution.json"):depth_growth[row.id]=row
	for row in read_json("res://data/skill-depth-v4/branch-resolution.json"):depth_branches[row.id]=row
	for row in read_json("res://data/skill-depth-v5/manual-ultimate.json").skills:depth_ultimates[row.id]=row
	depth_teams=read_json("res://data/combat-synergy-p1/6v6-passive-pressure.json").teams
	# Four zero payload references: remove activation-only IDs, require real typed payload and exact form intersection.
	for key in ["NIN-053-P5","NIN-076-P5","NIN-130-P5","NIN-136-P5"]:
		var row=passives[key]
		var valid=[]
		for skill_id in row.trigger.skill_ids:
			if not p2_skills.has(skill_id):continue
			if not p2_skills[skill_id].effects.any(func(e):return e.type in ["damage","heal","shield"] and float(e.get("coefficient",0))>0):continue
			for form_id in row.trigger.form_ids:
				if p2_forms.has(form_id) and p2_forms[form_id].effect.empowered_skills.any(func(e):return e.skill_id==skill_id):
					valid.append(skill_id)
					break
		if not valid.is_empty():
			row.trigger.skill_ids=valid
			row.effect.skill_ids=valid
			synergy_gaps[key]="TYPED_INTERSECTION_DEV"
	# Pilot proposal is an explicit opt-in, not a replacement for P1.
	for id in passives:
		var row=passives[id].duplicate(true)
		if passive_pilot.has(id):
			for key in passive_pilot[id].patch:row[key]=passive_pilot[id].patch[key]
		if synergy_gaps.get(id,"")=="TYPED_INTERSECTION_DEV":
			row.trigger.skill_ids=passives[id].trigger.skill_ids.duplicate()
			row.effect.skill_ids=passives[id].effect.skill_ids.duplicate()
		if not passive_pilot_rows.has(row.ninja_id):passive_pilot_rows[row.ninja_id]=[]
		passive_pilot_rows[row.ninja_id].append(row)
	if depth_ultimates.size()!=146 or depth_teams.size()!=12 or depth_branches.size()!=34 or depth_growth.size()!=85:errors.append("Incomplete depth contracts")
	print("NARU_DEPTH_REFERENCE ",depth_growth.size()," ",depth_branches.size()," ",depth_ultimates.size()," teams=",depth_teams.size())
