extends RefCounted
const ELEMENTAL_STATS={
	"fire":{"power":"fire_power","resist":"fire_resist"},
	"water":{"power":"water_power","resist":"water_resist"},
	"wind":{"power":"wind_power","resist":"wind_resist"},
	"lightning":{"power":"lightning_power","resist":"lightning_resist"},
	"earth":{"power":"earth_power","resist":"earth_resist"},
}

static func derive(reg,n: Dictionary,p: Dictionary,gear: Dictionary={}) -> Dictionary:
	return _derive_with_trace(reg,n,p,gear).stats

static func _ensure_trace(trace: Dictionary,id: String) -> void:
	if not trace.has(id):trace[id]={"components":[],"modifiers":[],"steps":[]}

static func _add_component(trace: Dictionary,id: String,title: String,value: float,stage: String) -> void:
	_ensure_trace(trace,id)
	trace[id].components.append({"name":title,"value":value,"stage":stage})

static func _apply_multiplier(result: Dictionary,trace: Dictionary,id: String,title: String,multiplier: float,additive: float=0.0) -> void:
	var before=float(result.get(id,0.0))
	var after=before*multiplier+additive
	var delta=after-before
	result[id]=after
	_add_component(trace,id,title,delta,"modifier")
	trace[id].modifiers.append({"name":title,"multiplier":multiplier,"additive":additive,"before":before,"after":after,"delta":delta})
	trace[id].steps.append({"operation":"multiply_then_add","name":title,"input":before,"multiplier":multiplier,"additive":additive,"output":after})

static func _derive_with_trace(reg,n: Dictionary,p: Dictionary,gear: Dictionary={}) -> Dictionary:
	var result={}
	var trace={}
	var level=int(p.get("level",1))
	var quality=clampi(int(p.get("quality",n.initial_quality)),1,8)
	var q=[1.0,1.06,1.12,1.18,1.25,1.32,1.4,1.48][quality-1]
	for id in n.base_stats:
		var base=float(n.base_stats[id])
		var growth=float(n.level_growth[id])*float(level-1)*q
		var allocated=float(p.get("allocated",{}).get(id,0))
		var training=float(p.get("training",{}).get(id,0))
		var permanent=float(p.get("permanent",{}).get(id,0))
		var equipment=float(gear.get(id,0))
		result[id]=base+growth+allocated+training+permanent+equipment
		_add_component(trace,id,"Nền cá nhân",base,"profile")
		_add_component(trace,id,"Tăng cấp × phẩm chất",growth,"growth")
		_add_component(trace,id,"Điểm phân bổ",allocated,"allocation")
		_add_component(trace,id,"Tu luyện",training,"training")
		_add_component(trace,id,"Vĩnh viễn",permanent,"permanent")
		_add_component(trace,id,"Trang bị",equipment,"gear")
		trace[id].steps.append({"operation":"additive_base","output":result[id]})
	for rule in reg.growth.talents:
		if rule.id==p.get("talent","") and result.has(rule.stat):
			_apply_multiplier(result,trace,str(rule.stat),"Thiên phú "+str(rule.name),float(rule.get("multiplier",1)),float(rule.get("rating_add",0)))
	for id in reg.stat_rules:
		if result.has(id):continue
		var rule=reg.stat_rules[id]
		var value=float(rule.base)
		_add_component(trace,id,"Công thức nền",float(rule.base),"formula")
		var per_level=float(rule.per_level)*float(level)
		value+=per_level
		_add_component(trace,id,"Tăng theo cấp",per_level,"growth")
		for stat in rule.weights:
			var source_value=float(result.get(stat,0.0))
			var weighted=float(rule.weights[stat])*source_value
			value+=weighted
			_add_component(trace,id,"Từ "+str(reg.stat_catalog.get(stat,{}).get("name_vi",stat)),weighted,"dependency")
		var specialization=float(p.get("specialization",{}).get(id,0.0))
		var permanent=float(p.get("permanent",{}).get(id,0.0))
		var equipment=float(gear.get(id,0.0))
		value+=specialization+permanent+equipment
		_add_component(trace,id,"Chuyên hóa",specialization,"specialization")
		_add_component(trace,id,"Vĩnh viễn",permanent,"permanent")
		_add_component(trace,id,"Trang bị",equipment,"gear")
		var clamped=maxf(0.0,value)
		if not is_equal_approx(clamped,value):_add_component(trace,id,"Giới hạn tối thiểu 0",clamped-value,"clamp")
		result[id]=clamped
		trace[id].steps.append({"operation":"weighted_sum_then_minimum","unclamped":value,"minimum":0.0,"output":clamped})
	var fixed=n.get("fixed_talent_effect",{})
	if result.has(fixed.get("stat","")):
		_apply_multiplier(result,trace,str(fixed.stat),str(n.get("fixed_talent","Thiên phú cố định")),1.0+float(fixed.get("additive_multiplier",0)))
	for rule in reg.growth.talents:
		if rule.id==p.get("talent","") and not n.base_stats.has(rule.stat) and result.has(rule.stat):
			_apply_multiplier(result,trace,str(rule.stat),"Thiên phú "+str(rule.name),float(rule.get("multiplier",1)),float(rule.get("rating_add",0)))
	for element in n.get("chakra_elements",[]):
		if not ELEMENTAL_STATS.has(str(element)):continue
		var elemental=ELEMENTAL_STATS[str(element)]
		for pair in [[str(elemental.power),25.0],[str(elemental.resist),10.0]]:
			var id=str(pair[0])
			var bonus=float(pair[1])
			result[id]=float(result.get(id,0.0))+bonus
			_add_component(trace,id,"Thiên hướng "+str(element)+" độn",bonus,"nature")
			trace[id].steps.append({"operation":"nature_addition","input":float(result[id])-bonus,"additive":bonus,"output":result[id]})
	for id in p.get("bloodline_levels",{}):
		if not reg.bloodlines.has(id):continue
		for stat in reg.bloodlines[id].progression.stats:
			if result.has(stat):_apply_multiplier(result,trace,str(stat),"Huyết kế "+str(reg.bloodlines[id].name_vi),1.0+0.05*int(p.bloodline_levels[id]))
	for id in trace:
		var sum=0.0
		for component in trace[id].components:sum+=float(component.value)
		trace[id].reconstructed_value=sum
		trace[id].reconciliation_delta=float(result.get(id,0.0))-sum
	return {"stats":result,"trace":trace,"level":level,"quality":quality,"quality_multiplier":q}

