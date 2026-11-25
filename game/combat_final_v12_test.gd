extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Combat=preload("res://game/combat.gd")
const Passive=preload("res://game/passive_service.gd")
const Art=preload("res://game/review_art.gd")
const Snapshot=preload("res://game/combat_stat_snapshot.gd")
var failed=0
var reg
var applied={}
var typed={}
var proc={}
var activated={}
var form_effects={}
var combos={}
var eligible={}
func check(ok: bool,label: String) -> void:
	if ok:print("FINAL_V12_OK ",label)
	else:failed+=1;push_error("FINAL_V12_FAIL "+label)
func collect(sim) -> void:
	for id in sim.passive_applied_ledger:applied[id]=sim.passive_applied_ledger[id]
	for id in sim.passive_receipts:proc[id]=true
	for r in sim.typed_passive_effects.values():typed[r.id]=r
	for id in sim.form_receipts:activated[id]=true
	for id in sim.form_effect_evidence:form_effects[id]=sim.form_effect_evidence[id]
	for id in sim.combo_receipts:combos[id]=sim.combo_evidence.get(id,{})
func new_fight(seed_value: int,environment: String="forest"):
	var sim=Combat.new()
	sim.registry=reg
	sim.use_depth=true
	sim.use_p2=true
	sim.use_tactical=true
	sim.use_passives=true
	sim.use_contract_v10=true
	sim.load_combat_contracts()
	sim.rng.seed=seed_value
	sim.environment=environment
	sim.side_formations={0:"FRM-03",1:"FRM-04"}
	sim.side_levels={0:10,1:10}
	sim.configure_terrain()
	return sim
func progress(id: String,stars: int,grade: int,form_ids: Array) -> Dictionary:
	var n=reg.ninjas[id]
	var passives={}
	var skills={}
	for row in reg.passives_by_ninja.get(id,[]):
		var branch=""
		if grade>=3 and not row.progression.branches.is_empty():branch=row.progression.branches[int(stars/5)%2].id
		passives[row.id]={"grade":grade,"level":20,"branch":branch,"mastery":0}
	for skill_id in n.skills+n.additional_skill_ids:
		var branch=""
		var candidate=str(skill_id)+"-B"+str(1 if stars<10 else 2)
		if grade>=3 and reg.depth_exact_branches.has(candidate):branch=candidate
		skills[skill_id]={"grade":grade,"level":20,"branch":branch}
	return {"realm":7,"stars":stars,"forms":form_ids,"unlocked_skills":n.additional_skill_ids,"passive_progress":passives,"skill_levels":skills}
func run_fight(sim,steps: int,manual: bool=true) -> void:
	for step in range(steps):
		if manual and step%20==0:
			for i in range(sim.actors.size()):
				var a=sim.actors[i]
				if a.side!=0 or a.summon or a.hp<=0:continue
				if not sim.ultimate_requests.has(a.uid):sim.ultimate(i)
				for form in a.forms:
					if sim.form_ready(a,form,true):
						sim.activate_form(a,form,true)
						break
		sim.tick(0.05)
		if sim.outcome!="":break
	collect(sim)
func art_check() -> void:
	var art=Art.new()
	art.load_move_contract()
	check(art.review_move_r3.size()==6,"six R3 JSON anchors accepted")
	check(art.valid_anchor(JSON.parse_string("[48,104]")) and not art.valid_anchor([48,105]) and not art.valid_anchor(["48",104]),"numeric pivot only")
	for clip in art.review_move_r3.values():
		var seen={}
		for ms in range(0,800,50):seen[art.frame_at(clip.frames,ms,true)]=true
		check(seen.size()==8 and art.frame_at(clip.frames,900,false)==7,"eight actual frame indices "+str(clip.id))
	# Synthetic 96×112 PNG is an importer security fixture, never a game art asset.
	var img=Image.create(96,112,false,Image.FORMAT_RGBA8)
	img.fill(Color(0.2,0.3,0.4,1))
	var png=img.save_png_to_buffer()
	var sha=art.hash_bytes(png)
	var pack={"schema":1,"status":"REVIEW_ONLY","assets":{"animation/NIN-041/idle_se.png":{"width":96,"height":112,"sha256":sha,"png":Marshalls.raw_to_base64(png)}},"clips":{"animation/NIN-041/idle_se.png":{"anchor":[48,104],"sha256":sha,"frames":[{"rect":[0,0,96,112],"duration_ms":140}]}}}
	check(art.import_text(JSON.stringify(pack),false),"private clip metadata import")
	pack.assets["animation/NIN-041/idle_se.png"].sha256="tampered"
	check(not art.import_text(JSON.stringify(pack),false) and art.textures.size()==1,"tampered hash preserves prior pack")
