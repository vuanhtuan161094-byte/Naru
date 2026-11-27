extends RefCounted
const Content=preload("res://game/content_service.gd")
const Projects=preload("res://game/world_economy_projects.gd")
const Rewards=preload("res://game/world_rewards.gd")
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
	Content.ensure(s)

static func level(s: Dictionary,id: String) -> int:
	return int(s.building_states.get(id,{}).get("level",0))

static func cost_ok(s: Dictionary,cost: Dictionary) -> bool:
	for id in cost:
		if int(s.inventory.get(id,0))<int(cost[id]):return false
	return true

static func debit(s: Dictionary,cost: Dictionary) -> void:
	for id in cost:s.inventory[id]=int(s.inventory.get(id,0))-int(cost[id])

static func capacity(s: Dictionary,id: String) -> int:
	return Rewards.capacity(s,id)

static func put(s: Dictionary,id: String,qty: int) -> bool:
	if int(s.inventory.get(id,0))+qty>capacity(s,id):return false
	s.inventory[id]=int(s.inventory.get(id,0))+qty
	return true

static func upgrade_cost(reg,s: Dictionary,id: String) -> Dictionary:
	var def=reg.buildings[id]
	var factor=pow(1.13,maxi(0,level(s,id)-1))
	return {"RES-001":ceili(float(def.base_upgrade_ryo)*factor),"RES-006":ceili(float(def.base_upgrade_wood)*factor),"RES-009":ceili(float(def.base_upgrade_stone)*factor)}

static func construction_quote(reg,s:Dictionary,id:String) -> Dictionary:
	if not reg.buildings.has(id):return {"ready":false,"reason":"Công trình không hợp lệ","cost":{}}
	var b=s.building_states[id]
	var def=reg.buildings[id]
	var cost=upgrade_cost(reg,s,id)
	var reason=""
	if int(b.level)>=100:reason="Đã đạt cấp tối đa"
	elif not b.upgrade.is_empty():reason="Đang xây hoặc nâng cấp"
	elif level(s,"BLD-001")<int(def.unlock_hq) and int(b.level)==0:reason="Cần Tổng bộ cấp "+str(def.unlock_hq)
	elif not cost_ok(s,cost):reason="Thiếu tài nguyên xây dựng"
	return {"ready":reason.is_empty(),"reason":"Đủ điều kiện xây dựng" if reason.is_empty() else reason,"cost":cost}

static func construct(reg,s: Dictionary,id: String) -> bool:
	var quote=construction_quote(reg,s,id)
	if not quote.ready:return false
	var b=s.building_states[id]
	var def=reg.buildings[id]
	var cost=quote.cost
	debit(s,cost)
	var builder=trait_bonus(s,"BLD-001","speed")+Projects.bonus(s,"build_speed")
	b.upgrade={"target":int(b.level)+1,"remaining":mini(604800,ceili(float(def.base_duration_s)*pow(1.10,maxi(0,int(b.level)-1))/(1+builder)))}
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
	if not job.careers.has(profession):job.careers[profession]={"level":1,"xp":0,"talents":{}}
	if not job.careers[profession].has("talents"):job.careers[profession].talents={}
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

static func effective_recipe_cost(s: Dictionary,recipe: Dictionary) -> Dictionary:
	var cost=recipe_cost(recipe)
	var savings=minf(0.45,trait_bonus(s,str(recipe.building_id),"economy")+Projects.bonus(s,"economy"))
	for resource in cost:cost[resource]=maxi(1,ceili(float(cost[resource])*(1-savings)))
	return cost

