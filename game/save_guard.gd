extends RefCounted
static func integer(value: Variant,lo: int=0,hi: int=9000000000000) -> bool:
	return (value is int or value is float) and is_finite(float(value)) and float(value)==floor(float(value)) and float(value)>=lo and float(value)<=hi

static func valid(reg,s: Variant) -> bool:
	if not s is Dictionary or not integer(s.get("schema_version"),1,1):return false
	for key in ["inventory","owned","cleared","ledger"]:
		if not s.get(key) is Dictionary:return false
	if not s.get("team") is Array or s.team.size()>6:return false
	if s.has("formation_id") and not reg.formations.has(s.formation_id):return false
	if not s.get("formation_slots",{}) is Dictionary or not s.get("formation_levels",{}) is Dictionary:return false
	var used_slots=[]
	for id in s.get("formation_slots",{}):
		var slot=s.formation_slots[id]
		if not id in s.team or not s.owned.has(id) or not integer(slot,0,8) or int(slot) in used_slots:return false
		used_slots.append(int(slot))
	for id in s.get("formation_levels",{}):
		if not reg.formations.has(id) or not integer(s.formation_levels[id],1,int(reg.combat_v3.upgrade.max_level)):return false
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
		if not p.get("bloodline_levels",{}) is Dictionary:return false
		var groups={}
		for bloodline in p.get("bloodline_levels",{}):
			if not reg.bloodlines.has(bloodline) or not integer(p.bloodline_levels[bloodline],1,5):return false
			var group=reg.bloodlines[bloodline].exclusive_group
			if groups.has(group):return false
			groups[group]=true
		if not p.get("skill_levels",{}) is Dictionary:return false
		for skill_id in p.get("skill_levels",{}):
			var progress=p.skill_levels[skill_id]
			if not reg.skills.has(skill_id) or reg.skills[skill_id].ninja_id!=id or not progress is Dictionary:return false
			if not integer(progress.get("level"),1,20) or not integer(progress.get("grade"),1) or not integer(progress.get("fails",0)):return false
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
	if not nested_valid(reg,s):return false
	for key in ["high_water_timestamp","last_committed_timestamp","simulation_seconds"]:
		if s.has(key) and not integer(s[key]):return false
	return true

static func nested_valid(reg,s: Dictionary) -> bool:
	for key in ["building_states","jobs","missions","territory_states","faction_states","relations","world_squads","beasts","summon_contracts","source_cooldowns","travel","daily_counts","quest_claimed","reward_inbox","lifetime_counts"]:
		if s.has(key) and not s[key] is Dictionary:return false
	for id in s.get("reward_inbox",{}):
		if not reg.resources.has(id) or not integer(s.reward_inbox[id]):return false
	for id in s.get("lifetime_counts",{}):
		if not integer(s.lifetime_counts[id]):return false
	for id in s.get("building_states",{}):
		var b=s.building_states[id]
		if not reg.buildings.has(id) or not b is Dictionary or not integer(b.get("level"),0,100):return false
		var condition=b.get("condition",1.0)
		if not (condition is int or condition is float) or condition<0 or condition>1:return false
		for key in ["upgrade","production"]:
			if not b.get(key,{}) is Dictionary:return false
			var job=b.get(key,{})
			if not job.is_empty():
				if not integer(job.get("remaining"),0):return false
				if key=="upgrade" and not integer(job.get("target"),1,100):return false
				if key=="production" and (not reg.recipes.has(job.get("recipe","")) or not job.get("reserved",{}) is Dictionary):return false
	for id in s.get("jobs",{}):
		var j=s.jobs[id]
		if not s.owned.has(id) or not j is Dictionary or not j.get("careers") is Dictionary:return false
		if j.get("building","")!="" and not reg.buildings.has(j.building):return false
		if not j.careers.has(j.get("profession","")):return false
		for profession in j.careers:
			var c=j.careers[profession]
			if not reg.professions.has(profession) or not c is Dictionary or not integer(c.get("level"),1) or not integer(c.get("xp")):return false
			if not c.get("talents",{}) is Dictionary:return false
			for talent in c.get("talents",{}):
				if not talent in ["yield","economy","quality","speed"] or not integer(c.talents[talent],0,5):return false
	for id in s.get("missions",{}):
		var m=s.missions[id]
		if not s.owned.has(id) or not m is Dictionary or not reg.resources.has(m.get("resource","")) or not integer(m.get("remaining")) or not integer(m.get("qty"),1):return false
	for id in s.get("territory_states",{}):
		var t=s.territory_states[id]
		if not reg.territories.has(id) or not t is Dictionary:return false
		if t.get("owner")!=null and not reg.factions.has(t.owner):return false
		if not integer(t.get("visits",0)):return false
	for id in s.get("faction_states",{}):
		var faction=s.faction_states[id]
		if not reg.factions.has(id) or not faction is Dictionary or not faction.get("stock") is Dictionary:return false
		for resource in faction.stock:
			if not reg.resources.has(resource) or not integer(faction.stock[resource]):return false
		for level in faction.get("infrastructure",{}).values():
			if not integer(level,1,100):return false
	var seen={}
	for id in s.team:seen[id]=true
	var defense=s.get("home_defense",[])
	if not defense is Array or defense.size()>6:return false
	for id in defense:
		if not s.owned.has(id) or seen.has(id):return false
		seen[id]=true
	if s.get("world_squads",{}).size()>maxi(2,s.owned.size()):return false
	for key in s.get("world_squads",{}):
		var q=s.world_squads[key]
		if not str(key).begins_with("SQUAD-") or not str(key).trim_prefix("SQUAD-").is_valid_int() or int(str(key).trim_prefix("SQUAD-"))<2 or not q is Dictionary or not q.get("team") is Array or q.team.size()>6 or not reg.territories.has(q.get("location","")) or not q.get("travel") is Dictionary:return false
		for id in q.team:
			if not s.owned.has(id) or seen.has(id):return false
			seen[id]=true
		if not q.travel.is_empty() and (not reg.territories.has(q.travel.get("destination","")) or not integer(q.travel.get("remaining"))):return false
	if not s.get("squad_formations",{}) is Dictionary:return false
	for key in s.get("squad_formations",{}):
		if key!="defense" and not s.get("world_squads",{}).has(key):return false
		var config=s.squad_formations[key]
		if not config is Dictionary or not reg.formations.has(config.get("formation_id","")) or not config.get("slots") is Dictionary:return false
		var roster=defense if key=="defense" else s.world_squads[key].team
		var taken=[]
		for id in config.slots:
			if not id in roster or not integer(config.slots[id],0,8) or int(config.slots[id]) in taken:return false
			taken.append(int(config.slots[id]))
	for id in s.get("beasts",{}):
		var b=s.beasts[id]
		if not reg.beasts.has(id) or not b is Dictionary or not integer(b.get("level"),1) or not integer(b.get("xp")):return false
		if b.get("host","")!="" and (not s.owned.has(b.host) or s.owned[b.host].get("beast_id","")!=id):return false
	return true
