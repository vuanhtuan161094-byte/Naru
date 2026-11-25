extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Village=preload("res://game/village_service.gd")
const Combat=preload("res://game/combat.gd")
const Guide=preload("res://game/resource_guide.gd")
const Guard=preload("res://game/save_guard.gd")
var seen={}
func observe(s: Dictionary) -> void:
	for id in s.inventory:
		if int(s.inventory[id])>0:seen[id]=true

func advance(reg,store,seconds: int) -> void:
	store.advance_clock(reg,int(store.state.high_water_timestamp)+seconds)
	observe(store.state)

func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():
		quit(1)
		return
	var store=Store.new()
	store.save_path="user://world_organic_p4.json"
	store.new_game(reg)
	store.rng.seed=42
	store.setup_starter_jobs(reg)
	observe(store.state)
	# Explore and capture the adjacent neutral ruin using actual travel before the first NPC tick.
	var captured=false
	if store.travel_to(reg,"TER-057"):
		advance(reg,store,130)
		if store.capture_territory(reg,"TER-057"):captured=store.state.territory_states["TER-057"].owner=="FAC-009"
		if store.travel_to(reg,"TER-058"):advance(reg,store,130)
	print("NARU_WORLD_ORGANIC_CAPTURE ",captured)
	store.construct(reg,"BLD-001")
	advance(reg,store,3600)
	for i in range(10):store.draw(reg)
	var team=store.state.owned.keys()
	team.sort_custom(func(a,b):return int(store.state.owned[a].quality)>int(store.state.owned[b].quality))
	team.resize(mini(6,team.size()))
	store.set_team(team)
	var starter_equipped=0
	for id in team:
		var gear=store.craft_gear(reg,"EQ-001-Q1",true)
		if gear!="" and store.equip_gear(reg,id,gear):starter_equipped+=1
	print("NARU_WORLD_ORGANIC_STARTER_GEAR ",starter_equipped)
	for id in team:
		store.buy_training_scrolls("RES-117",2)
		store.train_batch(reg,id,"RES-117",2)
		store.train_batch(reg,id,"RES-116",5)
	# Earn-only: 24 simulated days; up to 120 stage attempts, no fixture grants.
	var crafted={}
	var wins=0
	var next_stage=1
	for day in range(1,25):
		if Village.level(store.state,"BLD-001")<15:store.construct(reg,"BLD-001")
		var jobs=["BLD-012","BLD-013","BLD-016","BLD-017","BLD-019","BLD-018","BLD-007","BLD-009","BLD-008","BLD-026","BLD-027"]
		for building in jobs:
			if Village.level(store.state,building)<9:store.construct(reg,building)
		advance(reg,store,86400)
		# Preserve wood, stone and Ryo mission while recruiting/assigning newly owned workers.
		for draw in range(5):
			if int(store.state.inventory.get("RES-002",0))>=100:store.draw(reg)
		var owned=store.state.owned.keys()
		var mission_resources=["RES-002","RES-118","RES-119","RES-120","RES-116"]
		for ninja in owned:
			if mission_resources.is_empty():break
			if not store.state.missions.has(ninja):
				if store.start_mission(reg,ninja,mission_resources[0],true):mission_resources.pop_front()
		for building in jobs:
			if Village.level(store.state,building)<=0 or not Village.workers(store.state,building).is_empty():continue
			for ninja in owned:
				if store.state.jobs.get(ninja,{}).get("building","")=="": 
					store.assign_job(reg,ninja,building,"JOB-10")
					break
		for faction in reg.factions:
			if faction!="FAC-009":store.diplomatic_action(reg,faction,"trade")
		for recipe in reg.recipes.values():
			if crafted.has(recipe.id) or Village.level(store.state,recipe.building_id)<int(recipe.min_building_level) or Village.worker_level(store.state,recipe.building_id)==0:continue
			if not store.state.building_states[recipe.building_id].production.is_empty():continue
			for item in recipe.inputs:
				var id=str(item.resource_id)
				var shortage=maxi(0,int(item.qty)-int(store.state.inventory.get(id,0)))
				if shortage==0:continue
				for seller in Guide.sellers(reg,store.state,id):
					if seller.accessible and int(seller.stock)>=shortage:
						if store.trade_resource(reg,str(seller.faction),id,shortage,true):break
			if store.production(reg,str(recipe.building_id),str(recipe.id),false):
				crafted[recipe.id]=str(recipe.output.resource_id)
		advance(reg,store,3600)
		# Manual-ultimate API, no enemy/stat fixtures. A loss retries on a later day.
		for id in team:
			var n=store.state.owned[id]
			if int(n.level)>=(int(n.realm)+1)*20:
				if int(store.state.inventory.get("RES-128",0))<int(ceil(3*pow(float(n.realm)+1,1.4))) and Village.level(store.state,"BLD-009")>0:store.resource_trial(reg,id,"RES-128")
				store.breakthrough(id)
			if int(n.points)>=3:store.allocate(id,"vitality",mini(10,int(n.points)))
			for skill_id in reg.ninjas[id].skills:
				if reg.skill_policies.has(skill_id):store.upgrade_skill(reg,id,skill_id,5)
			if int(n.stars)<15:
				var step=reg.growth.stars[int(n.stars)-1]
				if int(n.shards)<int(step.shards):store.exchange_shards(id,mini(20,int(step.shards)-int(n.shards)))
				store.raise_star(reg,id)
			if int(store.state.inventory.get("RES-001",0))>=6000:store.buy_training_scrolls("RES-117",5)
			var qty=mini(5,int(store.state.inventory.get("RES-117",0)))
			if qty>0:store.train_batch(reg,id,"RES-117",qty)
		for attempt in range(5):
			if next_stage>120:break
			var stage=reg.stages["STG-%03d" % next_stage]
			var event=store.begin_stage(stage)
			if event=="":break
			var sim=Combat.new()
			sim.use_p2=true
			sim.setup(reg,store.state,stage,42+day*100+next_stage)
			for tick in range(3600):
				for i in range(team.size()):sim.ultimate(i)
				sim.tick(0.05)
				if sim.outcome!="":break
			var won=sim.outcome=="win"
			if not store.finish_stage(reg,stage,event,won,sim.counts,sim.mastery_counts,sim.action_stats):
				push_error("WORLD_ORGANIC_FAIL settle")
				quit(1)
				return
			if won:
				wins+=1
				next_stage+=1
			else:break
		for quest in reg.quests:store.claim_quest(reg,quest)
		if captured:
			for resource in reg.territories["TER-057"].resources:store.harvest_territory(reg,"TER-057",str(resource.resource_id))
		if Village.level(store.state,"BLD-026")>0:
			for contract_id in reg.contracts:
				if not store.state.summon_contracts.has(contract_id) and store.make_contract(reg,contract_id):break
		observe(store.state)
		print("NARU_WORLD_ORGANIC_DAY ",day," HQ=",Village.level(store.state,"BLD-001")," WINS=",wins," STOCK_IDS=",seen.size()," QUEUED_RECIPES=",crafted.size()," RYO=",store.state.inventory.get("RES-001",0))
	var completed=0
	for recipe_id in crafted:
		var recipe=reg.recipes[recipe_id]
		var job=store.state.building_states[recipe.building_id].production
		if job.is_empty() or job.get("recipe","")!=recipe_id:completed+=1
	var missing=[]
	for id in reg.resources:
		if not seen.has(id):missing.append(id)
	print("NARU_WORLD_ORGANIC_OBSERVED wins=",wins,"/120 seen=",seen.size(),"/150 queued=",crafted.size(),"/63 settled=",completed," ninja=",store.state.owned.size()," contracts=",store.state.summon_contracts.size()," captured=",captured," missing=",missing)
	# Only integrity is a hard gate. Coverage/wins are observations, not fabricated PASS.
	if not Guard.valid(reg,store.state) or not store.save_now():
		push_error("WORLD_ORGANIC_FAIL save")
		quit(1)
		return
	print("NARU_WORLD_ORGANIC_INTEGRITY_PASS")
	quit()
