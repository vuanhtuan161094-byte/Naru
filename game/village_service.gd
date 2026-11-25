extends RefCounted
const World=preload("res://game/world_service.gd")
static func ensure(reg,s: Dictionary) -> void:
	if not s.has("building_states"):
		s.building_states={}
		for b in reg.initial.initial_buildings:s.building_states[b.building_id]=b.duplicate(true)
	for id in reg.buildings:
		if not s.building_states.has(id):s.building_states[id]={"building_id":id,"level":0,"condition":1.0}
	for id in s.building_states:
		var b=s.building_states[id]
		if not b.has("condition"):b.condition=1.0
		if not b.has("upgrade"):b.upgrade={}
		if not b.has("production"):b.production={}
	if not s.has("jobs"):s.jobs={}
	if not s.has("supply_clock"):s.supply_clock={}
	if not s.has("last_committed_timestamp"):s.last_committed_timestamp=int(Time.get_unix_time_from_system())
	if not s.has("high_water_timestamp"):s.high_water_timestamp=s.last_committed_timestamp
	if not s.has("stamina_seconds"):s.stamina_seconds=0
	if not s.has("simulation_seconds"):s.simulation_seconds=0
	if not s.has("production_count"):s.production_count=0
	if not s.has("craft_count"):s.craft_count=0
	World.ensure(reg,s)

static func level(s: Dictionary,id: String) -> int:
	return int(s.building_states.get(id,{}).get("level",0))

static func cost_ok(s: Dictionary,cost: Dictionary) -> bool:
	for id in cost:
		if int(s.inventory.get(id,0))<int(cost[id]):return false
	return true

static func debit(s: Dictionary,cost: Dictionary) -> void:
	for id in cost:s.inventory[id]=int(s.inventory.get(id,0))-int(cost[id])

static func capacity(s: Dictionary,id: String) -> int:
	if id in ["RES-001","RES-002","RES-003","RES-004","RES-005"]:return 9000000000000
	return 10000+5000*level(s,"BLD-020")

static func put(s: Dictionary,id: String,qty: int) -> bool:
	if int(s.inventory.get(id,0))+qty>capacity(s,id):return false
	s.inventory[id]=int(s.inventory.get(id,0))+qty
	return true

static func upgrade_cost(reg,s: Dictionary,id: String) -> Dictionary:
	var def=reg.buildings[id]
	var factor=pow(1.13,maxi(0,level(s,id)-1))
	return {"RES-001":ceili(float(def.base_upgrade_ryo)*factor),"RES-006":ceili(float(def.base_upgrade_wood)*factor),"RES-009":ceili(float(def.base_upgrade_stone)*factor)}

static func construct(reg,s: Dictionary,id: String) -> bool:
	if not reg.buildings.has(id):return false
	var b=s.building_states[id]
	var def=reg.buildings[id]
	if int(b.level)>=100 or not b.upgrade.is_empty():return false
	if level(s,"BLD-001")<int(def.unlock_hq) and int(b.level)==0:return false
	var cost=upgrade_cost(reg,s,id)
	if not cost_ok(s,cost):return false
	debit(s,cost)
	b.upgrade={"target":int(b.level)+1,"remaining":mini(604800,ceili(float(def.base_duration_s)*pow(1.10,maxi(0,int(b.level)-1))))}
	return true

static func workers(s: Dictionary,id: String) -> Array:
	var found=[]
	for ninja in s.jobs:
		if s.jobs[ninja].building==id:found.append(ninja)
	return found

static func assign(reg,s: Dictionary,ninja: String,id: String,profession: String) -> bool:
	if not s.owned.has(ninja):return false
	if id=="":
		if s.jobs.has(ninja):s.jobs[ninja].building=""
		return true
	if not reg.buildings.has(id) or level(s,id)<=0 or not reg.professions.has(profession):return false
	var assigned=workers(s,id)
	if not ninja in assigned and assigned.size()>=1+floori(float(level(s,id)-1)/10.0):return false
	var job=s.jobs.get(ninja,{"building":"","profession":profession,"careers":{}})
	if not job.careers.has(profession):job.careers[profession]={"level":1,"xp":0}
	job.building=id
	job.profession=profession
	s.jobs[ninja]=job
	return true

static func worker_level(s: Dictionary,id: String) -> int:
	var highest=0
	for ninja in workers(s,id):
		var job=s.jobs[ninja]
		highest=maxi(highest,int(job.careers[job.profession].level))
	return highest

static func award_job(s: Dictionary,id: String,amount: int) -> void:
	for ninja in workers(s,id):
		var job=s.jobs[ninja]
		var career=job.careers[job.profession]
		career.xp=int(career.xp)+amount
		while int(career.xp)>=ceili(50*pow(float(career.level),1.4)):
			career.xp=int(career.xp)-ceili(50*pow(float(career.level),1.4))
			career.level=int(career.level)+1

