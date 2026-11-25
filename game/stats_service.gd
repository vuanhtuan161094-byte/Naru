extends RefCounted
static func derive(reg,n: Dictionary,p: Dictionary,gear: Dictionary={}) -> Dictionary:
	var result={}
	var level=int(p.get("level",1))
	var quality=clampi(int(p.get("quality",n.initial_quality)),1,8)
	var q=[1.0,1.06,1.12,1.18,1.25,1.32,1.4,1.48][quality-1]
	for id in n.base_stats:
		result[id]=float(n.base_stats[id])+float(n.level_growth[id])*(level-1)*q+float(p.get("allocated",{}).get(id,0))+float(p.get("training",{}).get(id,0))+float(p.get("permanent",{}).get(id,0))+float(gear.get(id,0))
	for rule in reg.growth.talents:
		if rule.id==p.get("talent","") and result.has(rule.stat):
			result[rule.stat]=result[rule.stat]*float(rule.get("multiplier",1))+float(rule.get("rating_add",0))
	for id in reg.stat_rules:
		if result.has(id):continue
		var rule=reg.stat_rules[id]
		var value=float(rule.base)+float(rule.per_level)*level+float(p.get("specialization",{}).get(id,0))+float(p.get("permanent",{}).get(id,0))+float(gear.get(id,0))
		for stat in rule.weights:value+=float(rule.weights[stat])*float(result.get(stat,0))
		result[id]=maxf(0.0,value)
	var fixed=n.get("fixed_talent_effect",{})
	if result.has(fixed.get("stat","")):result[fixed.stat]*=1.0+float(fixed.get("additive_multiplier",0))
	for rule in reg.growth.talents:
		if rule.id==p.get("talent","") and not n.base_stats.has(rule.stat) and result.has(rule.stat):
			result[rule.stat]=result[rule.stat]*float(rule.get("multiplier",1))+float(rule.get("rating_add",0))
	return result

static func effect(reg,stats: Dictionary,id: String) -> float:
	var v=maxf(0.0,float(stats.get(id,0)))
	var cap=reg.stat_rules.get(id,{}).get("effect_cap_or_max_bonus")
	return v if cap==null else float(cap)*v/(100.0+v)