static func recipe_quote(s: Dictionary,recipe: Dictionary) -> Dictionary:
	var id=str(recipe.building_id)
	var b=s.building_states[id]
	var cost=effective_recipe_cost(s,recipe)
	var missing={}
	var affordable=20
	for key in cost:
		var stock=int(s.inventory.get(key,0))
		affordable=mini(affordable,floori(float(stock)/int(cost[key])))
		if stock<int(cost[key]):missing[key]=int(cost[key])-stock
	var idle=b.production.is_empty()
	var can_replace=not idle and b.production.reserved.is_empty() and int(b.production.remaining)==0
	var staffed=worker_level(s,id)>0
	var setup_ready=(idle or can_replace) and staffed and int(b.level)>=int(recipe.min_building_level)
	var reason="Xưởng đang bận" if not (idle or can_replace) else "Chưa có nhân lực" if not staffed else "Cần xưởng cấp "+str(recipe.min_building_level) if int(b.level)<int(recipe.min_building_level) else "Thiếu nguyên liệu" if affordable<=0 else "Sẵn sàng"
	return {"cost":cost,"missing":missing,"affordable":affordable,"idle":idle,"can_replace":can_replace,"staffed":staffed,"level":int(b.level),"required_level":int(recipe.min_building_level),"ready":setup_ready and affordable>0,"setup_ready":setup_ready,"reason":reason,"seconds":batch_seconds(s,recipe),"yield":batch_yield(s,recipe)}

static func batch_seconds(s:Dictionary,recipe:Dictionary) -> int:
	return maxi(1,ceili(float(recipe.duration_s)/(1+trait_bonus(s,str(recipe.building_id),"speed")+Projects.bonus(s,"craft_speed"))))

static func batch_yield(s:Dictionary,recipe:Dictionary) -> int:
	var id=str(recipe.building_id)
	var b=s.building_states[id]
	return maxi(1,floori(float(recipe.output.qty)*(1+0.07*(int(b.level)-1))*(1+0.025*worker_level(s,id))*(1+trait_bonus(s,id,"yield"))*float(b.condition)))

static func target_reached(s:Dictionary,job:Dictionary,recipe:Dictionary) -> bool:
	var target=int(job.get("stock_target",0))
	return target>0 and int(s.inventory.get(recipe.output.resource_id,0))>=target

static func reserve(s: Dictionary,job: Dictionary,recipe: Dictionary) -> bool:
	if target_reached(s,job,recipe):return false
	var id=str(recipe.building_id)
	var cost=effective_recipe_cost(s,recipe)
	if not cost_ok(s,cost):return false
	debit(s,cost)
	job.reserved=cost
	job.remaining=batch_seconds(s,recipe)
	return true

static func queue_recipe(reg,s: Dictionary,id: String,recipe_id: String,repeat: bool,batches: int=1,stock_target:int=0) -> bool:
	if not reg.recipes.has(recipe_id) or not reg.buildings.has(id) or batches<1 or batches>20:return false
	var recipe=reg.recipes[recipe_id]
	var b=s.building_states[id]
	if recipe.building_id!=id or int(b.level)<int(recipe.min_building_level) or worker_level(s,id)==0:return false
	# An unreserved stalled order can be replaced atomically; never discard reserved inputs.
	if not b.production.is_empty() and (not b.production.reserved.is_empty() or int(b.production.remaining)>0):return false
	if stock_target<0 or stock_target>capacity(s,str(recipe.output.resource_id)) or (stock_target>0 and not repeat):return false
	var job={"recipe":recipe_id,"repeat":repeat,"reserved":{},"remaining":0,"batches_left":batches}
	if stock_target>0:job.stock_target=stock_target
	if not reserve(s,job,recipe) and not repeat:return false
	b.production=job
	return true

static func enqueue(reg,s:Dictionary,id:String,recipe_id:String,batches:int) -> bool:
	if not reg.recipes.has(recipe_id) or not s.building_states.has(id) or batches<1 or batches>20:return false
	var recipe=reg.recipes[recipe_id]
	var b=s.building_states[id]
	if recipe.building_id!=id or int(b.level)<int(recipe.min_building_level):return false
	var waiting=b.get("waiting_orders",[])
	if waiting.size()>=5:return false
	waiting.append({"recipe":recipe_id,"batches":batches})
	b.waiting_orders=waiting
	return true

static func remove_waiting(s:Dictionary,id:String,index:int) -> bool:
	if not s.building_states.has(id):return false
	var waiting=s.building_states[id].get("waiting_orders",[])
	if index<0 or index>=waiting.size():return false
	waiting.remove_at(index)
	return true

static func promote_waiting(reg,s:Dictionary,id:String) -> bool:
	var b=s.building_states[id]
	var waiting=b.get("waiting_orders",[])
	if waiting.is_empty() or not b.production.is_empty():return false
	var order=waiting[0]
	if not queue_recipe(reg,s,id,str(order.recipe),false,int(order.batches)):return false
	waiting.pop_front()
	return true