static func recipe_cost(recipe: Dictionary) -> Dictionary:
	var result={}
	for r in recipe.inputs:result[r.resource_id]=int(result.get(r.resource_id,0))+int(r.qty)
	return result

static func reserve(s: Dictionary,job: Dictionary,recipe: Dictionary) -> bool:
	var cost=recipe_cost(recipe)
	if not cost_ok(s,cost):return false
	debit(s,cost)
	job.reserved=cost
	job.remaining=int(recipe.duration_s)
	return true

static func queue_recipe(reg,s: Dictionary,id: String,recipe_id: String,repeat: bool) -> bool:
	if not reg.recipes.has(recipe_id) or not reg.buildings.has(id):return false
	var recipe=reg.recipes[recipe_id]
	var b=s.building_states[id]
	if recipe.building_id!=id or int(b.level)<int(recipe.min_building_level) or not b.production.is_empty() or worker_level(s,id)==0:return false
	var job={"recipe":recipe_id,"repeat":repeat,"reserved":{},"remaining":0}
	if not reserve(s,job,recipe) and not repeat:return false
	b.production=job
	return true

static func cancel(s: Dictionary,id: String) -> bool:
	if not s.building_states.has(id) or s.building_states[id].production.is_empty():return false
	var job=s.building_states[id].production
	for resource in job.reserved:
		if int(s.inventory.get(resource,0))+int(job.reserved[resource])>capacity(s,resource):return false
	for resource in job.reserved:put(s,resource,int(job.reserved[resource]))
	s.building_states[id].production={}
	return true

static func step(reg,s: Dictionary,dt: int) -> void:
	for id in s.building_states:
		var b=s.building_states[id]
		if not b.upgrade.is_empty():
			b.upgrade.remaining=int(b.upgrade.remaining)-dt
			if int(b.upgrade.remaining)<=0:
				b.level=int(b.upgrade.target)
				b.upgrade={}
		if b.production.is_empty() or worker_level(s,id)==0:continue
		var job=b.production
		var recipe=reg.recipes[job.recipe]
		if job.reserved.is_empty() and not reserve(s,job,recipe):continue
		job.remaining=maxi(0,int(job.remaining)-dt)
		if int(job.remaining)>0:continue
		var qty=maxi(1,floori(float(recipe.output.qty)*(1+0.07*(int(b.level)-1))*(1+0.025*worker_level(s,id))*float(b.condition)))
		if not put(s,recipe.output.resource_id,qty):continue
		award_job(s,id,qty)
		s.craft_count=int(s.craft_count)+1
		job.reserved={}
		if not job.repeat:b.production={}
	# Direct supply only for genuine producing sources, never event-only rewards.
	for source in reg.supply:
		var id=str(source.building_id)
		var kind=str(source.source_type)
		if not kind in ["farm","herb_garden","chakra_spring","territory"]:continue
		if level(s,id)<=0 or level(s,"BLD-001")<int(source.source_min_hq) or worker_level(s,id)==0:continue
		if kind=="territory":
			var owned_source=false
			for territory in reg.territories.values():
				var owner=s.get("territory_states",{}).get(territory.id,{}).get("owner",territory.owner_id)
				if owner!="FAC-009":continue
				for resource in territory.resources:
					if resource.resource_id==source.resource_id:owned_source=true
			if not owned_source:continue
		var resource_id=str(source.resource_id)
		var elapsed=int(s.supply_clock.get(resource_id,0))+dt
		var period=int(source.period_seconds)
		if elapsed>=period:
			var b=s.building_states[id]
			var qty=maxi(1,floori(float(source.base_yield)*(1+0.07*(int(b.level)-1))*(1+0.025*worker_level(s,id))*float(b.condition)))
			if put(s,resource_id,qty):
				award_job(s,id,qty)
				s.production_count=int(s.production_count)+1
				elapsed-=period
			else:elapsed=period
		s.supply_clock[resource_id]=elapsed
	if int(s.stamina)>=120:s.stamina_seconds=0
	else:
		s.stamina_seconds=int(s.stamina_seconds)+dt
		var amount=floori(float(s.stamina_seconds)/360.0)
		s.stamina=mini(120,int(s.stamina)+amount)
		s.stamina_seconds=int(s.stamina_seconds)%360 if int(s.stamina)<120 else 0
	s.simulation_seconds=int(s.simulation_seconds)+dt
	World.step(reg,s,dt)

static func advance(reg,s: Dictionary,now: int) -> bool:
	ensure(reg,s)
	var previous=maxi(int(s.last_committed_timestamp),int(s.high_water_timestamp))
	if now<=previous:return false
	var elapsed=mini(86400,now-previous)
	var remaining=elapsed
	while remaining>0:
		var dt=mini(60,remaining)
		step(reg,s,dt)
		remaining-=dt
	s.last_committed_timestamp=now
	s.high_water_timestamp=now
	s.last_offline_elapsed=elapsed
	return true
