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
	store.save_path="user://world_organic_p3.json"
	store.new_game(reg)
	store.rng.seed=42
	store.setup_starter_jobs(reg)
	observe(store.state)
	store.construct(reg,"BLD-001")
	advance(reg,store,3600)
	for i in range(10):store.draw(reg)
	var team=store.state.owned.keys()
	team.sort_custom(func(a,b):return int(store.state.owned[a].quality)>int(store.state.owned[b].quality))
	team.resize(mini(6,team.size()))
	store.set_team(team)
	for id in team:
		store.buy_training_scrolls("RES-117",2)
		store.train_batch(reg,id,"RES-117",2)
		store.train_batch(reg,id,"RES-116",5)
	# Earn-only: twelve simulated days; all buildings, missions, recipes and market buys use Store.
	var crafted={}
	var wins=0
	var next_stage=1
	for day in range(1,13):
		if Village.level(store.state,"BLD-001")<15:store.construct(reg,"BLD-001")
		var jobs=["BLD-013","BLD-016","BLD-017","BLD-019","BLD-018","BLD-007","BLD-009","BLD-008"]
		for building in jobs:
			if Village.level(store.state,building)<9:store.construct(reg,building)
		advance(reg,store,86400)
		# Preserve wood, stone and Ryo mission while recruiting/assigning newly owned workers.
		var owned=store.state.owned.keys()
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
			if int(store.state.owned[id].level)>=(int(store.state.owned[id].realm)+1)*20:store.breakthrough(id)
			if int(store.state.inventory.get("RES-001",0))>=6000:store.buy_training_scrolls("RES-117",5)
			var qty=mini(5,int(store.state.inventory.get("RES-117",0)))
			if qty>0:store.train_batch(reg,id,"RES-117",qty)
		for attempt in range(2):
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
	print("NARU_WORLD_ORGANIC_OBSERVED wins=",wins,"/120 seen=",seen.size(),"/150 queued=",crafted.size(),"/63 settled=",completed," missing=",missing)
	# Only integrity is a hard gate. Coverage/wins are observations, not fabricated PASS.
	if not Guard.valid(reg,store.state) or not store.save_now():
		push_error("WORLD_ORGANIC_FAIL save")
		quit(1)
		return
	print("NARU_WORLD_ORGANIC_INTEGRITY_PASS")
	quit()
