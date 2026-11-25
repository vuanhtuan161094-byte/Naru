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
var defended_attempts=0
var defended_wins=0
var trial_attempts={}
var trial_wins={}
var last_stage_hp={}
var beast_bound=0
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
	if sim.outcome=="":
		watchdogs+=1
		return "watchdog" if store.interrupt_stage(reg,event) else "error"
	if not won:
		var player_hp=0.0
		var enemy_hp=0.0
		for actor in sim.actors:
			if actor.summon:continue
			if int(actor.side)==0:player_hp+=maxf(0.0,float(actor.hp))
			else:enemy_hp+=maxf(0.0,float(actor.hp))
		last_stage_hp={"stage":stage.id,"player_hp":player_hp,"enemy_hp":enemy_hp,"ticks":sim.ticks}
	if not store.finish_stage(reg,stage,event,won,sim.counts,sim.mastery_counts,sim.action_stats,sim.passive_mastery):return "error"
	return "win" if won else "loss"

func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():
		quit(1)
		return
	var store=Store.new()
	store.save_path="user://world_organic_p7.json"
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
	# Earn-only: 60 days by default; integration CI may request 45–90 days.
	var days=90
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("organic-days="):days=clampi(int(arg.trim_prefix("organic-days=")),45,90)
	var crafted={}
	var wins=0
	var next_stage=1
	for day in range(1,days+1):
		if Village.level(store.state,"BLD-001")<15:store.construct(reg,"BLD-001")
		var jobs=["BLD-012","BLD-013","BLD-016","BLD-017","BLD-019","BLD-018","BLD-007","BLD-009","BLD-008","BLD-026","BLD-027","BLD-021","BLD-003","BLD-004","BLD-005"]
		for building in jobs:
			if Village.level(store.state,building)<(1 if building in ["BLD-021","BLD-003","BLD-004","BLD-005","BLD-026","BLD-027"] else 9):store.construct(reg,building)
		# Leave room for three workshop rounds in the daily cycle.
		advance(reg,store,82800)
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
		# Extra earned mission dispatch: repeat EXP and Ryo from real sources; no extra grant.
		if day>=5:
			var extra=0
			for ninja in owned:
				if store.state.missions.has(ninja):continue
				if store.start_mission(reg,ninja,"RES-116" if extra%2==0 else "RES-001",true):extra+=1
				if extra>=4:break
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
		var offers=[]
		for raw in reg.resources:
			var q=store.merchant_quote(reg,raw)
			if not q.is_empty() and q.ready:offers.append({"id":raw,"total":q.total})
		offers.sort_custom(func(a,b):return int(a.total)>int(b.total))
		for offer in offers.slice(0,3):store.fulfill_merchant_order(reg,str(offer.id))
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
		# Coverage wave + gear/seal waves; each workshop still uses real inputs and elapsed time.
		for wave in range(3):
			var needs={}
			if wave==0:
				for recipe in reg.recipes.values():
					if not settled_recipes.has(recipe.id):needs[recipe.output.resource_id]=1
			else:
				needs={"RES-110":12,"RES-059":20,"RES-100":12,"RES-127":5,"RES-125":3,"RES-113":12}
			var plan=Guide.plan(reg,needs,store.state.inventory)
			var recipes=reg.recipes.values()
			recipes.sort_custom(func(a,b):
				var pa=0 if not settled_recipes.has(a.id) and wave==0 else 1 if plan.orders.has(a.id) else 2
				var pb=0 if not settled_recipes.has(b.id) and wave==0 else 1 if plan.orders.has(b.id) else 2
				return pa<pb)
			for recipe in recipes:
				if settled_recipes.has(recipe.id) and not plan.orders.has(recipe.id):continue
				var building=str(recipe.building_id)
				if Village.level(store.state,building)<int(recipe.min_building_level) or Village.worker_level(store.state,building)==0:continue
				if not store.state.building_states[building].production.is_empty():continue
				for item in recipe.inputs:
					var id=str(item.resource_id)
					var shortage=maxi(0,int(item.qty)-int(store.state.inventory.get(id,0)))
					if shortage==0:continue
					for seller in Guide.sellers(reg,store.state,id):
						if seller.accessible and int(seller.stock)>=shortage:
							if store.trade_resource(reg,str(seller.faction),id,shortage,true):break
				var quote=Village.recipe_quote(store.state,recipe)
				if not quote.ready:continue
				var batch=1 if wave==0 else mini(3,mini(int(quote.affordable),maxi(1,int(plan.orders.get(recipe.id,1)))))
				if store.production(reg,building,str(recipe.id),false,batch):
					crafted[recipe.id]=str(recipe.output.resource_id)
			advance(reg,store,1200)
		# Prioritize banked XP and realm seals over shard conversion and other sinks.
		var realm_need=0
		for id in team:
			var q=store.breakthrough_quote(id)
			if store.xp_to_cap(id)==0:realm_need+=int(q.cost)
		if realm_need>0 and int(store.state.inventory.get("RES-128",0))<realm_need:
			var candidates=store.trial_roster(reg,"RES-128")
			var roster=[]
			for id in team:
				if id in candidates:roster.append(id)
			for id in candidates:
				if roster.size()>=6:break
				if not id in roster:roster.append(id)
			if not roster.is_empty():
				var trial=store.resource_trial_batch(reg,"RES-128",roster)
				trial_attempts["RES-128"]=int(trial_attempts.get("RES-128",0))+int(trial.attempts)
				trial_wins["RES-128"]=int(trial_wins.get("RES-128",0))+int(trial.wins)
		# Spend available stamina on already-cleared progression (actual fights).
		if next_stage>10:
			for replay_i in range(4 if next_stage>=60 else 2):
				var repeat_result=battle(reg,store,reg.stages["STG-%03d" % (next_stage-1)],70000+day*10+replay_i)
				if repeat_result=="error":
					push_error("WORLD_ORGANIC_FAIL repeat settle")
					quit(1)
					return
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
				store.breakthrough(id)
			if int(n.quality)<8 and day%3==0:
				store.quality_trial(reg,id)
				store.evolve_quality(reg,id)
			for passive in reg.passives_by_ninja.get(id,[]):
				if store.passive_spend_allowed(reg,id,str(passive.id)):store.upgrade_passive(reg,id,str(passive.id),5)
			if int(n.points)>=3:store.allocate(id,"intellect" if int(n.allocated.get("intellect",0))<int(n.allocated.get("vitality",0)) else "vitality",mini(20,int(n.points)))
			if int(store.state.inventory.get("RES-001",0))>=10000:
				store.train_stat(reg,id,"intellect",5)
				store.train_stat(reg,id,"vitality",5)
			if day>=15:
				for template_id in ["EQ-007-Q2","EQ-002-Q2","EQ-003-Q2","EQ-009-Q2"]:
					var slot=str(reg.gear_templates[template_id].slot_id)
					var equipped=str(n.gear.get(slot,""))
					if equipped!="" and int(reg.gear_templates[store.state.gear_instances[equipped].template_id].quality)>=2:continue
					var upgraded=store.craft_gear(reg,template_id)
					if upgraded!="" and store.equip_gear(reg,id,upgraded):gear_count+=1
					break
			for key in n.gear.values():
				if int(store.state.gear_instances[key].enhance)<5:store.enhance_gear(key)
			for skill_id in reg.ninjas[id].skills:
				if reg.skill_policies.has(skill_id):
					store.upgrade_skill(reg,id,skill_id,10)
					if int(store.skill_progress(n,skill_id).level)==20:store.advance_skill(reg,id,skill_id)
			if int(n.stars)<15:
				var step=reg.growth.stars[int(n.stars)-1]
				if int(n.shards)<int(step.shards) and int(store.state.inventory.get("RES-001",0))>=12000:store.exchange_shards(id,mini(20,int(step.shards)-int(n.shards)))
				store.raise_star(reg,id)
			if int(n.level)<(int(n.realm)+1)*20 and int(store.state.inventory.get("RES-001",0))>=6000:
				var purchase=mini(30,maxi(0,int((int(store.state.inventory["RES-001"])-4000)/600.0)))
				if purchase>0:store.buy_training_scrolls("RES-117",purchase)
			for batch_i in range(8 if id==team[0] else 2):
				if store.xp_to_cap(id)==0:
					if store.breakthrough(id)!="success":break
				if not store.train_to_cap(reg,id,"RES-117") and not store.train_to_cap(reg,id,"RES-116"):break
		# Rotate real trials on strongest current ninja; no fabricated material grant.
		var strongest=str(team[0])
		for resource in ["RES-128","RES-130","RES-134","RES-126","RES-131","RES-132", "RES-%03d" % (136+posmod(day,9))]:
			if int(store.state.inventory.get(resource,0))>=30:continue
			var candidates=store.trial_roster(reg,resource)
			var roster=[]
			for id in team:
				if id in candidates:roster.append(id)
				if roster.size()>=2:break
			if not roster.is_empty():
				var result=store.resource_trial_batch(reg,resource,roster)
				trial_attempts[resource]=int(trial_attempts.get(resource,0))+int(result.attempts)
				trial_wins[resource]=int(trial_wins.get(resource,0))+int(result.wins)
		for bloodline in reg.bloodlines:
			if store.native_bloodline_allowed(reg,strongest,bloodline):store.native_bloodline(reg,strongest,bloodline)
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
		for territory in reg.territories.values():
			if store.state.territory_states[territory.id].owner!="FAC-009":continue
			for resource in territory.resources:store.harvest_territory(reg,str(territory.id),str(resource.resource_id))
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
		if day>=30 and day%10==0 and store.state.travel.is_empty():
			for entry in World.frontier(reg,store.state,str(store.state.world_location)):
				if entry.owner==null:continue
				var target=str(entry.id)
				var owner=str(entry.owner)
				if not store.diplomatic_action(reg,owner,"war"):continue
				if store.state.world_location!=target:
					if not store.travel_to(reg,target):continue
					advance(reg,store,int(entry.seconds))
				defended_attempts+=1
				if store.capture_territory(reg,target) and store.state.territory_states[target].owner=="FAC-009":defended_wins+=1
				var home=World.path(reg,store.state,store.state.world_location,"TER-058")
				if not home.is_empty() and store.travel_to(reg,"TER-058"):advance(reg,store,int(home.seconds))
				break
		if Village.level(store.state,"BLD-027")>0:
			var attempted=false
			for beast_id in reg.beasts:
				if store.state.beasts.has(beast_id):
					for host in reg.beasts[beast_id].compatibility.preferred_host_ids:
						if store.bind_beast(reg,str(host),beast_id):beast_bound+=1
					var training_resource=str(reg.beasts[beast_id].training_resource)
					var qty=mini(20,int(store.state.inventory.get(training_resource,0)))
					if qty>0:store.train_beast(reg,beast_id,qty)
					continue
				if attempted:continue
				for ninja in team:
					if store.beast_capture_ready(reg,ninja,beast_id):
						beast_attempts+=1
						if store.capture_beast(reg,ninja,beast_id):
							for host in reg.beasts[beast_id].compatibility.preferred_host_ids:
								if store.bind_beast(reg,str(host),beast_id):beast_bound+=1
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
	print("NARU_WORLD_P6_DEFENDED attempts=",defended_attempts," wins=",defended_wins," days=",days)
	print("NARU_WORLD_P6_BEAST_GATE ",store.beast_capture_reason(reg,str(team[0]),"BIJ-1")," seals=",store.state.inventory.get("RES-100",0)," hall=",Village.level(store.state,"BLD-027"))
	print("NARU_WORLD_REVIEW_STALLS ",stalls_cleared," WATCHDOGS ",watchdogs," STAGE_LOSSES ",stage_losses)
	for building in store.state.building_states:
		var job=store.state.building_states[building].production
		if not job.is_empty():print("NARU_WORLD_REVIEW_PENDING ",building," ",job)
	print("NARU_WORLD_P7_TRIALS attempts=",trial_attempts," wins=",trial_wins," seal_stock=",store.state.inventory.get("RES-128",0)," bound=",beast_bound," last_loss=",last_stage_hp)
	var loaded=Store.new()
	loaded.save_path=store.save_path
	loaded.load_or_new(reg)
	if not Guard.valid(reg,loaded.state) or loaded.state.cleared.size()!=store.state.cleared.size() or loaded.state.inventory!=store.state.inventory:
		push_error("WORLD_ORGANIC_FAIL reload")
		quit(1)
		return
	print("NARU_WORLD_ORGANIC_INTEGRITY_PASS")
	quit()
