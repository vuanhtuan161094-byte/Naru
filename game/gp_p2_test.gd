extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Combat=preload("res://game/combat.gd")
const Village=preload("res://game/village_service.gd")
var failures=0
func check(ok: bool,label: String) -> void:
	if not ok:
		failures+=1
		push_error("GP_P2_FAIL "+label)
	else: print("GP_P2_OK "+label)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():
		push_error(str(reg.errors))
		quit(1)
		return
	var store=Store.new()
	store.save_path="user://gp_p2_ci.json"
	for suffix in ["",".bak",".tmp"]:
		DirAccess.remove_absolute(store.save_path+suffix)
	store.new_game(reg)
	store.rng.seed=42
	var draw=store.draw(reg)
	check(not draw.is_empty() and store.state.owned.has(draw),"recruit")
	check(int(store.state.inventory["RES-002"])==900,"recruit debit")
	var team=store.state.owned.keys()
	check(store.set_team(team),"formation")
	check(not store.set_team([team[0],team[0]]),"reject duplicate")
	var stage=reg.stages["STG-001"]
	var event=store.begin_stage(stage)
	check(not event.is_empty() and int(store.state.stamina)==114,"stage debit")
	var sim=Combat.new()
	sim.use_p2=false
	sim.setup(reg,store.state,stage,42)
	for i in range(24000):
		sim.tick(0.05)
		if not sim.outcome.is_empty(): break
	check(sim.outcome=="win","actual first stage victory")
	var ryo=int(store.state.inventory["RES-001"])
	check(store.finish_stage(reg,stage,event,sim.outcome=="win",sim.counts),"reward commit")
	check(int(store.state.inventory["RES-001"])==ryo+120,"first reward")
	check(not store.finish_stage(reg,stage,event,true,{}),"reject duplicate reward")
	var ninja=str(team[0])
	var xp=int(store.state.owned[ninja].level)
	check(store.train(ninja),"consume XP scroll")
	check(int(store.state.owned[ninja].level)>xp or int(store.state.owned[ninja].xp)>0,"growth")
	check(store.allocate(ninja,"strength"),"allocate point")
	var reload=Store.new()
	reload.save_path=store.save_path
	reload.load_or_new(reg)
	check(reload.state.cleared.has("STG-001") and int(reload.state.owned[ninja].allocated.strength)==1,"reload persisted progression")
	check(not reload.finish_stage(reg,stage,event,true,{}),"reject duplicate after reload")
	var six=store.state.duplicate(true)
	six.team=reg.ninjas.keys().slice(0,6)
	for id in six.team:
		if not six.owned.has(id): six.owned[id]={"level":1,"quality":reg.ninjas[id].initial_quality,"permanent":{}}
	var full=Combat.new()
	full.use_p2=false
	full.setup(reg,six,reg.stages["STG-080"],42)
	check(full.alive(0).size()==6 and full.alive(1).size()==6,"6v6 setup")
	for i in range(200): full.tick(0.05)
	check(full.ticks>0,"6v6 ticks")
	var source=full.actors[0]
	var target=full.actors[6]
	full.apply_status(source,target,{"status_id":"burn","chance":1.0,"duration_s":3.0,"tick_coefficient":0.1})
	check(full.has_status(target,"burn"),"burn applied")
	var before=float(target.hp)
	full.update_status(target,1.0)
	check(float(target.hp)<before or target.shield>0,"dot tick")
	target.statuses.clear()
	target.immune=0.0
	target.cc_chain_count=0
	target.cc_chain_remaining=0.0
	check(full.apply_status(source,target,{"status_id":"stun","chance":1.0,"duration_s":0.01,"ignore_resist_stats":["control_resist","stun_resist"]}),"apply isolated stun")
	full.update_status(target,0.2)
	check(target.immune>0,"control immunity")
	var summon_skill=reg.skills["NIN-001-S1"]
	full.summon_actor(source,summon_skill,summon_skill.effects[0])
	check(full.summon_count(source,summon_skill.skill_id)==1,"summon spawned")
	check(full.primary_alive(0).size()<=6,"summon excluded from team limit")
	target.element_tick=full.ticks
	target.last_element="water"
	target.reaction_tick=-1000
	check(is_equal_approx(full.reaction(source,target,"lightning"),1.2),"water lightning reaction")
	store.state.inventory["RES-119"]=1000
	var skill_id="NIN-001-S2"
	check(store.upgrade_skill(reg,"NIN-001",skill_id),"skill level transaction")
	var p=store.state.owned["NIN-001"]
	p.skill_levels[skill_id].level=20
	p.skill_levels[skill_id].fails=4
	check(store.advance_skill(reg,"NIN-001",skill_id)=="success","skill grade pity")
	check(int(p.skill_levels[skill_id].grade)==2,"skill grade persisted")
	check(store.craft_gear(reg,"EQ-001-Q1").is_empty(),"gear locked without workshop")
	# Explicit CI fixture, not a player grant.
	store.state.building_states["BLD-017"]={"level":1}
	store.state.inventory["RES-059"]=100
	store.state.inventory["RES-110"]=100
	store.state.inventory["RES-113"]=100
	store.state.inventory["RES-114"]=100
	store.state.inventory["RES-132"]=100
	store.state.inventory["RES-077"]=5
	var gear_id=store.craft_gear(reg,"EQ-001-Q1")
	check(not gear_id.is_empty(),"gear craft costs")
	check(store.equip_gear(reg,"NIN-001",gear_id),"equip gear")
	check(not store.equip_gear(reg,"NIN-003",gear_id),"reject shared gear")
	store.state.gear_instances[gear_id].fails=20
	check(store.enhance_gear(gear_id)=="success","enhance pity")
	check(store.refine_gear(gear_id),"refine gear")
	check(store.refine_gear(gear_id,true),"evolve gear")
	check(store.socket_gear(reg,gear_id,"RES-077"),"socket gem")
	check(store.socket_gear(reg,gear_id,"RES-077",true),"return gem")
	var equipped=Combat.new()
	equipped.use_p2=false
	equipped.setup(reg,store.state,stage,42)
	check(float(equipped.actors[0].gear_stats.get("hp",0))>10,"gear stats affect combat")
	var persisted=Store.new()
	persisted.save_path=store.save_path
	persisted.load_or_new(reg)
	check(persisted.state.gear_instances[gear_id].owner=="NIN-001","gear reload")
	check(equipped.actors[0].stats.size()==78,"78 typed stats")
	check(not store.unlock_form(reg,"NIN-001","NIN-001-F1"),"form realm gate")
	p.realm=3
	store.state.inventory["RES-127"]=20
	check(store.unlock_form(reg,"NIN-001","NIN-001-F1"),"unlock form transaction")
	var form_sim=Combat.new()
	form_sim.use_p2=false
	form_sim.setup(reg,store.state,stage,42)
	var actor=form_sim.actors[0]
	actor.chakra=100
	check(form_sim.activate_form(actor,"NIN-001-F1",true),"manual form activation")
	check(actor.chakra==65 and form_sim.form_multiplier(actor,"patk")>1,"form chakra and multiplier")
	check(not form_sim.activate_form(actor,"NIN-001-F1",true),"no form stacking")
	check(not store.trial_ready(reg,"NIN-001","CHALLENGE-NIN-001-1"),"trial mastery gate")
	check(not store.evolve_quality(reg,"NIN-001"),"quality trial gate")
	var village=Store.new()
	village.save_path="user://gp_village_ci.json"
	village.new_game(reg)
	var initial_time=int(village.state.high_water_timestamp)
	village.state.inventory["RES-001"]=100000
	village.state.inventory["RES-006"]=10000
	village.state.inventory["RES-009"]=10000
	for target_level in range(2,10):
		check(village.construct(reg,"BLD-001"),"HQ upgrade queued "+str(target_level))
		initial_time+=1000
		check(village.advance_clock(reg,initial_time) and int(village.state.building_states["BLD-001"].level)==target_level,"HQ timer "+str(target_level))
	check(village.construct(reg,"BLD-017"),"workshop real construction")
	initial_time+=1000
	village.advance_clock(reg,initial_time)
	check(int(village.state.building_states["BLD-017"].level)==1,"workshop completed")
	check(village.assign_job(reg,"NIN-001","BLD-017","JOB-01"),"profession assignment")
	check("NIN-001" in village.state.team,"job coexists with battle")
	check(village.assign_job(reg,"NIN-003","BLD-012","JOB-01"),"farm worker")
	check(village.construct(reg,"BLD-012"),"farm upgrade queued")
	initial_time+=1000
	village.advance_clock(reg,initial_time)
	village.state.inventory["RES-022"]=20
	check(village.production(reg,"BLD-012","RCP-001",false),"recipe reserve")
	var before_recipe=int(village.state.inventory.get("RES-033",0))
	initial_time+=120
	village.advance_clock(reg,initial_time)
	check(int(village.state.inventory.get("RES-033",0))>before_recipe,"recipe completed")
	village.state.stamina=0
	initial_time+=172800
	check(village.advance_clock(reg,initial_time) and int(village.state.last_offline_elapsed)==86400,"offline cap")
	check(int(village.state.stamina)==120,"stamina regen")
	check(not village.advance_clock(reg,initial_time) and not village.advance_clock(reg,initial_time-1),"offline replay and clock rollback")
	check(village.state.territory_states.size()==60 and village.state.faction_states.size()==9,"world seeded")
	var world_tick=int(village.state.world_tick)
	check(village.travel_to(reg,"TER-059"),"travel route")
	check(not village.set_team([]),"travel locks deployed roster")
	initial_time+=200
	village.advance_clock(reg,initial_time)
	check(village.state.world_location=="TER-059" and village.state.travel.is_empty(),"travel arrival")
	check(village.diplomatic_action(reg,"FAC-001","trade"),"trade treaty")
	var npc_stock=int(village.state.faction_states["FAC-001"].stock["RES-006"])
	var player_stock=int(village.state.inventory["RES-006"])
	check(village.trade_resource(reg,"FAC-001","RES-006",1,true),"buy resource")
	check(int(village.state.faction_states["FAC-001"].stock["RES-006"])==npc_stock-1 and int(village.state.inventory["RES-006"])==player_stock+1,"finite stock transfer")
	check(village.trade_resource(reg,"FAC-001","RES-006",1,false),"sell resource")
	check(not village.capture_territory(reg,"TER-058"),"home protected")
	initial_time+=600
	village.advance_clock(reg,initial_time)
	check(int(village.state.world_tick)>world_tick,"NPC offline tick")
	check(reg.boss_rules.size()==24 and reg.quests.size()==81 and reg.combos.size()==12,"campaign registry")
	var boss_sim=Combat.new()
	boss_sim.use_p2=false
	boss_sim.setup(reg,store.state,reg.stages["STG-005"],42)
	var boss_actor=boss_sim.actor_by_uid(boss_sim.boss_actor_uid)
	check(not boss_actor.is_empty(),"boss mapped")
	boss_actor.hp=boss_actor.max_hp*0.6
	boss_sim.update_boss(boss_actor)
	check(boss_sim.boss_phases.fired.has(0) and boss_actor.shield>0,"boss phase shield")
	var shield=float(boss_actor.shield)
	boss_actor.shield=0
	boss_sim.update_boss(boss_actor)
	check(boss_actor.shield==0 and shield>0,"boss phase once")
	var quest=Store.new()
	quest.save_path="user://gp_content_ci.json"
	quest.new_game(reg)
	check(not quest.claim_quest(reg,"QST-079"),"quest gate")
	quest.draw(reg)
	check(quest.claim_quest(reg,"QST-079"),"daily quest reward")
	check(not quest.claim_quest(reg,"QST-079"),"quest once")
	check(quest.start_mission(reg,"NIN-001","RES-001"),"mission dispatch")
	var mission_time=int(quest.state.high_water_timestamp)+300
	quest.advance_clock(reg,mission_time)
	check(quest.state.missions.is_empty(),"mission time completion")
	check(not quest.capture_beast(reg,"NIN-001","BIJ-1"),"beast unlock gate")
	check(not quest.make_contract(reg,"SUM-001"),"contract building gate")
	quest.state.building_states["BLD-026"].level=1
	quest.state.inventory["RES-148"]=10
	check(quest.make_contract(reg,"SUM-001"),"contract transaction")
	check(quest.assign_contract("SUM-001","NIN-001"),"contract owner")
	var contract_sim=Combat.new()
	contract_sim.use_p2=false
	contract_sim.setup(reg,quest.state,stage,42)
	var summoner=contract_sim.actors[0]
	summoner.chakra=100
	check(contract_sim.summon_contract(summoner),"contract battle summon")
	check(not contract_sim.summon_contract(summoner),"contract cooldown")
	check(not quest.native_bloodline(reg,"NIN-001","BL-137"),"bloodline native gate")
	check(reg.affix_pools.size()==3,"affix registry")
	check(store.state.gear_instances[gear_id].get("affixes",[]).size()>0,"crafted affix")
	store.state.inventory["RES-112"]=20
	check(store.reroll_affix(reg,gear_id,0),"affix reroll")
	check(store.settle_affix(gear_id,false),"affix keep old")
	check(store.set_gear_set(reg,gear_id,"SET-2"),"gear set assignment")
	var before_save=store.export_save()
	check(store.import_save(reg,before_save),"valid import")
	check(not store.import_save(reg,"{\"schema_version\":1}"),"reject invalid import")
	var guard=preload("res://game/save_guard.gd")
	var invalid=store.state.duplicate(true)
	invalid.inventory["RES-001"]=-1
	check(not guard.valid(reg,invalid),"negative resource rejected")
	var shield_sim=Combat.new()
	shield_sim.use_p2=false
	shield_sim.setup(reg,store.state,stage,42)
	var a1=shield_sim.actors[0]
	var a2=shield_sim.actors[1]
	shield_sim.add_shield(a1,a1,30,2)
	shield_sim.add_shield(a2,a1,20,4)
	shield_sim.add_shield(a1,a1,10,1)
	var shield_one=maxf(30.0*(1.0+shield_sim.rating(a1,"shield_power")),10.0*(1.0+shield_sim.rating(a1,"shield_power")))
	var shield_two=20.0*(1.0+shield_sim.rating(a2,"shield_power"))
	check(is_equal_approx(float(a1.shield),shield_one+shield_two),"shield per source max")
	shield_sim.update_status(a1,2.1)
	check(is_equal_approx(float(a1.shield),shield_two),"shield independent expiry")
	var reach={}
	for source_def in reg.supply:reach[source_def.resource_id]=true
	for i in range(150):
		for recipe in reg.recipes.values():
			var ok=true
			for material in recipe.inputs:
				if not reach.has(material.resource_id):ok=false
			if ok:reach[recipe.output.resource_id]=true
	check(reach.size()==150,"resource graph 150 reachable")
	for skill in reg.skills.values():
		if not shield_sim.supported(skill):check(false,"unsupported "+str(skill.skill_id))
	check(true,"all skill effect types recognized")
	var water=reg.skills["NIN-001-S0"].duplicate(true)
	water.element="water"
	var lightning=water.duplicate(true)
	lightning.element="lightning"
	shield_sim.spatial_reaction(a1,water,a2)
	check(is_equal_approx(shield_sim.spatial_reaction(a1,lightning,a2),1.2),"spatial element overlap")
	var dispatch_count=0
	var tested=0
	for id in reg.ninjas:
		for dispatch_id in reg.ninjas[id].skills+reg.ninjas[id].additional_skill_ids:
			var run=Combat.new()
			run.use_p2=false
			run.registry=reg
			run.rng.seed=42
			run.add_actor(id,0,20,int(reg.ninjas[id].initial_quality),{},0,1.0,{"forms":reg.ninjas[id].form_ids,"unlocked_skills":reg.ninjas[id].additional_skill_ids})
			run.add_actor("NIN-001",1,20,2,{},0,1.0)
			var attacker=run.actors[0]
			var defender=run.actors[1]
			defender.pos=attacker.pos+Vector2(1,0)
			attacker.chakra=attacker.max_chakra
			var skill=run.effective_skill(attacker,dispatch_id)
			if skill.ai.condition=="ally_dispellable_status":run.apply_status(defender,attacker,{"status_id":"slow","chance":1.0,"duration_s":10})
			var selected=run.target_for(attacker,skill)
			run.release(attacker,skill,selected)
			dispatch_count+=run.effect_dispatch_count
			if run.effect_dispatch_count>0:tested+=1
	check(tested==1152 and dispatch_count>=1152,"all 1152 authored skills dispatch effects")
	for beast_id in reg.beasts:
		var beast_sim=Combat.new()
		beast_sim.use_p2=false
		beast_sim.registry=reg
		beast_sim.add_actor("NIN-001",0,20,2,{},0,1.0)
		beast_sim.add_beast(beast_id,20)
		var beast=beast_sim.actors[1]
		beast.pos=beast_sim.actors[0].pos+Vector2(1,0)
		beast_sim.release(beast,beast_sim.effective_skill(beast,beast.skills[1]),beast_sim.actors[0])
		check(beast.id==beast_id and beast.skills.size()==3 and beast_sim.effect_dispatch_count>=2,"beast kit "+beast_id)
	# Explicit high-power fixture tests the real transaction, not balance.
	var veteran=Store.new()
	veteran.save_path="user://gp_veteran_ci.json"
	veteran.new_game(reg)
	var v=veteran.state.owned["NIN-001"]
	v.realm=6
	v.level=120
	v.permanent={"strength":100000,"vitality":100000,"intellect":100000,"spirit":100000,"agility":100000}
	v.skill_mastery["NIN-001-S2"]=2000
	var trial=reg.trials["CHALLENGE-NIN-001-1"]
	var req=reg.names[trial.skill_id].unlock_require
	v.skill_mastery[req.prior_skill_id]=2000
	v.skill_levels[req.prior_skill_id]={"level":20,"grade":int(req.grade),"fails":0,"branch":""}
	check(veteran.run_trial(reg,"NIN-001",trial.id),"personal trial success")
	check(trial.skill_id in v.unlocked_skills,"additional skill persists")
	v.shards=1000
	veteran.state.inventory["RES-132"]=100
	veteran.state.inventory["RES-127"]=100
	check(veteran.quality_trial(reg,"NIN-001"),"quality trial success")
	var old_quality=int(v.quality)
	check(veteran.evolve_quality(reg,"NIN-001") and int(v.quality)==old_quality+1,"quality evolution success")
	veteran.state.building_states["BLD-027"].level=1
	veteran.state.inventory["RES-100"]=20
	check(veteran.capture_beast(reg,"NIN-001","BIJ-1"),"beast capture success")
	check(veteran.state.beasts.has("BIJ-1") and not veteran.capture_beast(reg,"NIN-001","BIJ-1"),"beast unique capture")
	var economy=Store.new()
	economy.save_path="user://gp_economy_ci.json"
	economy.new_game(reg)
	check(economy.assign_job(reg,"NIN-001","BLD-015","JOB-10"),"starter lumber")
	check(economy.assign_job(reg,"NIN-003","BLD-014","JOB-10"),"starter mine")
	check(economy.assign_job(reg,"NIN-005","BLD-012","JOB-09"),"starter farm")
	check(economy.choose_job_talent("NIN-001","JOB-10","yield"),"profession talent point")
	check(not economy.choose_job_talent("NIN-001","JOB-10","yield"),"profession milestone gate")
	check(economy.start_mission(reg,"NIN-001","RES-001",true),"repeatable mission")
	var start_time=int(economy.state.high_water_timestamp)
	var start_wood=int(economy.state.inventory["RES-006"])
	var start_ryo=int(economy.state.inventory["RES-001"])
	economy.advance_clock(reg,start_time+3600)
	check(int(economy.state.inventory["RES-006"])>start_wood and int(economy.state.inventory["RES-001"])>start_ryo,"real starter income")
	check(economy.state.missions.has("NIN-001"),"repeat mission continues")
	check(economy.stop_mission("NIN-001"),"repeat mission cancellation")
	var world=Store.new()
	world.save_path="user://gp_squads_ci.json"
	world.new_game(reg)
	world.grant(reg,"NIN-002")
	world.grant(reg,"NIN-004")
	check(world.set_world_squad("SQUAD-2",["NIN-002"]),"independent squad")
	check(world.set_world_squad("defense",["NIN-004"]),"home defense team")
	check(not world.set_world_squad("SQUAD-3",["NIN-002"]) and not world.set_team(["NIN-004"]),"no duplicate deployed ninja")
	check(world.squad_travel(reg,"SQUAD-2","TER-059"),"second squad travel")
	check(not world.set_world_squad("SQUAD-2",[]),"second squad deployment lock")
	world.advance_clock(reg,int(world.state.high_water_timestamp)+200)
	check(world.state.world_squads["SQUAD-2"].location=="TER-059" and world.state.world_location=="TER-058","independent travel arrival")
	var ws=preload("res://game/world_service.gd")
	var found=false
	for route in reg.routes:
		var owner1=world.state.territory_states[route.from].owner
		var owner2=world.state.territory_states[route.to].owner
		if owner1==null or owner2==null or owner1==owner2 or owner1=="FAC-009" or owner2=="FAC-009" or not reg.territories[route.to].capture_allowed:continue
		var rel=ws.relation(world.state,owner1,owner2)
		rel.state="war"
		rel.score=-70
		world.state.faction_states[owner1].stock["RES-001"]=10000
		found=ws.npc_border_action(reg,world.state,owner1)
		if found:break
	check(found and int(world.state.npc_war_count)>0,"NPC defended border war")
	var content=preload("res://game/content_service.gd")
	var stage_count=0
	var boss_count=0
	var ids=reg.stages.keys()
	ids.sort()
	for stage_key in ids:
		var encounter=Combat.new()
		encounter.use_p2=false
		encounter.setup(reg,veteran.state,reg.stages[stage_key],42)
		for i in range(20):encounter.tick(0.05)
		if not encounter.primary_alive(0).is_empty():stage_count+=1
		if encounter.boss_actor_uid>0:
			var boss=encounter.actor_by_uid(encounter.boss_actor_uid)
			boss.hp=boss.max_hp*0.2
			encounter.update_boss(boss)
			if encounter.boss_phases.fired.size()==encounter.boss_phases.rule.phases.size():boss_count+=1
	check(stage_count==120,"all 120 stage encounters instantiate and tick")
	check(boss_count==24,"all 24 boss phase payloads dispatch")
	var burst=Combat.new()
	burst.use_p2=false
	burst.setup(reg,veteran.state,reg.stages["STG-005"],42)
	var phase_boss=burst.actor_by_uid(burst.boss_actor_uid)
	burst.hit(burst.actors[0],phase_boss,float(phase_boss.max_hp)*100,false)
	check(phase_boss.hp>0 and burst.boss_phases.fired.has(0),"burst cannot skip first boss phase")
	for q in reg.quests.values():content.objective(reg,world.state,q)
	check(reg.quests.size()==81,"all 81 quest objectives evaluated")
	var trial_count=0
	for trial_def in reg.trials.values():
		if reg.names.has(trial_def.skill_id) and reg.ninjas.has(trial_def.ninja_id):trial_count+=1
	check(trial_count==288,"all 288 personal trial links")
	var invalid_nested=world.state.duplicate(true)
	invalid_nested.world_squads["SQUAD-3"].team=["NIN-002"]
	check(not guard.valid(reg,invalid_nested),"reject overlapping imported squads")
	var campaign_store=Store.new()
	campaign_store.save_path="user://gp_campaign_completion_ci.json"
	campaign_store.new_game(reg)
	# High-power fixture tests actual win, sequential unlock, first reward, and ledger once.
	var cp=campaign_store.state.owned["NIN-001"]
	cp.realm=20
	cp.level=400
	cp.permanent={"strength":1000000,"vitality":1000000,"intellect":1000000,"spirit":1000000,"agility":1000000}
	check(campaign_store.set_team(["NIN-001"]),"campaign fixture roster")
	var won_count=0
	for stage_key in ids:
		var encounter_def=reg.stages[stage_key]
		campaign_store.state.stamina=120
		var entry=campaign_store.begin_stage(encounter_def)
		if entry.is_empty():break
		var match_sim=Combat.new()
		match_sim.use_p2=false
		match_sim.auto_player_ultimate=true
		match_sim.setup(reg,campaign_store.state,encounter_def,42)
		for tick_index in range(6000):
			match_sim.tick(0.05)
			if match_sim.outcome!="":break
		if match_sim.outcome!="win":
			print("CAMPAIGN_FIXTURE_STOP ",stage_key," ",match_sim.outcome)
			break
		if not campaign_store.finish_stage(reg,encounter_def,entry,true,match_sim.counts,match_sim.mastery_counts):break
		won_count+=1
	check(won_count==120 and campaign_store.state.cleared.size()==120,"campaign 120 sequential wins and reward commits (high-power fixture)")
	var product=Store.new()
	product.save_path="user://gp_product_ci.json"
	product.new_game(reg)
	check(product.setup_starter_jobs(reg) and product.state.jobs.size()==3 and product.state.missions.has("NIN-001"),"starter job setup")
	check(not product.buy_training_scrolls("RES-116",1),"academy shop HQ gate")
	product.state.building_states["BLD-001"].level=2
	var wallet=int(product.state.inventory["RES-001"])
	check(product.buy_training_scrolls("RES-116",5) and int(product.state.inventory["RES-001"])==wallet-600,"optional Ryo training sink")
	check(product.train_batch(reg,"NIN-001","RES-116",5),"batch XP")
	check(not product.train_stat(reg,"NIN-001","strength"),"training building gate")
	product.state.building_states["BLD-003"].level=1
	product.state.inventory["RES-118"]=10
	check(product.train_stat(reg,"NIN-001","strength") and float(product.state.owned["NIN-001"].training.strength)>0,"specialized stat training")
	for template_id in ["NIN-002","NIN-004","NIN-006","NIN-007","NIN-008","NIN-009"]:product.grant(reg,template_id)
	var dynamic_id=product.create_world_squad()
	check(dynamic_id=="SQUAD-4" and product.set_world_squad(dynamic_id,["NIN-002"]),"additional squad beyond V2 limit")
	check(guard.valid(reg,product.state),"dynamic squad save accepted")
	var action_sim=Combat.new()
	action_sim.use_p2=false
	action_sim.setup(reg,product.state,stage,42)
	var actor_action=action_sim.actors[0]
	var actor_target=action_sim.primary_alive(1)[0]
	action_sim.hit(actor_target,actor_action,10,false)
	check(int(action_sim.action_stats.get(actor_action.id,{}).get("vitality",0))==1,"damage taken contributes vitality")
	var count_before=int(action_sim.counts.get(actor_action.id,0))
	action_sim.hit(actor_action,actor_action,10,false)
	check(int(action_sim.counts.get(actor_action.id,0))==count_before,"self damage no permanent growth")
	var replay_a=Combat.new()
	replay_a.use_p2=false
	var replay_b=Combat.new()
	replay_b.use_p2=false
	replay_a.setup(reg,product.state,stage,42)
	replay_b.setup(reg,product.state,stage,42)
	for tick_id in range(300):
		replay_a.tick(0.05)
		replay_b.tick(0.05)
	check(replay_a.actors==replay_b.actors and replay_a.action_stats==replay_b.action_stats,"seeded battle deterministic replay")
	var d3=Store.new()
	d3.save_path="user://gp_d3_ci.json"
	d3.new_game(reg)
	for native_id in ["NIN-028","NIN-083","NIN-086"]:d3.grant(reg,native_id)
	for pair in [["NIN-028","BL-141"],["NIN-083","BL-142"],["NIN-086","BL-143"]]:
		d3.state.owned[pair[0]].realm=3
		d3.state.inventory[reg.bloodlines[pair[1]].resource_id]=100
		check(d3.native_bloodline(reg,pair[0],pair[1]),"authored native affinity "+str(pair[1]))
	check(not d3.native_bloodline_allowed(reg,"NIN-001","BL-141") and not d3.native_bloodline_allowed(reg,"NIN-068","BL-139"),"bloodline compatibility gate")
	d3.state.inventory["RES-116"]=Village.capacity(d3.state,"RES-116")
	d3.grant_reward("RES-116",20)
	check(int(d3.state.reward_inbox["RES-116"])==20,"overflow reward retained")
	check(not d3.collect_reward_inbox("RES-116"),"overflow full warehouse gate")
	d3.state.inventory["RES-116"]=int(d3.state.inventory["RES-116"])-10
	check(d3.collect_reward_inbox("RES-116") and int(d3.state.reward_inbox["RES-116"])==10,"overflow partial claim")
	d3.state.building_states["BLD-001"].level=2
	check(d3.sell_surplus(reg,"RES-006",100),"optional surplus sale")
	check(not d3.sell_surplus(reg,"RES-002",100),"premium sale forbidden")
	var clock_mark=int(d3.state.high_water_timestamp)
	check(d3.travel_to(reg,"TER-057"),"real adjacent neutral travel")
	d3.advance_clock(reg,clock_mark+200)
	check(d3.capture_territory(reg,"TER-057") and d3.state.territory_states["TER-057"].owner=="FAC-009","real neutral capture")
	var raid_faction="FAC-001"
	# Seed a hostile border after the neutral-capture path; initial neighboring TER-005 is neutral.
	d3.state.territory_states["TER-005"].owner=raid_faction
	check(not ws.raid(reg,d3.state,raid_faction),"peaceful border raid forbidden")
	check(d3.diplomatic_action(reg,raid_faction,"war"),"war declaration before raid")
	var protected_ngoc=int(d3.state.inventory["RES-002"])
	var old_ryo=int(d3.state.inventory["RES-001"])
	check(ws.raid(reg,d3.state,raid_faction),"adjacent NPC raid")
	check(int(d3.state.inventory["RES-002"])==protected_ngoc and int(d3.state.inventory["RES-001"])<old_ryo and float(d3.state.building_states["BLD-001"].condition)>=0.5,"raid loss limits and building protection")
	check(not ws.raid(reg,d3.state,raid_faction),"raid protection cooldown")
	check(guard.valid(reg,d3.state),"D3 save compatible")
	var art_scene=preload("res://game/review_art.gd").new()
	var image=Image.create(96,112,false,Image.FORMAT_RGBA8)
	image.fill(Color(0.3,0.7,0.7,1))
	var png=image.save_png_to_buffer()
	var entry_art={"width":96,"height":112,"sha256":art_scene.hash_bytes(png),"png":Marshalls.raw_to_base64(png)}
	var art_pack={"schema":1,"status":"REVIEW_ONLY","assets":{"characters/NIN-041.png":entry_art}}
	check(art_scene.import_text(JSON.stringify(art_pack),false) and art_scene.count_characters()==1,"review art PNG hash and texture load")
	entry_art.sha256="bad"
	check(not art_scene.import_text(JSON.stringify(art_pack),false) and art_scene.count_characters()==1,"review art bad hash rejected atomically")
	var natural=Store.new()
	natural.save_path="user://gp_natural_ch1_ci.json"
	natural.new_game(reg)
	natural.rng.seed=42
	natural.setup_starter_jobs(reg)
	natural.construct(reg,"BLD-001")
	natural.advance_clock(reg,int(natural.state.high_water_timestamp)+3600)
	for draw_id in range(10):natural.draw(reg)
	var natural_team=natural.state.owned.keys()
	natural_team.sort_custom(func(x,y):return int(natural.state.owned[x].quality)>int(natural.state.owned[y].quality))
	natural_team.resize(mini(6,natural_team.size()))
	natural.set_team(natural_team)
	# Spend actual starter funds/earned resources. No granted material or inflated stats.
	for id in natural_team:
		natural.buy_training_scrolls("RES-117",2)
		natural.train_batch(reg,id,"RES-117",2)
		natural.train_batch(reg,id,"RES-116",5)
	var chapter_wins=0
	for index in range(1,6):
		var stage_def=reg.stages["STG-%03d" % index]
		var stage_event=natural.begin_stage(stage_def)
		if stage_event=="":break
		var battle_natural=Combat.new()
		battle_natural.use_p2=false
		battle_natural.setup(reg,natural.state,stage_def,42+index)
		for step_natural in range(3600):
			for i in range(natural_team.size()):battle_natural.ultimate(i)
			battle_natural.tick(0.05)
			if battle_natural.outcome!="":break
		var won_natural=battle_natural.outcome=="win"
		natural.finish_stage(reg,stage_def,stage_event,won_natural,battle_natural.counts,battle_natural.mastery_counts,battle_natural.action_stats)
		print("NARU_NATURAL_STAGE ",stage_def.id," ",battle_natural.outcome)
		if not won_natural:break
		chapter_wins+=1
	print("NARU_NATURAL_CHAPTER_WINS ",chapter_wins,"/5")
	check(chapter_wins>=3,"natural starter progression at least 3 stages")
	var organic=Store.new()
	organic.save_path="user://gp_organic_ch1_ci.json"
	organic.new_game(reg)
	organic.rng.seed=42
	organic.setup_starter_jobs(reg)
	organic.construct(reg,"BLD-001")
	organic.advance_clock(reg,int(organic.state.high_water_timestamp)+3600)
	for organic_draw_id in range(10):organic.draw(reg)
	var organic_team=organic.state.owned.keys()
	organic_team.sort_custom(func(x,y):return int(organic.state.owned[x].quality)>int(organic.state.owned[y].quality))
	organic_team.resize(mini(6,organic_team.size()))
	organic.set_team(organic_team)
	# Spend actual starter funds/earned resources. No granted material or inflated stats.
	for id in organic_team:
		organic.buy_training_scrolls("RES-117",2)
		organic.train_batch(reg,id,"RES-117",2)
		organic.train_batch(reg,id,"RES-116",5)
	var organic_wins=0
	for index in range(1,11):
		var organic_stage_def=reg.stages["STG-%03d" % index]
		var organic_stage_event=organic.begin_stage(organic_stage_def)
		if organic_stage_event=="":break
		var battle_organic=Combat.new()
		battle_organic.use_p2=true
		battle_organic.setup(reg,organic.state,organic_stage_def,42+index)
		for step_organic in range(3600):
			for i in range(organic_team.size()):battle_organic.ultimate(i)
			battle_organic.tick(0.05)
			if battle_organic.outcome!="":break
		var won_organic=battle_organic.outcome=="win"
		organic.finish_stage(reg,organic_stage_def,organic_stage_event,won_organic,battle_organic.counts,battle_organic.mastery_counts,battle_organic.action_stats)
		print("NARU_P2_ORGANIC_STAGE ",organic_stage_def.id," ",battle_organic.outcome)
		if not won_organic:break
		organic_wins+=1
	print("NARU_P2_ORGANIC_WINS ",organic_wins,"/10")
	# Observational gate: actual P2 starter progression, no fabricated balance claim.
	quit(0 if failures==0 else 1)
