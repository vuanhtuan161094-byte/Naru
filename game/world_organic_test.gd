extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Village=preload("res://game/village_service.gd")
const Combat=preload("res://game/combat.gd")
const Guide=preload("res://game/resource_guide.gd")
const World=preload("res://game/world_service.gd")
const Guard=preload("res://game/save_guard.gd")
var seen={}
var gear_count=0
var boss_replays=0
var beast_attempts=0
var frontier_captures=0
var settled_recipes={}
var stalls_cleared=0
var stage_losses={}
var watchdogs=0
func observe(s: Dictionary) -> void:
	for id in s.inventory:
		if int(s.inventory[id])>0:seen[id]=true

func advance(reg,store,seconds: int) -> void:
	var pending={}
	for building in store.state.building_states:
		var job=store.state.building_states[building].production
		if not job.is_empty():pending[building]=str(job.recipe)
	store.advance_clock(reg,int(store.state.high_water_timestamp)+seconds)
	for building in pending:
		var job=store.state.building_states[building].production
		if job.is_empty():settled_recipes[pending[building]]=true
	observe(store.state)

func battle(reg,store,stage: Dictionary,seed_value: int) -> String:
	var event=store.begin_stage(stage)
	if event=="":return "locked"
	var sim=Combat.new()
	sim.use_p2=true
	sim.setup(reg,store.state,stage,seed_value)
	for tick in range(3600):
		for i in range(store.state.team.size()):sim.ultimate(i)
		sim.tick(0.05)
		if sim.outcome!="":break
	var won=sim.outcome=="win"
	if sim.outcome=="":watchdogs+=1
	if not store.finish_stage(reg,stage,event,won,sim.counts,sim.mastery_counts,sim.action_stats,sim.passive_mastery):return "error"
	return "win" if won else "loss"

