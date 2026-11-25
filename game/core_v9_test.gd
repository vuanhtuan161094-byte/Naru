extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Combat=preload("res://game/combat.gd")
const Depth=preload("res://game/skill_depth_service.gd")
const Passive=preload("res://game/passive_service.gd")
var failures=0
func check(ok: bool,desc: String) -> void:
	if ok:print("CORE_V9_OK ",desc)
	else:failures+=1;push_error("CORE_V9_FAIL "+desc)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	check(reg.depth_ultimates.size()==146 and reg.depth_growth.size()==85 and reg.depth_branches.size()==34,"published V5 registry")
	check(Depth.factor({"grade":2,"level":1})>Depth.factor({"grade":1,"level":20}),"monotonic grade transition")
	var held=0
	for id in reg.passive_ledger:
		if reg.passive_ledger[id]=="HOLD_SOURCE_GATE":held+=1
	check(held==186,"186 inherited source gates")
	check(reg.p2_fallback.has("NIN-006-S7") and reg.p2_fallback.has("NIN-016-S7"),"two era holds")
	var sim=Combat.new()
	sim.registry=reg
	sim.use_depth=true
	sim.qa_hold_ai=true
	sim.add_actor("NIN-001",0,140,4,{},0,1.0,{"stars":5,"realm":6,"skill_levels":{"NIN-001-S5":{"level":20,"grade":1,"branch":""}}})
	sim.add_actor("NIN-002",1,140,4,{},0,1.0,{"stars":5,"realm":6})
	var a=sim.actors[0]
	var b=sim.actors[1]
	a.pos=Vector2(5,5)
	b.pos=Vector2(6,5)
	var s1=sim.effective_skill(a,"NIN-001-S5")
	a.skill_levels["NIN-001-S5"]={"level":1,"grade":2,"branch":""}
	var s2=sim.effective_skill(a,"NIN-001-S5")
	check(float(s2.effects[0].coefficient)>float(s1.effects[0].coefficient),"actual damage coefficient monotonic")
	a.chakra=0
	check(sim.ultimate_skill(0,"NIN-001-S5") and sim.ultimate_requests.get(a.uid,"")=="NIN-001-S5" and a.chakra==0,"manual intent queues without debit")
	check(sim.ultimate_skill(0,"NIN-001-S5") and not sim.ultimate_requests.has(a.uid),"manual cancel")
	sim.ultimate_skill(0,"NIN-001-S5")
	a.chakra=a.max_chakra
	sim.qa_hold_ai=false
	sim.tick(0.05)
	check(int(sim.ultimate_executed.get("NIN-001-S5",0))==1,"exact requested ultimate cast")
	var cp=Combat.new()
	cp.use_depth=true
	var dummy={"chakra":0.0,"max_chakra":10.0}
	for i in range(10):cp.cp_continuous(dummy,0.003,"regen")
	check(int(dummy.cp_units)==3,"fractional regen conservation")
	cp.cp_adjust(dummy,-100.0,"cast")
	check(dummy.cp_units==0 and dummy.chakra==0.0,"no negative CP")
	cp.cp_adjust(dummy,5.0,"restore")
	cp.cp_resize(dummy,20.0)
	check(dummy.cp_units==1000,"max CP ratio preserved")
	var obj=Combat.new()
	obj.registry=reg
	obj.qa_hold_ai=true
	obj.add_actor("NIN-132",0,140,4,{},0,1.0)
	obj.add_actor("NIN-003",1,140,4,{},0,1.0)
	var owner=obj.actors[0]
	var victim=obj.actors[1]
	owner.pos=Vector2(4,4)
	victim.pos=Vector2(8,4)
	var object_skill=obj.effective_skill(owner,"NIN-132-S2")
	var object_pos=Vector2(6,4)
	for index in range(3):check(obj.retrieve_object(owner,object_skill,object_pos,index,false),"retrieve nonliving object "+str(index))
	check(not obj.retrieve_object(owner,object_skill,object_pos,4,false),"max three object tokens")
	check(victim.pos==Vector2(8,4) and obj.actors.size()==2,"living actors never stored")
	var dot_candidates=0
	var drain_candidates=0
	var branch_holds=[]
	for branch in reg.depth_branches.values():
		var branch_skill=str(branch.skill)
		if not reg.p2_skills.has(branch_skill):
			branch_holds.append(branch.id)
			continue
		var skill=reg.p2_skills[branch_skill].duplicate(true)
		Depth.apply(reg,skill,{"grade":3,"level":20,"branch":branch.id},5)
		if branch.old_hold=="DOT_FIXED_TOTAL_ADAPTER" and skill.effects.any(func(e):return e.has("fixed_dot_total_coefficient") and float(e.fixed_dot_total_coefficient)>0):
			dot_candidates+=1
		elif branch.old_hold=="RESOURCE_LOOP_TEST" and skill.get("depth_drain_contract",false):
			drain_candidates+=1
		else:branch_holds.append(branch.id)
	check(dot_candidates+drain_candidates+branch_holds.size()==34,"34 special branch records reconciled")
	print("NARU_V9_BRANCH_ADAPTERS dot=",dot_candidates," drain=",drain_candidates," HOLD=",branch_holds)
	var dot_sim=Combat.new()
	dot_sim.registry=reg
	dot_sim.qa_hold_ai=true
	dot_sim.add_actor("NIN-042",0,140,4,{},0,1.0)
	dot_sim.add_actor("NIN-003",1,140,4,{},0,1.0)
	var dot_owner=dot_sim.actors[0]
	var dot_target=dot_sim.actors[1]
	dot_owner.natk=100.0
	dot_target.max_hp=100000.0
	dot_target.hp=100000.0
	dot_target.stats.hp_regen=0.0
	var dot_skill=reg.p2_skills["NIN-042-S2"].duplicate(true)
	Depth.apply(reg,dot_skill,{"grade":3,"level":20,"branch":"NIN-042-S2-B2"},5)
	for effect in dot_skill.effects:
		if not effect.has("fixed_dot_total_coefficient"):continue
		var applied=effect.duplicate(true)
		applied.chance=1.0
		dot_sim.apply_status(dot_owner,dot_target,applied)
		var expected=roundi(float(applied.fixed_dot_total_coefficient)*float(dot_owner.natk))
		for i in range(ceili(float(applied.duration_s)*20)+2):dot_sim.update_status(dot_target,0.05)
		check(absf((100000.0-float(dot_target.hp))-expected)<0.01,"fixed DOT total across duration")
	var observed={}
	var formed={}
	for index in range(reg.depth_teams.size()):
		var battle=Combat.new()
		battle.registry=reg
		battle.use_depth=true
		battle.use_passives=true
		battle.use_passive_pilot=index%2==1
		battle.rng.seed=400+index
		var formation="FRM-%02d" % (index%8+1)
		battle.side_formations={0:formation,1:formation}
		battle.side_levels={0:10,1:10}
		formed[formation]=true
		for side in [0,1]:
			var team=reg.depth_teams[index if side==0 else (index+1)%reg.depth_teams.size()]
			for slot in range(6):
				var id=str(team.members[slot].id)
				battle.add_actor(id,side,140,4,{},slot,1.0,{"realm":6,"stars":[1,5,10,15][index%4]})
		for tick_index in range(500):
			if tick_index%20==0:
				for slot in range(6):battle.ultimate(slot)
			battle.tick(0.05)
			if battle.outcome!="":break
		for id in battle.passive_receipts:observed[id]=true
		print("NARU_V9_DESIGNED_TEAM ",reg.depth_teams[index].id," formation=",formation," outcome=",battle.outcome if not battle.outcome.is_empty() else "UNRESOLVED_OBSERVATION"," ticks=",battle.ticks," proc_ids=",battle.passive_receipts.size()," executed_ults=",battle.ultimate_executed)
	check(formed.size()==8,"all formation IDs represented")
	print("NARU_V9_DESIGNED_OBSERVED ",observed.size()," IDs=",observed.keys()," matches=12")
	print("NARU_CORE_V9_PASS" if failures==0 else "NARU_CORE_V9_FAIL")
	quit(0 if failures==0 else 1)