static func cancel(s: Dictionary,id: String) -> bool:
	if not s.building_states.has(id) or s.building_states[id].production.is_empty():return false
	var job=s.building_states[id].production
	for resource in job.reserved:Rewards.deliver(s,resource,int(job.reserved[resource]))
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
		if b.production.is_empty():promote_waiting(reg,s,id)
		if b.production.is_empty() or worker_level(s,id)==0:continue
		var job=b.production
		var recipe=reg.recipes[job.recipe]
		if job.reserved.is_empty() and not reserve(s,job,recipe):continue
		job.remaining=maxi(0,int(job.remaining)-dt)
		if int(job.remaining)>0:continue
		var qty=batch_yield(s,recipe)
		if not put(s,recipe.output.resource_id,qty):continue
		award_job(s,id,maxi(1,roundi(float(qty)*(1+trait_bonus(s,id,"quality")))))
		s.craft_count=int(s.craft_count)+1
		Content.bump(s,"craft_item")
		job.reserved={}
		if not job.repeat:
			job.batches_left=int(job.get("batches_left",1))-1
			if int(job.batches_left)<=0:b.production={}
			else:reserve(s,job,recipe)
		else:reserve(s,job,recipe)
	# Compute territorial resource access once per tick, rather than once per source.
	var owned_resources={}
	for territory in reg.territories.values():
		if s.territory_states[territory.id].owner=="FAC-009":
			for resource in territory.resources:
				var development=clampi(int(s.territory_states[territory.id].get("development",0)),0,5)
				owned_resources[resource.resource_id]=maxi(int(owned_resources.get(resource.resource_id,0)),development)
	for source in reg.supply:
		var id=str(source.building_id)
		var kind=str(source.source_type)
		if not kind in ["farm","herb_garden","chakra_spring","territory"]:continue
		if level(s,id)<=0 or level(s,"BLD-001")<int(source.source_min_hq) or worker_level(s,id)==0:continue
		if kind=="territory" and not owned_resources.has(source.resource_id):continue
		var resource_id=str(source.resource_id)
		var elapsed=int(s.supply_clock.get(resource_id,0))+dt
		var regional=0.05*int(owned_resources.get(resource_id,0)) if kind=="territory" else 0.0
		var period=maxi(1,ceili(float(source.period_seconds)/(1+trait_bonus(s,id,"speed")+Projects.bonus(s,"supply_speed")+regional)))
		while elapsed>=period:
			var b=s.building_states[id]
			var qty=maxi(1,floori(float(source.base_yield)*(1+0.07*(int(b.level)-1))*(1+0.025*worker_level(s,id))*(1+trait_bonus(s,id,"yield"))*float(b.condition)))
			if put(s,resource_id,qty):
				award_job(s,id,qty)
				s.production_count=int(s.production_count)+1
				Content.bump(s,"collect_production")
				elapsed-=period
			else:
				elapsed=period
				break
		s.supply_clock[resource_id]=elapsed
	if int(s.stamina)>=120:s.stamina_seconds=0
	else:
		s.stamina_seconds=int(s.stamina_seconds)+dt
		var amount=floori(float(s.stamina_seconds)/360.0)
		s.stamina=mini(120,int(s.stamina)+amount)
		s.stamina_seconds=int(s.stamina_seconds)%360 if int(s.stamina)<120 else 0
	s.simulation_seconds=int(s.simulation_seconds)+dt
	World.step(reg,s,dt)
	Content.step(s,dt)

