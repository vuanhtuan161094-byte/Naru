extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Combat=preload("res://game/combat.gd")
const Passive=preload("res://game/passive_service.gd")
const Store=preload("res://game/save_store.gd")
const Guard=preload("res://game/save_guard.gd")
var fails=0
func check(value: bool,label: String) -> void:
	if not value:fails+=1;push_error("PASSIVE_FAIL "+label)
	else:print("PASSIVE_OK "+label)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	check(reg.passives.size()==864 and reg.passives_by_ninja.size()==144 and reg.skills.size()==1152,"864 distinct passive records and 1152 active retained")
	check(reg.synergy_active.size()==1152 and reg.synergy_passive.size()==864 and reg.synergy_links.size()==864,"2016 structural references, not runtime claims")
	check(reg.passive_pilot.size()==72 and is_equal_approx(float(reg.passives["NIN-001-P4"].effect.base),0.06),"P2 proposal not applied automatically")
	# Explicit isolated mode suppresses nonpilot kits; mixed preserves legacy fallback.
	var selector=Combat.new()
	selector.registry=reg
	selector.use_passives=true
	selector.use_passive_pilot=true
	var outside=""
	for id in reg.ninjas:
		if not reg.passive_pilot_ninjas.has(id):outside=id;break
	check(reg.passive_pilot_ninjas.size()==12 and reg.passive_pilot_rows.size()==144,"actual pilot membership distinct from mixed rows")
	check(outside!="","nonpilot roster exists")
	check(Passive.rows(selector,{"id":outside}).is_empty(),"isolated pilot unchanged")
	selector.use_passive_mixed=true
	check(Passive.rows(selector,{"id":outside}).size()==6,"mixed nonpilot P1 kit")
	check(Passive.rows(selector,{"id":"NIN-001"})==reg.passive_pilot_rows["NIN-001"],"mixed pilot retains P2 kit")
	selector.use_passive_pilot=false
	check(Passive.rows(selector,{"id":"NIN-001"})==reg.passives_by_ninja["NIN-001"],"P1 mode unaffected")
	var branches=0
	for row in reg.passives.values():branches+=row.progression.branches.size()
	check(branches==1152,"branch catalog count")
	var store=Store.new()
	store.save_path="user://passive_ci.json"
	store.new_game(reg)
	var p=store.state.owned["NIN-001"]
	check(p.passive_progress.has("NIN-001-P1") and not p.passive_progress.has("NIN-001-P2"),"starter migration realm")
	p.realm=6
	p.level=121
	Passive.migrate("NIN-001",p)
	check(p.passive_progress.size()==6,"six realm unlocks")
	store.state.inventory["RES-118"]=10000
	store.state.inventory["RES-130"]=10000
	check(store.upgrade_passive(reg,"NIN-001","NIN-001-P2"),"paid level")
	p.passive_progress["NIN-001-P2"].level=20
	p.passive_progress["NIN-001-P2"].fails=4
	check(store.advance_passive(reg,"NIN-001","NIN-001-P2")=="success","pity guarantee")
	p.passive_progress["NIN-001-P2"].grade=3
	check(store.branch_passive(reg,"NIN-001","NIN-001-P2","NIN-001-P2-B1"),"branch exclusive")
	check(not store.branch_passive(reg,"NIN-001","NIN-001-P2","NIN-001-P2-B2"),"reject branch replacement")
	check(Guard.valid(reg,store.state),"save guard")
	check(store.save_now(),"save passive progression")
	var reload=Store.new()
	reload.save_path=store.save_path
	reload.load_or_new(reg)
	check(reload.state.owned["NIN-001"].passive_progress["NIN-001-P2"].branch=="NIN-001-P2-B1","save reload")
	var sim=Combat.new()
	sim.registry=reg
	sim.use_passives=true
	sim.qa_hold_ai=true
	sim.rng.seed=42
	sim.add_actor("NIN-001",0,140,4,{},0,1.0,p)
	sim.add_actor("NIN-003",0,140,4,{},1,1.0,{"realm":6,"stars":5})
	sim.add_actor("NIN-002",1,140,4,{},0,1.0,{"realm":6,"stars":5})
	var a=sim.actors[0]
	var ally=sim.actors[1]
	var enemy=sim.actors[2]
	a.pos=Vector2(4,4)
	ally.pos=Vector2(4,6)
	enemy.pos=Vector2(7,4)
	a.hp=a.max_hp*0.5
	Passive.refresh(sim)
	check(is_equal_approx(float(a.hp)/float(a.max_hp),0.5),"HP ratio conserved")
	check(float(a.max_hp)>float(a.passive_base.max_hp),"P1 live HP")
	check(float(ally.patk)>float(ally.passive_base.patk),"P4 team aura")
	var initial=float(a.max_hp)
	Passive.refresh(sim)
	check(is_equal_approx(float(a.max_hp),initial),"immutable snapshot no accumulation")
	a.chakra=a.max_chakra
	var skill=sim.effective_skill(a,"NIN-001-S1")
	check(sim.cast(a,skill,sim.target_for(a,skill)),"real parent summon cast")
	for i in range(35):sim.tick(0.05)
	check(sim.passive_receipts.has("NIN-001-P2"),"P2 actual summon event")
	check(int(sim.passive_receipts.get("NIN-001-P2",0))==1,"one proc")
	check(a.passive_timed.has(str(a.uid)+":NIN-001-P2"),"timed event buff")
	for unit in sim.actors:
		if unit.summon:check(not unit.has("passive_base"),"summons do not inherit passive state")
	a.hp=0
	Passive.refresh(sim)
	check(a.passive_timed.is_empty(),"source death cleanup")
	var replay=[]
	for seed_value in [42,42,83]:
		var fight=Combat.new()
		fight.registry=reg
		fight.use_passives=true
		fight.rng.seed=seed_value
		for i in range(6):
			fight.add_actor("NIN-%03d" % (i+1),0,140,4,{},i,1.0,{"realm":6,"stars":5})
			fight.add_actor("NIN-%03d" % (i+7),1,140,4,{},i,1.0,{"realm":6,"stars":5})
		for i in range(1200):
			fight.tick(0.05)
			if fight.outcome!="":break
		replay.append(str(fight.outcome)+":"+str(fight.ticks)+":"+JSON.stringify(fight.passive_receipts))
		print("NARU_PASSIVE_6V6 seed=",seed_value," outcome=",fight.outcome," ticks=",fight.ticks," receipts=",fight.passive_receipts.size()," IDs=",fight.passive_receipts.keys())
	check(replay[0]==replay[1],"same-seed replay")
	var roster_seen={}
	var event_seen={}
	var stat_seen={}
	for match_index in range(12):
		var battle=Combat.new()
		battle.registry=reg
		battle.use_passives=true
		battle.rng.seed=100+match_index
		for i in range(12):
			var id="NIN-%03d" % (match_index*12+i+1)
			battle.add_actor(id,0 if i<6 else 1,140,4,{},i%6,1.0,{"realm":6,"stars":[1,5,10,15][match_index%4]})
			roster_seen[id]=true
		Passive.refresh(battle)
		for a2 in battle.actors:
			for row in reg.passives_by_ninja[a2.id]:
				if row.trigger.event=="derived_stats" and Passive.eligible(battle,a2,row) and float(a2.passive_mods.get(row.effect.key,0))>0:stat_seen[row.id]=true
		for step in range(400):
			battle.tick(0.05)
			if battle.outcome!="":break
		for id in battle.passive_receipts:event_seen[id]=true
		print("NARU_PASSIVE_ROSTER_MATCH ",match_index+1," outcome=",battle.outcome," ticks=",battle.ticks," proc_ids=",battle.passive_receipts.size())
	check(roster_seen.size()==144,"all roster identities exercised in 12 6v6 windows")
	print("NARU_PASSIVE_OBSERVED continuous_stat_presence=",stat_seen.size()," actual_event_receipts=",event_seen.size()," event_ids=",event_seen.keys()," windows=12")
	print("NARU_PASSIVE_PASS" if fails==0 else "NARU_PASSIVE_FAIL")
	quit(0 if fails==0 else 1)