func _initialize() -> void:
	reg=Registry.new()
	if not reg.load_all():quit(1);return
	art_check()
	check(reg.p2_fallback.has("NIN-006-S7") and reg.p2_fallback.has("NIN-016-S7"),"era HOLD preserved")
	var ids=reg.ninjas.keys()
	ids.sort()
	var enemies=["NIN-001","NIN-002","NIN-003","NIN-016","NIN-070","NIN-068"]
	# Every roster identity participates in normal combat; observation horizon is QA only.
	for batch in range(12):
		var sim=new_fight(12000+batch,["forest","desert","cave"][batch%3])
		var stars=[1,5,10,15][batch%4]
		var grade=[1,3,5][batch%3]
		for i in range(12):
			var id=str(ids[batch*12+i])
			sim.add_actor(id,0 if i<6 else 1,160,4,{},i%6,1.0,progress(id,stars,grade,reg.ninjas[id].form_ids))
			var a=sim.actors.back()
			for row in reg.passives_by_ninja.get(id,[]):
				if Passive.eligible(sim,a,row):eligible[row.id]=true
		run_fight(sim,600)
		print("NARU_V12_ROSTER ",batch," outcome=",sim.outcome if sim.outcome!="" else "OBSERVED_ONLY"," ticks=",sim.ticks," actual_mod_ids=",sim.passive_applied_ledger.size()," stats=",sim.runtime_metrics)
	# Focused real form routes, normal CP regen, no synthetic activation or cooldown skip.
	for form in reg.p2_forms:
		var contract=reg.p2_forms[form]
		var route=reg.form_rules[form]
		var id=str(route.ninja_id)
		var sim=new_fight(13000+activated.size(),"forest")
		var p=progress(id,10,3,[form])
		sim.add_actor(id,0,160,4,{},0,1.0,p)
		sim.add_actor("NIN-003",1,160,4,{},0,1.0,progress("NIN-003",10,3,[]))
		for step in range(500):
			if step%20==0:
				var a=sim.actors[0]
				if sim.form_ready(a,form,true):sim.activate_form(a,form,true)
				var route_record=sim.form_routes_dev.get(form,{})
				for r in route_record.get("skill_routes",[]):
					if r.id in a.skills and reg.depth_ultimates.has(r.id) and not sim.ultimate_requests.has(a.uid):sim.ultimate_skill(0,r.id)
			sim.tick(0.05)
			if sim.outcome!="":break
		collect(sim)
		print("NARU_V12_FORM ",form," activated=",sim.form_receipts.has(form)," empowered_effect=",sim.form_effect_evidence.has(form))
	# Six remaining signature combinations, no injected receipts. Two ordinary scenarios.
	for id in ["COMBO-001","COMBO-003","COMBO-004","COMBO-005","COMBO-010","COMBO-012"]:
		var contract=reg.read_json("res://data/skill-depth-v5/combo-contracts.json").filter(func(row):return row.id==id)[0]
		for attempt in range(2):
			var sim=new_fight(14000+int(id.right(3))*10+attempt,["forest","desert"][attempt])
			var roster=contract.members.duplicate()
			for extra in ["NIN-055","NIN-043","NIN-007","NIN-093","NIN-021","NIN-022"]:
				if roster.size()>=6:break
				if not extra in roster:roster.append(extra)
			for side in [0,1]:
				for i in range(6):
					var ninja=str(roster[i] if side==0 else enemies[i])
					sim.add_actor(ninja,side,160,4,{},i,1.0,progress(ninja,5 if attempt==0 else 10,3,reg.ninjas[ninja].form_ids))
			for step in range(1000):
				if step%20==0:
					for i in range(6):
						var a=sim.actors[i]
						for sig in contract.signature_events:
							if a.id==sig.actor_id and reg.depth_ultimates.has(sig.skill_id) and not sim.ultimate_requests.has(a.uid):sim.ultimate_skill(i,sig.skill_id)
				sim.tick(0.05)
				if sim.outcome!="":break
			collect(sim)
			print("NARU_V12_COMBO ",id," seed=",attempt," actual=",sim.combo_evidence.get(id,{})," outcome=",sim.outcome if sim.outcome!="" else "OBSERVED_ONLY")
			if sim.combo_receipts.has(id):break
	# Permanent preview and actual actor parity, including beast snapshot if attached.
	var id="NIN-041"
	var p=progress(id,15,3,[])
	p.level=160
	p.quality=4
	p.permanent={"strength":12,"vitality":7}
	p.allocated={"strength":17}
	p.training={"vitality":11}
	p.specialization={"accuracy":9}
	var snap=Snapshot.player(reg,reg.ninjas[id],p,{}, {},true)
	var sim=new_fight(15000)
	sim.add_actor(id,0,160,4,p.permanent,0,1.0,p)
	check(snap.stats==sim.actors[0].stats,"permanent preview matches pre-passive combat snapshot")
	var unobserved=eligible.keys().filter(func(k):return not applied.has(k) and not typed.has(k))
	print("NARU_V12_LEDGER eligible=",eligible.size()," actual_stat=",applied.size()," typed=",typed.size()," event=",proc.size()," unobserved=",unobserved)
	print("NARU_V12_FORMS activated=",activated.keys()," empowered=",form_effects.keys())
	print("NARU_V12_COMBOS actual=",combos.keys())
	campaign_probe()
	var out={"eligible":eligible.keys(),"stat_effect":applied,"typed_effect":typed,"event_only":proc.keys(),"unobserved":unobserved,"forms_activated":activated.keys(),"forms_empowered":form_effects,"combos":combos}
	var file=FileAccess.open("user://combat_v12_ledger.json",FileAccess.WRITE)
	if file!=null:file.store_string(JSON.stringify(out,"  "));file.close()
	print("NARU_FINAL_V12_PASS" if failed==0 else "NARU_FINAL_V12_FAIL")
	quit(0 if failed==0 else 1)

