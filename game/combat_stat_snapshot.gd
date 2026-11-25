extends RefCounted
# Single pure combat-side stat preview API; no mutation of input progression or gear.
const Stats=preload("res://game/stats_service.gd")
static func snapshot(registry,n: Dictionary,level: int,quality: int,permanent: Dictionary,progress: Dictionary,gear_instances: Dictionary,natural_star: bool=true) -> Dictionary:
	var star_multiplier=1.0+0.04*(int(progress.get("stars",1))-1)
	var gear_stats={}
	var set_counts={}
	for gear_id in progress.get("gear",{}).values():
		if not gear_instances.has(gear_id):continue
		var item=gear_instances[gear_id]
		var def=registry.gear_templates[item.template_id]
		for affix in item.get("affixes",[]):gear_stats[affix.stat]=float(gear_stats.get(affix.stat,0))+float(affix.value)
		var set_id=str(item.get("set_id",""))
		if not set_id.is_empty():set_counts[set_id]=int(set_counts.get(set_id,0))+1
		var value=float(def.base_value)*(1+0.06*pow(float(item.enhance),0.85))*(1+0.025*pow(float(item.refine),0.8))*(1+0.1*pow(float(item.evolution),0.85))
		gear_stats[def.base_stat]=float(gear_stats.get(def.base_stat,0))+value
		for resource in item.gems:
			for gem in registry.gear_rules.socket.gems:
				if gem.resource_id==resource:gear_stats[gem.stat]=float(gear_stats.get(gem.stat,0))+float(gem.rating_add)
	var stat_progress=progress.duplicate(true)
	stat_progress.level=level
	stat_progress.quality=quality
	stat_progress.permanent=permanent
	var stat_ninja=n
	if natural_star:
		stat_ninja=n.duplicate(true)
		for key in stat_ninja.base_stats:
			stat_ninja.base_stats[key]=float(stat_ninja.base_stats[key])*star_multiplier
			stat_ninja.level_growth[key]=float(stat_ninja.level_growth[key])*star_multiplier
	var all_stats=Stats.derive(registry,stat_ninja,stat_progress,gear_stats)
	for rule in registry.gear_rules.sets:
		var best={}
		for threshold in rule.thresholds:
			if int(set_counts.get(rule.id,0))>=int(threshold.pieces):best=threshold
		if not best.is_empty():all_stats[best.stat]*=float(best.multiplier)
	var beast_level=int(progress.get("beast_level",0))
	if beast_level>0:
		for key in ["hp","patk","natk","chakra_max"]:all_stats[key]*=1.0+0.03*sqrt(float(beast_level))
	return {"stats":all_stats,"gear":gear_stats,"natural_star_multiplier":star_multiplier if natural_star else 1.0}
