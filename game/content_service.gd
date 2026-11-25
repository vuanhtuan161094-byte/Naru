extends RefCounted
static func ensure(s: Dictionary) -> void:
	for key in ["quest_claimed","daily_counts","beasts","summon_contracts","missions","source_cooldowns"]:
		if not s.has(key):s[key]={}
	if not s.has("quest_day"):s.quest_day=0

static func day(s: Dictionary) -> int:
	return floori(float(maxi(int(s.get("high_water_timestamp",0)),int(s.get("last_committed_timestamp",0)))+int(Time.get_time_zone_from_system().bias)*60)/86400.0)

static func sync_day(s: Dictionary) -> void:
	ensure(s)
	var now=day(s)
	if now>int(s.quest_day):
		s.quest_day=now
		s.daily_counts={}

static func bump(s: Dictionary,kind: String,amount: int=1) -> void:
	sync_day(s)
	s.daily_counts[kind]=int(s.daily_counts.get(kind,0))+amount
	if not s.has("lifetime_counts"):s.lifetime_counts={}
	s.lifetime_counts[kind]=int(s.lifetime_counts.get(kind,0))+amount

static func objective(reg,s: Dictionary,q: Dictionary) -> int:
	var obj=q.objective
	match str(obj.kind):
		"clear_chapter":
			for id in reg.chapters[obj.target].stage_ids:
				if not s.cleared.has(id):return 0
			return 1
		"visit_territory":
			return int(s.territory_states[obj.target].visits)
		_:return int(s.daily_counts.get(obj.kind,0)) if q.repeatable else int(s.get("lifetime_counts",{}).get(obj.kind,s.daily_counts.get(obj.kind,0)))

static func claim_key(s: Dictionary,q: Dictionary) -> String:
	return str(q.id)+":"+str(s.quest_day) if q.repeatable else str(q.id)

static func claim(reg,s: Dictionary,id: String) -> bool:
	sync_day(s)
	if not reg.quests.has(id):return false
	var q=reg.quests[id]
	var key=claim_key(s,q)
	if s.quest_claimed.has(key) or objective(reg,s,q)<int(q.objective.count):return false
	var reward={}
	for item in q.reward:reward[item.resource_id]=int(reward.get(item.resource_id,0))+int(item.qty)
	for resource in reward:
		if resource in ["RES-001","RES-002","RES-003","RES-004","RES-005"]:continue
		if int(s.inventory.get(resource,0))+int(reward[resource])>10000+5000*int(s.building_states["BLD-020"].level):return false
	for resource in reward:s.inventory[resource]=int(s.inventory.get(resource,0))+int(reward[resource])
	s.quest_claimed[key]=true
	return true

static func source_for(reg,resource: String) -> Dictionary:
	for source in reg.supply:
		if source.resource_id==resource:return source
	return {}

static func start_mission(reg,s: Dictionary,ninja: String,resource: String,repeat: bool=false) -> bool:
	var source=source_for(reg,resource)
	if source.is_empty() or not source.source_type in ["mission","mission_or_library"] or not s.owned.has(ninja) or s.missions.has(ninja):return false
	if int(s.building_states[source.building_id].level)<=0 or int(s.building_states["BLD-001"].level)<int(source.source_min_hq):return false
	s.missions[ninja]={"resource":resource,"remaining":int(source.period_seconds),"qty":int(source.base_yield),"period":int(source.period_seconds),"repeat":repeat}
	return true

static func step(s: Dictionary,dt: int) -> void:
	for ninja in s.missions.keys():
		var mission=s.missions[ninja]
		mission.remaining=maxi(0,int(mission.remaining)-dt)
		if int(mission.remaining)>0:continue
		var resource=str(mission.resource)
		if not resource in ["RES-001","RES-002","RES-003","RES-004","RES-005"] and int(s.inventory.get(resource,0))+int(mission.qty)>10000+5000*int(s.building_states["BLD-020"].level):continue
		s.inventory[resource]=int(s.inventory.get(resource,0))+int(mission.qty)
		if mission.get("repeat",false):mission.remaining=maxi(1,int(mission.period))
		else:s.missions.erase(ninja)
		bump(s,"finish_mission")