static func advance(reg,s: Dictionary,now: int) -> bool:
	ensure(reg,s)
	var previous=maxi(int(s.last_committed_timestamp),int(s.high_water_timestamp))
	if now<=previous:return false
	var elapsed=mini(86400,now-previous)
	var remaining=elapsed
	var cursor=now-elapsed
	while remaining>0:
		s.last_committed_timestamp=cursor
		s.high_water_timestamp=cursor
		Content.sync_day(s)
		var dt=mini(60,remaining)
		for b in s.building_states.values():
			if not b.upgrade.is_empty():dt=mini(dt,maxi(1,int(b.upgrade.remaining)))
			if not b.production.is_empty() and int(b.production.remaining)>0:dt=mini(dt,int(b.production.remaining))
		for mission in s.missions.values():
			if int(mission.remaining)>0:dt=mini(dt,int(mission.remaining))
		if not s.travel.is_empty():dt=mini(dt,maxi(1,int(s.travel.remaining)))
		for squad in s.world_squads.values():
			if not squad.travel.is_empty():dt=mini(dt,maxi(1,int(squad.travel.remaining)))
		dt=mini(dt,600-int(s.world_seconds))
		var bias=int(Time.get_time_zone_from_system().bias)*60
		dt=mini(dt,86400-posmod(cursor+bias,86400))
		cursor+=dt
		s.last_committed_timestamp=cursor
		s.high_water_timestamp=cursor
		step(reg,s,dt)
		remaining-=dt
	s.last_committed_timestamp=now
	s.high_water_timestamp=now
	s.last_offline_elapsed=elapsed
	Content.sync_day(s)
	return true

static func specialty(id: String) -> String:
	var mapping={"BLD-001":"JOB-01","BLD-002":"JOB-14","BLD-003":"JOB-02","BLD-004":"JOB-03","BLD-005":"JOB-04","BLD-006":"JOB-05","BLD-007":"JOB-14","BLD-008":"JOB-08","BLD-009":"JOB-14","BLD-010":"JOB-08","BLD-011":"JOB-11","BLD-012":"JOB-09","BLD-013":"JOB-07","BLD-014":"JOB-10","BLD-015":"JOB-10","BLD-016":"JOB-05","BLD-017":"JOB-06","BLD-018":"JOB-07","BLD-019":"JOB-08","BLD-020":"JOB-12","BLD-021":"JOB-12","BLD-022":"JOB-11","BLD-023":"JOB-13","BLD-024":"JOB-02","BLD-025":"JOB-03","BLD-026":"JOB-08","BLD-027":"JOB-08","BLD-028":"JOB-14","BLD-029":"JOB-12","BLD-030":"JOB-11"}
	return str(mapping.get(id,""))

# Profession identity is separate from ninja combat stats. Preferred expertise
# gains a small incremental bonus only at the matching workplace.
static func profession_focus(id:String) -> String:
	var focus={"JOB-01":"speed","JOB-02":"quality","JOB-03":"economy","JOB-04":"quality","JOB-05":"yield","JOB-06":"quality","JOB-07":"economy","JOB-08":"quality","JOB-09":"yield","JOB-10":"yield","JOB-11":"speed","JOB-12":"economy","JOB-13":"speed","JOB-14":"economy","JOB-15":"speed"}
	return str(focus.get(id,""))

static func profession_bonus(profession:String,talent:String,lv:int,matching:bool) -> float:
	if not matching or profession_focus(profession)!=talent:return 0.0
	var extra=0.0
	for milestone in [10,25,50,100]:
		if lv>=milestone:extra+=0.01
	return extra

static func talent_points(level_value: int) -> int:
	var points=0
	for threshold in [1,10,25,50,100]:
		if level_value>=threshold:points+=1
	return points

static func choose_talent(s: Dictionary,ninja: String,profession: String,talent: String) -> bool:
	if not s.jobs.has(ninja) or not talent in ["yield","economy","quality","speed"]:return false
	var careers=s.jobs[ninja].careers
	if not careers.has(profession):return false
	var career=careers[profession]
	if not career.has("talents"):career.talents={}
	var used=0
	for value in career.talents.values():used+=int(value)
	if used>=talent_points(int(career.level)):return false
	career.talents[talent]=int(career.talents.get(talent,0))+1
	return true

static func trait_bonus(s: Dictionary,id: String,talent: String) -> float:
	var best=0.0
	for ninja in workers(s,id):
		var job=s.jobs[ninja]
		var career=job.careers[job.profession]
		var matching=job.profession==specialty(id) or (id=="BLD-017" and job.profession=="JOB-15")
		var factor=0.06*int(career.get("talents",{}).get(talent,0))+(0.05 if matching else 0.0)+profession_bonus(str(job.profession),talent,int(career.level),matching)
		best=maxf(best,factor)
	return minf(0.3,best) if talent=="economy" else minf(0.5,best)
