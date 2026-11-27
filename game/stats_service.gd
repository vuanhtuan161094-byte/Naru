extends RefCounted
const ELEMENTAL_STATS={
	"fire":{"power":"fire_power","resist":"fire_resist"},
	"water":{"power":"water_power","resist":"water_resist"},
	"wind":{"power":"wind_power","resist":"wind_resist"},
	"lightning":{"power":"lightning_power","resist":"lightning_resist"},
	"earth":{"power":"earth_power","resist":"earth_resist"},
}

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
	for element in n.get("chakra_elements",[]):
		if not ELEMENTAL_STATS.has(str(element)):continue
		var elemental=ELEMENTAL_STATS[str(element)]
		result[elemental.power]=float(result.get(elemental.power,0))+25.0
		result[elemental.resist]=float(result.get(elemental.resist,0))+10.0
	for id in p.get("bloodline_levels",{}):
		if not reg.bloodlines.has(id):continue
		for stat in reg.bloodlines[id].progression.stats:
			if result.has(stat):result[stat]*=1+0.05*int(p.bloodline_levels[id])
	return result

static func effect(reg,stats: Dictionary,id: String) -> float:
	var v=maxf(0.0,float(stats.get(id,0)))
	var cap=reg.stat_rules.get(id,{}).get("effect_cap_or_max_bonus")
	return v if cap==null else float(cap)*v/(100.0+v)

static func breakdown(reg,n: Dictionary,p: Dictionary,gear: Dictionary,id: String) -> Dictionary:
	var level=int(p.get("level",1))
	var quality=clampi(int(p.get("quality",n.initial_quality)),1,8)
	var quality_multiplier=[1.0,1.06,1.12,1.18,1.25,1.32,1.4,1.48][quality-1]
	var all_stats=derive(reg,n,p,gear)
	var components=[]
	var modifiers=[]
	var add_component=func(title: String,value: float):
		if absf(value)>0.0001:components.append({"name":title,"value":value})
	if n.base_stats.has(id):
		add_component.call("Nền cá nhân",float(n.base_stats[id]))
		add_component.call("Tăng cấp × phẩm chất",float(n.level_growth.get(id,0.0))*float(level-1)*quality_multiplier)
		add_component.call("Điểm phân bổ",float(p.get("allocated",{}).get(id,0.0)))
		add_component.call("Tu luyện",float(p.get("training",{}).get(id,0.0)))
		add_component.call("Vĩnh viễn",float(p.get("permanent",{}).get(id,0.0)))
		add_component.call("Trang bị",float(gear.get(id,0.0)))
	else:
		var rule=reg.stat_rules.get(id,{})
		add_component.call("Công thức nền",float(rule.get("base",0.0)))
		add_component.call("Tăng theo cấp",float(rule.get("per_level",0.0))*float(level))
		for source_stat in rule.get("weights",{}):
			add_component.call("Từ "+str(reg.stat_catalog.get(source_stat,{}).get("name_vi",source_stat)),float(rule.weights[source_stat])*float(all_stats.get(source_stat,0.0)))
		add_component.call("Chuyên hóa",float(p.get("specialization",{}).get(id,0.0)))
		add_component.call("Vĩnh viễn",float(p.get("permanent",{}).get(id,0.0)))
		add_component.call("Trang bị",float(gear.get(id,0.0)))
	for talent in reg.growth.talents:
		if talent.id==p.get("talent","") and talent.stat==id:
			modifiers.append("Thiên phú "+str(talent.name)+": ×%.2f + %.1f" % [float(talent.get("multiplier",1.0)),float(talent.get("rating_add",0.0))])
	var fixed=n.get("fixed_talent_effect",{})
	if str(fixed.get("stat",""))==id:modifiers.append(str(n.get("fixed_talent","Thiên phú cố định"))+": ×%.2f" % (1.0+float(fixed.get("additive_multiplier",0.0))))
	for element in n.get("chakra_elements",[]):
		if ELEMENTAL_STATS.has(str(element)):
			if id==ELEMENTAL_STATS[str(element)].power:modifiers.append("Thiên hướng "+str(element)+" độn: +25 rating")
			if id==ELEMENTAL_STATS[str(element)].resist:modifiers.append("Thiên hướng "+str(element)+" độn: +10 rating")
	for bloodline_id in p.get("bloodline_levels",{}):
		if reg.bloodlines.has(bloodline_id) and id in reg.bloodlines[bloodline_id].progression.stats:
			modifiers.append("Huyết kế "+str(reg.bloodlines[bloodline_id].name_vi)+": ×%.2f" % (1.0+0.05*int(p.bloodline_levels[bloodline_id])))
	return {"components":components,"modifiers":modifiers,"final_value":float(all_stats.get(id,0.0))}

static func display_value(reg,id: String,value: float) -> String:
	var definition=reg.stat_rules.get(id,{})
	var unit=str(definition.get("unit","rating"))
	if unit=="rating" and definition.get("effect_cap_or_max_bonus")!=null:
		return "%.1f → %.1f%% hiệu quả" % [value,effect(reg,{id:value},id)*100.0]
	if unit=="per_second":return "%.2f/giây" % value
	if unit=="flat":return "%.1f" % value
	return "%.1f %s" % [value,unit]

static func tooltip(reg,id: String,value: float,source_breakdown: Dictionary={}) -> String:
	var stat=reg.stat_catalog.get(id,{})
	var formula=reg.stat_rules.get(id,{})
	var lines=[str(stat.get("name_vi",id)).capitalize()+": "+display_value(reg,id,value)]
	var effect=str(formula.get("tooltip_vi",stat.get("tooltip_vi","")))
	if effect!="":lines.append(effect)
	var sources=[]
	for item in source_breakdown.get("components",[]):sources.append(str(item.name)+" "+("+" if float(item.value)>=0 else "")+"%.1f" % float(item.value))
	if not sources.is_empty():lines.append("Nguồn hiện tại: "+"; ".join(sources))
	if not source_breakdown.get("modifiers",[]).is_empty():lines.append("Điều chỉnh: "+"; ".join(source_breakdown.modifiers))
	lines.append("Công thức: "+str(formula.get("formula","")))
	lines.append("Đối kháng: "+str(formula.get("opposition","không có")))
	return "\n".join(lines)
