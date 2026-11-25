extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Combat=preload("res://game/combat.gd")
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
	full.apply_status(source,target,{"status_id":"stun","chance":1.0,"duration_s":0.1})
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
	equipped.setup(reg,store.state,stage,42)
	check(float(equipped.actors[0].gear_stats.get("hp",0))>10,"gear stats affect combat")
	var persisted=Store.new()
	persisted.save_path=store.save_path
	persisted.load_or_new(reg)
	check(persisted.state.gear_instances[gear_id].owner=="NIN-001","gear reload")
	check(equipped.actors[0].stats.size()==48,"48 typed stats")
	check(not store.unlock_form(reg,"NIN-001","NIN-001-F1"),"form realm gate")
	p.realm=3
	store.state.inventory["RES-127"]=20
	check(store.unlock_form(reg,"NIN-001","NIN-001-F1"),"unlock form transaction")
	var form_sim=Combat.new()
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
	shield_sim.setup(reg,store.state,stage,42)
	var a1=shield_sim.actors[0]
	var a2=shield_sim.actors[1]
	shield_sim.add_shield(a1,a1,30,2)
	shield_sim.add_shield(a2,a1,20,4)
	shield_sim.add_shield(a1,a1,10,1)
	check(is_equal_approx(float(a1.shield),50),"shield per source max")
	shield_sim.update_status(a1,2.1)
	check(is_equal_approx(float(a1.shield),20),"shield independent expiry")
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
		for skill_id in reg.ninjas[id].skills+reg.ninjas[id].additional_skill_ids:
			var run=Combat.new()
			run.registry=reg
			run.rng.seed=42
			run.add_actor(id,0,20,int(reg.ninjas[id].initial_quality),{},0,1.0,{"forms":reg.ninjas[id].form_ids,"unlocked_skills":reg.ninjas[id].additional_skill_ids})
			run.add_actor("NIN-001",1,20,2,{},0,1.0)
			var attacker=run.actors[0]
			var defender=run.actors[1]
			defender.pos=attacker.pos+Vector2(1,0)
			attacker.chakra=attacker.max_chakra
			var skill=run.effective_skill(attacker,skill_id)
			var selected=run.target_for(attacker,skill)
			run.release(attacker,skill,selected)
			dispatch_count+=run.effect_dispatch_count
			if run.effect_dispatch_count>0:tested+=1
	check(tested==1152 and dispatch_count>=1152,"all 1152 authored skills dispatch effects")
	for beast_id in reg.beasts:
		var beast_sim=Combat.new()
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
	quit(0 if failures==0 else 1)