func campaign_probe() -> void:
	# DEV diagnostic with authored NPCs and level-matched test roster, not earned progression.
	for stage_id in ["STG-060","STG-065","STG-070","STG-080","STG-100","STG-120"]:
		var stage=reg.stages[stage_id]
		var level=int(reg.npcs[stage.enemy_ids[0]].level)
		var team=["NIN-041","NIN-042","NIN-043","NIN-004","NIN-060","NIN-093"]
		var owned={}
		for id in team:
			var p=progress(id,5,3,[])
			p.realm=floori(float(level-1)/20.0)
			p.level=level
			p.quality=4
			p.permanent={}
			p.forms=reg.ninjas[id].form_ids.filter(func(form):return int(reg.form_rules[form].get("unlock_realm",0))<=int(p.realm))
			p.unlocked_skills=reg.ninjas[id].additional_skill_ids.filter(func(skill):return int(reg.p2_skills.get(skill,{}).get("p2",{}).get("conditions",{}).get("unlock_realm",99))<=int(p.realm))
			owned[id]=p
		var save={"team":team,"owned":owned,"gear_instances":{},"formation_id":"FRM-03","formation_levels":{"FRM-03":5},"formation_slots":{},"settings":{"passives_dev":true,"depth_v5_dev":true}}
		var sim=Combat.new()
		sim.setup(reg,save,stage,16000+int(stage_id.right(3)))
		run_fight(sim,800)
		var enemy_ratio=0.0
		for a in sim.actors:
			if not a.summon and a.side==1:enemy_ratio+=float(a.hp)/maxf(1.0,float(a.max_hp))
		print("NARU_V12_STAGE_DIAG ",stage_id," authored_level=",level," result=",sim.outcome if sim.outcome!="" else "OBSERVATION_ONLY"," survivors=",sim.primary_alive(0).size(),"/",sim.primary_alive(1).size()," enemy_hp_sum=",enemy_ratio," boss_phases=",sim.boss_phases.get("fired",{})," metrics=",sim.runtime_metrics)