static func effect(reg,stats: Dictionary,id: String) -> float:
	var v=maxf(0.0,float(stats.get(id,0)))
	var cap=reg.stat_rules.get(id,{}).get("effect_cap_or_max_bonus")
	return v if cap==null else float(cap)*v/(100.0+v)

static func breakdown(reg,n: Dictionary,p: Dictionary,gear: Dictionary,id: String) -> Dictionary:
	var derived=_derive_with_trace(reg,n,p,gear)
	var row=derived.trace.get(id,{"components":[],"modifiers":[],"steps":[],"reconstructed_value":0.0,"reconciliation_delta":0.0})
	var modifiers=[]
	for modifier in row.modifiers:
		modifiers.append(str(modifier.name)+": ×%.3f + %.3f (Δ %+.3f)" % [float(modifier.multiplier),float(modifier.additive),float(modifier.delta)])
	var raw=float(derived.stats.get(id,0.0))
	var cap=reg.stat_rules.get(id,{}).get("effect_cap_or_max_bonus")
	return {"components":row.components.duplicate(true),"modifiers":modifiers,"modifier_steps":row.modifiers.duplicate(true),"calculation_steps":row.steps.duplicate(true),"final_value":raw,"raw_rating":raw,"effective_value":effect(reg,derived.stats,id),"effect_cap":cap,"unit":str(reg.stat_rules.get(id,{}).get("unit","points")),"reconstructed_value":float(row.reconstructed_value),"reconciliation_delta":float(row.reconciliation_delta)}

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
	if source_breakdown.has("raw_rating") and source_breakdown.has("effective_value") and source_breakdown.effect_cap!=null:
		lines.append("Rating thô %.1f → hiệu quả %.1f%% (trần %.1f%%)" % [float(source_breakdown.raw_rating),float(source_breakdown.effective_value)*100.0,float(source_breakdown.effect_cap)*100.0])
	lines.append("Công thức: "+str(formula.get("formula","")))
	lines.append("Đối kháng: "+str(formula.get("opposition","không có")))
	return "\n".join(lines)
