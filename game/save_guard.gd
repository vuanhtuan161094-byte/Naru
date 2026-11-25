extends RefCounted
static func integer(value: Variant,lo: int=0,hi: int=9000000000000) -> bool:
	return (value is int or value is float) and is_finite(float(value)) and float(value)==floor(float(value)) and float(value)>=lo and float(value)<=hi

static func valid(reg,s: Variant) -> bool:
	if not s is Dictionary or not integer(s.get("schema_version"),1,1):return false
	for key in ["inventory","owned","cleared","ledger"]:
		if not s.get(key) is Dictionary:return false
	if not s.get("team") is Array or s.team.size()>6:return false
	for key in ["rng_seed","rng_state"]:
		if not str(s.get(key,"")).is_valid_int():return false
	for key in ["stamina","pity4","pity5","draws","battle_seq"]:
		if not integer(s.get(key)):return false
	if int(s.stamina)>120:return false
	for id in s.inventory:
		if not reg.resources.has(id) or not integer(s.inventory[id]):return false
	for id in s.owned:
		var p=s.owned[id]
		if not reg.ninjas.has(id) or not p is Dictionary:return false
		for key in ["level","realm","quality","stars","xp","shards"]:
			if not integer(p.get(key)):return false
		if int(p.level)<1 or int(p.quality)<1 or int(p.quality)>8 or int(p.stars)<1 or int(p.stars)>15:return false
		if not p.get("permanent") is Dictionary:return false
		for key in ["allocated","permanent","training","specialization"]:
			if not p.get(key,{}) is Dictionary:return false
			for value in p.get(key,{}).values():
				if not (value is int or value is float) or not is_finite(float(value)) or value<0:return false
		for key in ["forms","unlocked_skills"]:
			if not p.get(key,[]) is Array:return false
			for item in p.get(key,[]):
				var db=reg.forms if key=="forms" else reg.skills
				if not db.has(item) or db[item].ninja_id!=id:return false
		if not p.get("gear",{}) is Dictionary:return false
	var seen={}
	for id in s.team:
		if not s.owned.has(id) or seen.has(id):return false
		seen[id]=true
	for id in s.cleared:
		if not reg.stages.has(id):return false
	if not s.get("gear_instances",{}) is Dictionary:return false
	for id in s.get("gear_instances",{}):
		var item=s.gear_instances[id]
		if not item is Dictionary or not reg.gear_templates.has(item.get("template_id","")):return false
		for key in ["enhance","refine","evolution","fails","quality"]:
			if not integer(item.get(key)):return false
		if not item.get("gems") is Array:return false
		if item.get("owner","")!="" and not s.owned.has(item.owner):return false
	for id in s.owned:
		for gear_id in s.owned[id].get("gear",{}).values():
			if not s.get("gear_instances",{}).has(gear_id) or s.gear_instances[gear_id].owner!=id:return false
	for key in ["high_water_timestamp","last_committed_timestamp","simulation_seconds"]:
		if s.has(key) and not integer(s[key]):return false
	return true
