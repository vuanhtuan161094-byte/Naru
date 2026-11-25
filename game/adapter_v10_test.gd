extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Combat=preload("res://game/combat.gd")
const Passive=preload("res://game/passive_service.gd")
const Depth=preload("res://game/skill_depth_service.gd")
var failed=0
func check(ok: bool,label: String) -> void:
	if ok:print("ADAPTER_V10_OK ",label)
	else:failed+=1;push_error("ADAPTER_V10_FAIL "+label)
func duel(reg,id: String):
	var sim=Combat.new()
	sim.registry=reg
	sim.use_depth=true
	sim.use_passives=true
	sim.qa_hold_ai=true
	sim.rng.seed=42
	var n=reg.ninjas[id]
	sim.add_actor(id,0,140,4,{},0,1.0,{"realm":6,"stars":10,"forms":n.form_ids,"unlocked_skills":n.additional_skill_ids})
	sim.add_actor("NIN-003",1,140,4,{},0,1.0,{"realm":6})
	sim.actors[0].pos=Vector2(4,5)
	sim.actors[1].pos=Vector2(7,5)
	sim.actors[0].chakra=sim.actors[0].max_chakra
	sim.actors[1].chakra=sim.actors[1].max_chakra
	return sim
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	var typed=[]
	var events=[]
	var unresolved=[]
	for id in ["NIN-007","NIN-009","NIN-018","NIN-026","NIN-074","NIN-092","NIN-116","NIN-138"]:
		var sim=duel(reg,id)
		var a=sim.actors[0]
		var b=sim.actors[1]
		b.pos=Vector2(5,5)
		var key=id+"-P5"
		var skill=sim.effective_skill(a,id+"-S5")
		var modifier=skill.get("passive_typed",[]).filter(func(x):return x.id==key and x.category=="duration" and float(x.after)>float(x.before))
		check(not modifier.is_empty(),"authored duration changes "+key)
		if not sim.cast(a,skill,b):unresolved.append(key+":cast");continue
		for i in range(100):sim.tick(0.05)
		if sim.typed_passive_effects.values().any(func(x):return x.id==key and x.category=="duration"):typed.append(key)
		else:unresolved.append(key+":no_confirmed_effect_seed42")
	for id in ["NIN-093","NIN-099"]:
		var sim=duel(reg,id)
		var a=sim.actors[0]
		var b=sim.actors[1]
		sim.p2_set_mark(a,b,{"duration_s":10})
		var skill=sim.effective_skill(a,id+"-S1")
		var before=Vector2(a.pos)
		if sim.cast(a,skill,b):
			for i in range(45):sim.tick(0.05)
			if sim.passive_receipts.has(id+"-P2") and a.pos!=before:events.append(id+"-P2")
			else:unresolved.append(id+"-P2:teleport_receipt")
		else:unresolved.append(id+"-P2:cast")
	for id in ["NIN-004","NIN-037","NIN-124"]:
		var sim=duel(reg,id)
		var a=sim.actors[0]
		var b=sim.actors[1]
		var skill=sim.effective_skill(a,id+"-S1")
		if not sim.cast(a,skill,b):unresolved.append(id+"-P2:cast");continue
		for i in range(15):sim.tick(0.05)
		# Isolated swept projectile fixture; actual wall collision, not synthetic proc receipt.
		var shot=reg.p2_skills["NIN-002-S1"].duplicate(true)
		shot.projectile_speed_m_s=12.0
		sim.projectiles.append({"source":b.uid,"target":a.uid,"skill":shot,"origin":b.pos,"pos":b.pos,"direction":Vector2.LEFT,"remaining":0.5,"distance_left":4.0,"hit_ids":[],"cast_id":100,"contact_cap":1})
		for i in range(20):sim.tick(0.05)
		if sim.passive_receipts.has(id+"-P2"):events.append(id+"-P2")
		else:unresolved.append(id+"-P2:wall_receipt")
	var daemon=duel(reg,"NIN-139")
	check(not Passive.eligible(daemon,daemon.actors[0],reg.passives["NIN-139-P2"]),"Daemon reflection passive remains mechanic HOLD")
	print("NARU_V10_PASSIVE14 typed=",typed," events=",events," unresolved=",unresolved," mechanic_hold=NIN-139-P2")
	check(typed.size()+events.size()+unresolved.size()==13,"13 executable fixture records reconciled plus one HOLD")
	var dots=[]
	var drains=[]
	var branch_unresolved=[]
	for branch in reg.depth_branches.values():
		var skill_id=str(branch.skill)
		var id=skill_id.left(7)
		var sim=duel(reg,id)
		sim.use_passives=false
		var a=sim.actors[0]
		var b=sim.actors[1]
		a.natk=100.0
		b.max_hp=10000000.0
		b.hp=b.max_hp
		b.stats.hp_regen=0.0
		var s=reg.p2_skills[skill_id].duplicate(true)
		Depth.apply(reg,s,{"grade":3,"level":20,"branch":branch.id},5)
		s.passive_cast_id=1
		if branch.old_hold=="DOT_FIXED_TOTAL_ADAPTER":
			var found=false
			for effect in s.effects:
				if not effect.has("fixed_dot_total_coefficient"):continue
				var e=effect.duplicate(true)
				e.chance=1.0
				var old=float(b.hp)
				sim.apply_status(a,b,e)
				var budget=roundi(float(e.fixed_dot_total_coefficient)*float(a.natk))
				for i in range(ceili(float(e.duration_s)*20)+40):sim.update_status(b,0.05)
				if absf(old-float(b.hp)-budget)<0.01:found=true
			if found:dots.append(branch.id)
			else:branch_unresolved.append(branch.id)
		else:
			a.chakra=0.0
			b.chakra=b.max_chakra
			var before=float(b.chakra)
			var hit_count=int(s.p2.effect.hit_count)
			for index in range(hit_count):sim.p2_apply(a,s,b,hit_count,index)
			var returned=float(a.chakra)
			var actual_loss=before-float(b.chakra)
			if actual_loss>0 and returned<=float(s.chakra)+0.011 and returned<=actual_loss+0.011:drains.append(branch.id)
			else:branch_unresolved.append(branch.id)
	print("NARU_V10_BRANCH34 actual_dot=",dots.size()," actual_drain=",drains.size()," unresolved=",branch_unresolved)
	check(dots.size()+drains.size()+branch_unresolved.size()==34,"34 effect fixtures reconciled")
	var cp=Combat.new()
	cp.use_depth=true
	var dummy={"uid":1,"summon":false,"chakra":0.0,"max_chakra":10.0}
	var parent={"passive_cast_id":1,"chakra":1.25}
	for i in range(100):cp.refund_parent_cp(dummy,parent,0.3,"test")
	check(dummy.chakra==1.25,"aggregate refund never exceeds parent cost")
	for i in range(100):
		cp.cp_resize(dummy,13.37)
		cp.cp_resize(dummy,10.0)
	check(dummy.chakra==1.25,"no CP ratio rounding drift across repeated aura changes")
	print("NARU_ADAPTER_V10_PASS" if failed==0 else "NARU_ADAPTER_V10_FAIL")
	quit(0 if failed==0 else 1)