func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():
		quit(1)
		return
	var store=Store.new()
	store.save_path="user://world_organic_p5_review.json"
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
		if gear!="" and store.equip_gear(reg,id,gear):
			starter_equipped+=1
			gear_count+=1
	print("NARU_WORLD_ORGANIC_STARTER_GEAR ",starter_equipped)
	for id in team:
		store.buy_training_scrolls("RES-117",2)
		store.train_batch(reg,id,"RES-117",2)
		store.train_batch(reg,id,"RES-116",5)
	# Earn-only: 45 simulated days, no fixture grants; actual merchant and intermediate restock.
	var crafted={}
	var wins=0
	var next_stage=1
	for day in range(1,46):
		if Village.level(store.state,"BLD-001")<15:store.construct(reg,"BLD-001")
		var jobs=["BLD-012","BLD-013","BLD-016","BLD-017","BLD-019","BLD-018","BLD-007","BLD-009","BLD-008","BLD-026","BLD-027","BLD-021","BLD-003","BLD-004","BLD-005"]
		for building in jobs:
			if Village.level(store.state,building)<(1 if building in ["BLD-021","BLD-003","BLD-004","BLD-005","BLD-026","BLD-027"] else 9):store.construct(reg,building)
		advance(reg,store,86400)
		# Preserve wood, stone and Ryo mission while recruiting/assigning newly owned workers.
		for draw in range(5):
			if int(store.state.inventory.get("RES-002",0))>=100:store.draw(reg)
		var owned=store.state.owned.keys()
		var mission_resources=["RES-002","RES-118","RES-119","RES-120","RES-116","RES-003","RES-004","RES-005","RES-121","RES-122","RES-123","RES-124"]
		for mission in store.state.missions.values():mission_resources.erase(str(mission.resource))
		for ninja in owned:
			if mission_resources.is_empty():break
			if not store.state.missions.has(ninja):
				for resource in mission_resources.duplicate():
					if store.start_mission(reg,ninja,resource,true):
						mission_resources.erase(resource)
						break
		for building in jobs:
			if Village.level(store.state,building)<=0 or not Village.workers(store.state,building).is_empty():continue
			for ninja in owned:
				if store.state.jobs.get(ninja,{}).get("building","")=="": 
					store.assign_job(reg,ninja,building,Village.specialty(building))
					break
		for faction in reg.factions:
			if faction!="FAC-009":store.diplomatic_action(reg,faction,"trade")
		var squad=store.state.world_squads["SQUAD-2"]
		if squad.team.is_empty():
			for ninja in owned:
				if not ninja in team and store.set_world_squad("SQUAD-2",[ninja]):break
		if not squad.team.is_empty() and squad.travel.is_empty():
			for entry in World.frontier(reg,store.state,str(squad.location)):
				if entry.owner!=null:continue
				var target=str(entry.id)
				if target!=str(squad.location):
					if not store.squad_travel(reg,"SQUAD-2",target):continue
					advance(reg,store,int(entry.seconds))
				if store.squad_capture(reg,"SQUAD-2") and store.state.territory_states[target].owner=="FAC-009":frontier_captures+=1
				break
		for raw in ["RES-006","RES-009","RES-021"]:store.fulfill_merchant_order(reg,raw)
		# Buy actual missing raw stock; no fictional source for neutral-only commodities.
		for raw in reg.resources:
			if int(str(raw).right(3))<6 or int(str(raw).right(3))>20 or int(store.state.inventory.get(raw,0))>=10:continue
			for seller in Guide.sellers(reg,store.state,raw):
				if seller.accessible and int(seller.stock)>=10 and store.trade_resource(reg,str(seller.faction),raw,10,true):break
		# Never block an entire workshop with a starved repeat batch; cancel only unreserved work.
		for building in jobs:
			var job=store.state.building_states[building].production
			if not job.is_empty() and job.reserved.is_empty() and int(job.remaining)==0:
				if store.cancel_production(building):stalls_cleared+=1
		var recipes=reg.recipes.values()
		recipes.sort_custom(func(a,b):return int(settled_recipes.has(a.id))<int(settled_recipes.has(b.id)))
		for recipe in recipes:
			if (settled_recipes.has(recipe.id) and int(store.state.inventory.get(recipe.output.resource_id,0))>=5) or Village.level(store.state,recipe.building_id)<int(recipe.min_building_level) or Village.worker_level(store.state,recipe.building_id)==0:continue
			if not store.state.building_states[recipe.building_id].production.is_empty():continue
			for item in recipe.inputs:
				var id=str(item.resource_id)
				var shortage=maxi(0,int(item.qty)-int(store.state.inventory.get(id,0)))
				if shortage==0:continue
				for seller in Guide.sellers(reg,store.state,id):
					if seller.accessible and int(seller.stock)>=shortage:
						if store.trade_resource(reg,str(seller.faction),id,shortage,true):break
			if store.production(reg,str(recipe.building_id),str(recipe.id),false,1):
				crafted[recipe.id]=str(recipe.output.resource_id)
		advance(reg,store,3600)
		# Manual-ultimate API, no enemy/stat fixtures. A loss retries on a later day.
		for id in team:
			var n=store.state.owned[id]
			if int(store.state.inventory.get("RES-001",0))>=4000:
				for template_id in ["EQ-007-Q1","EQ-002-Q1","EQ-003-Q1","EQ-009-Q1","EQ-011-Q1","EQ-005-Q1"]:
					var slot=str(reg.gear_templates[template_id].slot_id)
					if n.gear.has(slot):continue
					var item=store.craft_gear(reg,template_id,true)
					if item!="" and store.equip_gear(reg,id,item):gear_count+=1
					break
			if int(n.level)>=(int(n.realm)+1)*20:
				if int(store.state.inventory.get("RES-128",0))<int(ceil(3*pow(float(n.realm)+1,1.4))) and Village.level(store.state,"BLD-009")>0:store.resource_trial(reg,id,"RES-128")
				store.breakthrough(id)
			if int(n.points)>=3:store.allocate(id,"intellect" if int(n.allocated.get("intellect",0))<int(n.allocated.get("vitality",0)) else "vitality",mini(20,int(n.points)))
			if int(store.state.inventory.get("RES-001",0))>=10000:
				store.train_stat(reg,id,"intellect",5)
				store.train_stat(reg,id,"vitality",5)
			for key in n.gear.values():
				if int(store.state.gear_instances[key].enhance)<5:store.enhance_gear(key)
			for skill_id in reg.ninjas[id].skills:
				if reg.skill_policies.has(skill_id):
					store.upgrade_skill(reg,id,skill_id,10)
					if int(store.skill_progress(n,skill_id).level)==20:store.advance_skill(reg,id,skill_id)
			if int(n.stars)<15:
				var step=reg.growth.stars[int(n.stars)-1]
				if int(n.shards)<int(step.shards):store.exchange_shards(id,mini(20,int(step.shards)-int(n.shards)))
				store.raise_star(reg,id)
			if int(n.level)<(int(n.realm)+1)*20 and int(store.state.inventory.get("RES-001",0))>=6000:
				var purchase=mini(30,maxi(0,int((int(store.state.inventory["RES-001"])-4000)/600.0)))
				if purchase>0:store.buy_training_scrolls("RES-117",purchase)
			var qty=mini(50 if id==team[0] else 10,int(store.state.inventory.get("RES-117",0)))
			if qty>0:store.train_batch(reg,id,"RES-117",qty)
			var small_qty=mini(50 if id==team[0] else 10,int(store.state.inventory.get("RES-116",0)))
			if small_qty>0:store.train_batch(reg,id,"RES-116",small_qty)
		# Rotate real trials on strongest current ninja; no fabricated material grant.
		var strongest=str(team[0])
		for resource in ["RES-128","RES-130","RES-134", "RES-%03d" % (136+posmod(day,9))]:
			if int(store.state.inventory.get(resource,0))<30 and store.resource_trial_ready(reg,strongest,resource):store.resource_trial(reg,strongest,resource)
		for contract_id in store.state.summon_contracts:
			for ninja in team:
				if store.assign_contract(contract_id,ninja):break
			if int(store.state.summon_contracts[contract_id].level)<10:store.train_contract(contract_id,1)
		for attempt in range(5):
			if next_stage>120:break
			var stage=reg.stages["STG-%03d" % next_stage]
			var result=battle(reg,store,stage,42+day*100+next_stage)
			if result=="error":
				push_error("WORLD_ORGANIC_FAIL settle")
				quit(1)
				return
			if result=="win":
				wins+=1
				next_stage+=1
			else:
				stage_losses[stage.id]=int(stage_losses.get(stage.id,0))+1
				if next_stage>5 and battle(reg,store,reg.stages["STG-%03d" % (next_stage-1)],8000+day)=="error":
					push_error("WORLD_ORGANIC_FAIL fallback settle")
					quit(1)
					return
				break
		for quest in reg.quests:store.claim_quest(reg,quest)
		if captured:
			for resource in reg.territories["TER-057"].resources:store.harvest_territory(reg,"TER-057",str(resource.resource_id))
		if Village.level(store.state,"BLD-026")>0:
			if int(store.state.inventory.get("RES-148",0))<2 and store.state.cleared.has("STG-005"):
				var replay=battle(reg,store,reg.stages["STG-005"],9000+day)
				if replay=="error":
					push_error("WORLD_ORGANIC_FAIL replay settle")
					quit(1)
					return
				if replay=="win":boss_replays+=1
			for contract_id in reg.contracts:
				if not store.state.summon_contracts.has(contract_id) and store.make_contract(reg,contract_id):break
		if Village.level(store.state,"BLD-027")>0:
			var attempted=false
			for beast_id in reg.beasts:
				if attempted:break
				for ninja in team:
					if store.beast_capture_ready(reg,ninja,beast_id):
						beast_attempts+=1
						if store.capture_beast(reg,ninja,beast_id):
							for host in reg.beasts[beast_id].compatibility.preferred_host_ids:store.bind_beast(reg,str(host),beast_id)
						attempted=true
						break
		observe(store.state)
		print("NARU_WORLD_ORGANIC_DAY ",day," HQ=",Village.level(store.state,"BLD-001")," WINS=",wins," STOCK_IDS=",seen.size()," QUEUED_RECIPES=",crafted.size()," RYO=",store.state.inventory.get("RES-001",0))
	var completed=settled_recipes.size()
	var missing=[]
	for id in reg.resources:
		if not seen.has(id):missing.append(id)
	for id in team:
		var n=store.state.owned[id]
		print("NARU_WORLD_P5_ROSTER ",id," LV=",n.level," REALM=",n.realm," STARS=",n.stars," XP=",n.xp)
	print("NARU_WORLD_ORGANIC_OBSERVED wins=",wins,"/120 seen=",seen.size(),"/150 queued=",crafted.size(),"/63 settled=",completed," ninja=",store.state.owned.size()," contracts=",store.state.summon_contracts.size()," captured=",captured," gear=",gear_count," boss_replays=",boss_replays," beast_attempts=",beast_attempts," beasts=",store.state.beasts.size()," missing=",missing)
	# Only integrity is a hard gate. Coverage/wins are observations, not fabricated PASS.
	if not Guard.valid(reg,store.state) or not store.save_now():
		push_error("WORLD_ORGANIC_FAIL save")
		quit(1)
		return
	print("NARU_WORLD_P5_FRONTIER_CAPTURES ",frontier_captures)
	print("NARU_WORLD_REVIEW_STALLS ",stalls_cleared," WATCHDOGS ",watchdogs," STAGE_LOSSES ",stage_losses)
	for building in store.state.building_states:
		var job=store.state.building_states[building].production
		if not job.is_empty():print("NARU_WORLD_REVIEW_PENDING ",building," ",job)
	print("NARU_WORLD_ORGANIC_INTEGRITY_PASS")
	quit()
