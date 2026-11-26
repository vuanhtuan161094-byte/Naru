extends RefCounted
# External caller adapter; no combat engine logic.
static func configure(sim,reg,s: Dictionary,seed_value: int) -> void:
	sim.registry=reg
	sim.auto_player_ultimate=true
	sim.rng.seed=seed_value
	var settings=s.get("settings",{})
	var desired={"use_passives":bool(settings.get("passives_dev",false)),"use_passive_pilot":bool(settings.get("passives_dev",false)) and bool(settings.get("passive_pilot_dev",false)),"use_depth":bool(settings.get("depth_v5_dev",true)),"use_tactical":bool(settings.get("tactical_v4_dev",true)),"use_contract_v10":bool(settings.get("contract_v10_dev",true))}
	for property in sim.get_property_list():
		var key=str(property.name)
		if desired.has(key):sim.set(key,desired[key])
	if sim.has_method("load_combat_contracts"):sim.call("load_combat_contracts")

static func progress(s: Dictionary,id: String) -> Dictionary:
	var p=s.owned[id].duplicate(true)
	p.beast_level=int(s.get("beasts",{}).get(p.get("beast_id",""),{}).get("level",0))
	p.contract_level=int(s.get("summon_contracts",{}).get(p.get("summon_contract",""),{}).get("level",0))
	return p
