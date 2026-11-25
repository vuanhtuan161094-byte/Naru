extends RefCounted
# Published PASSIVE-P1 contract. Opt-in DEV; never casts or spends chakra.
const REALMS=[0,1,2,3,4,6]
const DEFAULT={"level":1,"grade":1,"fails":0,"branch":"","mastery":0}
const EVENTS=["derived_stats","continuous_aura","hp_threshold_crossed","chakra_threshold_crossed","critical_hit_confirmed","hostile_damage_confirmed","damage_taken_confirmed","kill_confirmed","heal_confirmed","cleanse_effective","summon_spawned","form_activated","status_applied","stance_effect_confirmed","resource_effect_confirmed","contact_or_effect_confirmed","mark_effect_confirmed","before_skill_effect","while_form_active","before_combo_payload","wall_blocked","teleport_arrived","counter_triggered"]
const TYPES=["stat_relative_bonus","stat_relative_penalty","incoming_damage_reduction","received_heal_bonus","skill_cp_discount","skill_effect_bonus","form_skill_coefficient_bonus","summon_hp_fraction_bonus","combo_payload_bonus","skill_status_duration_bonus"]
static func gate(row: Dictionary) -> String:
	if row.source.inherited_source_policy=="PRESERVE_P2_P3_GATE":return "HOLD_SOURCE_GATE"
	if not row.trigger.event in EVENTS:return "HOLD_EVENT"
	if not row.effect.type in TYPES:return "HOLD_TYPED_EFFECT"
	return "DEV_CANDIDATE"

static func migrate(id: String,p: Dictionary) -> void:
	if not p.has("passive_progress"):p.passive_progress={}
	for i in range(6):
		var key=id+"-P"+str(i+1)
		if int(p.realm)>=REALMS[i] and not p.passive_progress.has(key):p.passive_progress[key]=DEFAULT.duplicate(true)

static func progress(p: Dictionary,id: String) -> Dictionary:
	return p.get("passive_progress",{}).get(id,DEFAULT).duplicate(true)

static func potency(row: Dictionary,p: Dictionary,stars: int) -> float:
	var sk=progress(p,row.id)
	var factor=1.0+0.50*(int(sk.grade)-1)+0.02*(int(sk.level)-1)
	var bonus=0.06 if stars>=15 else 0.04 if stars>=10 else 0.02 if stars>=5 else 0.0
	var op=operation(row,p)
	var multiplier=float(op.get("multiplier",1.0)) if op.get("field","")=="effect.magnitude" else 1.0
	return float(row.effect.base)*(1.0+0.40*(factor-1.0)/factor+bonus)*multiplier

static func operation(row: Dictionary,p: Dictionary) -> Dictionary:
	for br in row.progression.branches:
		if br.id==progress(p,row.id).branch and int(progress(p,row.id).grade)>=int(br.grade):return br.operation
	return {}

static func rows(sim,a: Dictionary) -> Array:
	return sim.registry.passive_pilot_rows.get(a.id,[]) if sim.use_passive_pilot else sim.registry.passives_by_ninja.get(a.id,[])

static func eligible(sim,a: Dictionary,row: Dictionary) -> bool:
	# The Daemon reflection-dependent passive is not proved by legacy generic counter fallback.
	if row.id=="NIN-139-P2" and sim.registry.p2_fallback.has("NIN-139-S1"):return false
	return sim.use_passives and a.has("passive_base") and a.hp>0 and not a.get("beast",false) and not a.summon and int(a.realm)>=int(row.unlock.realm) and sim.registry.passive_ledger.get(row.id,"")=="DEV_CANDIDATE" and not str(sim.registry.p2_fallback.get(row.source.signature_id,"")).begins_with("HOLD") and not (sim.registry.synergy_gaps.get(row.id,"")=="FORM_ZERO_PAYLOAD_REVIEW")

static func attach(a: Dictionary,p: Dictionary) -> void:
	a.stars=int(p.get("stars",1))
	a.passive_progress=p.get("passive_progress",{}).duplicate(true)
	a.passive_base={"stats":a.stats.duplicate(true),"max_hp":a.max_hp,"max_chakra":a.max_chakra,"patk":a.patk,"natk":a.natk,"armor":a.armor,"nres":a.nres,"regen":a.regen}
	a.passive_mods={}
	a.passive_timed={}
	a.passive_icd={}
	a.passive_rearm={}

static func recipients(sim,a: Dictionary,row: Dictionary,target: Dictionary={}) -> Array:
	var scope=str(row.target.scope)
	if scope=="self":return [a]
	if scope=="hit_primary_enemy":
		return [target] if not target.is_empty() and target.hp>0 and target.side!=a.side and not target.summon and not target.get("beast",false) else []
	if scope=="combo":return []
	var result=[]
	var side=1-int(a.side) if scope=="enemy_team" else int(a.side)
	var radius=float(row.target.get("radius_m",0)) if scope=="radius" else 0.0
	var op=operation(row,a)
	if scope=="radius" and op.get("field","")=="radius_m":radius=minf(float(op.get("max",5)),radius*float(op.multiplier))
	for b in sim.alive(side):
		if not b.has("passive_base") or b.get("beast",false) or (b.uid==a.uid and not row.target.get("include_owner",true)):continue
		if scope=="radius" and a.pos.distance_to(b.pos)>radius:continue
		if scope=="family" and sim.registry.ninjas[b.id].get("family_hint",null)!=row.target.filter:continue
		if scope=="element" and not row.target.filter in sim.registry.ninjas[b.id].chakra_elements:continue
		result.append(b)
	result.sort_custom(func(x,y):return int(x.uid)<int(y.uid))
	return result.slice(0,mini(6,int(row.target.get("max_primary_targets",6))))

static func aggregate(bucket: Dictionary,key: String,value: float,strongest: bool) -> void:
	bucket[key]=maxf(float(bucket.get(key,0)),value) if strongest else float(bucket.get(key,0))+value

static func refresh(sim) -> void:
	if not sim.use_passives:return
	var buckets={}
	for a in sim.actors:
		if a.has("passive_base"):buckets[a.uid]={"personal":{},"aura":{},"team":{},"negative":{}}
	for a in sim.actors:
		if not buckets.has(a.uid) or a.hp<=0:continue
		for row in rows(sim,a):
			if not eligible(sim,a,row):continue
			var event=str(row.trigger.event)
			if not event in ["derived_stats","continuous_aura"]:
				var conditional_secondary=operation(row,a).get("secondary_effect",{})
				if event in ["before_skill_effect","while_form_active"] and not conditional_secondary.is_empty() and sim.conditional_passive_active(a,row):
					aggregate(buckets[a.uid].personal,str(conditional_secondary.key),float(conditional_secondary.base),false)
				elif event=="before_combo_payload" and not conditional_secondary.is_empty():sim.passive_secondary_holds[row.id]="COMBO_SECONDARY_DURATION_REVIEW"
				continue
			var val=potency(row,a,int(a.stars))
			for target in recipients(sim,a,row):
				if not buckets.has(target.uid):continue
				var group="aura" if event=="continuous_aura" else "personal"
				aggregate(buckets[target.uid][group],str(row.effect.key),val,group=="aura")
				if val>0:sim.passive_continuous_ledger[row.id]={"kind":event,"owner":a.uid,"target":target.uid,"value":val}
			var secondary=operation(row,a).get("secondary_effect",{})
			if not secondary.is_empty():aggregate(buckets[a.uid].personal,str(secondary.key),float(secondary.base),false)
	for a in sim.actors:
		if not buckets.has(a.uid):continue
		for key in a.passive_timed.keys():
			var effect=a.passive_timed[key]
			var owner=sim.actor_by_uid(int(effect.owner))
			if int(effect.expires)<=sim.ticks or owner.is_empty() or owner.hp<=0 or a.hp<=0:
				a.passive_timed.erase(key)
				continue
			aggregate(buckets[a.uid][effect.group],str(effect.key),float(effect.value),effect.group!="personal")
		var bucket=buckets[a.uid]
		var mods={}
		for key in sim.registry.passive_rules.caps:
			var positive=minf(float(sim.registry.passive_rules.caps[key]),float(bucket.personal.get(key,0))+float(bucket.aura.get(key,0))+float(bucket.team.get(key,0)))
			var negative=minf(float(sim.registry.passive_rules.negative_stat_relative_penalty_cap),float(bucket.negative.get(key,0)))
			mods[key]=positive-negative
		a.passive_mods=mods
		var original=a.passive_base
		for key in original.stats:
			a.stats[key]=float(original.stats[key])*(1.0+float(mods.get(key,0)) if key not in ["damage_reduction","healing_received"] else 1.0)
		for key in ["patk","natk","armor","nres"]:
			a[key]=float(original[key])*(1.0+float(mods.get(key,0)))
		a.regen=float(original.regen)*(1.0+float(mods.get("chakra_regen",0)))
		var hp_ratio=float(a.hp)/maxf(1.0,float(a.max_hp))
		a.max_hp=float(original.max_hp)*(1.0+float(mods.get("hp",0)))
		sim.cp_resize(a,float(original.max_chakra)*(1.0+float(mods.get("chakra_max",0))))
		a.hp=clampf(hp_ratio*float(a.max_hp),0,float(a.max_hp))

static func queue(sim,a: Dictionary,b: Dictionary,s: Dictionary,event: String,before: float=-1,after: float=-1) -> void:
	if not sim.use_passives or a.is_empty() or not a.has("passive_base") or a.hp<=0 or a.get("beast",false) or int(s.get("passive_cast_id",0))<=0:return
	var parent=int(s.passive_cast_id)
	var key=str(parent)+":"+str(a.uid)+":"+event
	if sim.passive_seen.has(key):return
	# Do not consume a dedup key for an ineligible target on a mixed-target parent.
	var eligible_event=false
	for row in rows(sim,a):
		if not eligible(sim,a,row) or row.trigger.event!=event:continue
		var ids=row.trigger.get("skill_ids",[])
		if not ids.is_empty() and not s.skill_id in ids:continue
		if row.target.scope in ["hit_primary_enemy","enemy_team"] and (b.is_empty() or b.side==a.side or b.summon or b.get("beast",false) or b.hp<=0):continue
		eligible_event=true
		break
	if not eligible_event:return
	if event in ["hp_threshold_crossed","chakra_threshold_crossed"]:
		var row={}
		for candidate in rows(sim,a):
			if int(candidate.slot)==3:row=candidate;break
		if row.is_empty() or row.trigger.event!=event or before<float(row.trigger.threshold) or after>=float(row.trigger.threshold):return
		if not a.passive_rearm.get(row.id,true):return
		a.passive_rearm[row.id]=false
	sim.passive_seen[key]=sim.ticks
	sim.passive_queue.append({"parent":parent,"uid":a.uid,"target":int(b.get("uid",0)),"skill":str(s.skill_id),"event":event,"tick":sim.ticks})

static func flush(sim) -> void:
	if not sim.use_passives:return
	var active={}
	for a in sim.actors:
		if not a.pending.is_empty():active[int(a.pending.cast_id)]=true
	for p in sim.projectiles:active[int(p.cast_id)]=true
	for j in sim.p2_jobs:active[int(j.cast_id)]=true
	var ready=[]
	for receipt in sim.passive_queue.duplicate():
		if active.has(int(receipt.parent)):continue
		sim.passive_queue.erase(receipt)
		var a=sim.actor_by_uid(int(receipt.uid))
		if a.is_empty() or a.hp<=0:continue
		for row in rows(sim,a):
			if not eligible(sim,a,row) or row.trigger.event!=receipt.event:continue
			var skills=row.trigger.get("skill_ids",[])
			if not skills.is_empty() and not receipt.skill in skills:continue
			var target=sim.actor_by_uid(int(receipt.target))
			if row.target.scope in ["hit_primary_enemy","enemy_team"] and (target.is_empty() or target.side==a.side or target.summon or target.get("beast",false)):continue
			if int(a.passive_icd.get(row.id,0))>sim.ticks:continue
			ready.append({"row":row,"owner":a,"target":sim.actor_by_uid(int(receipt.target))})
	ready.sort_custom(func(x,y):return int(x.owner.uid)<int(y.owner.uid) if x.row.id==y.row.id else str(x.row.id)<str(y.row.id))
	for candidate in ready:
		var a=candidate.owner
		var row=candidate.row
		if int(a.passive_icd.get(row.id,0))>sim.ticks:continue
		var targets=recipients(sim,a,row,candidate.target)
		var applied=false
		var value=potency(row,a,int(a.stars))
		var expiry=sim.ticks+roundi(float(row.duration_s)*20)
		var negative=row.effect.type=="stat_relative_penalty"
		for b in targets:
			if not b.has("passive_timed") or (negative and (b.immune>0 or sim.has_status(b,"control_immunity"))):continue
			var group="negative" if negative else "personal" if row.target.scope=="self" else "team"
			b.passive_timed[str(a.uid)+":"+str(row.id)]={"owner":a.uid,"key":row.effect.key,"group":group,"value":value,"expires":expiry,"id":row.id}
			applied=true
		if not applied:continue
		var op=operation(row,a)
		var icd=float(row.icd_s)
		if op.get("field","")=="internal_cooldown_s":icd=maxf(float(op.get("min",4)),icd*float(op.multiplier))
		var secondary=op.get("secondary_effect",{})
		if not secondary.is_empty():a.passive_timed[str(a.uid)+":"+str(row.id)+":B2"]={"owner":a.uid,"key":secondary.key,"group":"personal","value":float(secondary.base),"expires":expiry,"id":row.id}
		a.passive_icd[row.id]=sim.ticks+roundi(icd*20)
		sim.passive_receipts[row.id]=int(sim.passive_receipts.get(row.id,0))+1
		sim.passive_active_ledger[row.id]={"owner":a.uid,"value":value,"expires":expiry,"kind":row.trigger.event}
		if a.side==0:sim.passive_mastery[row.id]=1
		sim.art_event("passive_proc",a.pos,0,str(row.id))
	for a in sim.actors:
		if not a.has("passive_rearm"):continue
		var row={}
		for candidate in rows(sim,a):
			if int(candidate.slot)==3:row=candidate;break
		if row.is_empty():continue
		var ratio=float(a.hp)/maxf(1,float(a.max_hp)) if row.trigger.event=="hp_threshold_crossed" else float(a.chakra)/maxf(1,float(a.max_chakra))
		if ratio>float(row.trigger.get("rearm_above",0.4)):a.passive_rearm[row.id]=true
	for key in sim.passive_seen.keys():
		if sim.ticks-int(sim.passive_seen[key])>1200:sim.passive_seen.erase(key)
	refresh(sim)

static func typed(s: Dictionary,row: Dictionary,category: String,before: float,after: float) -> void:
	if is_equal_approx(before,after):return
	if not s.has("passive_typed"):s.passive_typed=[]
	s.passive_typed.append({"id":row.id,"category":category,"before":before,"after":after})

static func modify_skill(sim,a: Dictionary,s: Dictionary) -> void:
	if not sim.use_passives or not s.has("p2"):return
	for row in rows(sim,a):
		if not eligible(sim,a,row) or not row.trigger.event in ["before_skill_effect","while_form_active"] or not s.skill_id in row.trigger.get("skill_ids",[]):continue
		if row.trigger.event=="while_form_active":
			var form=str(a.active_form.get("id",""))
			if not form in row.trigger.form_ids or not sim.registry.p2_forms.has(form):continue
			if not sim.registry.p2_forms[form].effect.empowered_skills.any(func(e):return e.skill_id==s.skill_id):continue
		var val=potency(row,a,int(a.stars))
		match str(row.effect.type):
			"skill_cp_discount":
				var previous=float(s.chakra)
				if previous>0:s.chakra=maxf(1.0,previous*(1.0-minf(val,0.08)))
				typed(s,row,"cp",previous,float(s.chakra))
			"skill_effect_bonus","form_skill_coefficient_bonus":
				for e in s.effects:
					if e.has("coefficient") and e.type in ["damage","heal","shield"] and float(e.coefficient)>0 and (row.effect.type=="form_skill_coefficient_bonus" or e.type==row.effect.key):
						var previous=float(e.coefficient)
						e.coefficient=previous*(1.0+minf(val,0.10))
						typed(s,row,"coefficient",previous,float(e.coefficient))
			"skill_status_duration_bonus":
				for e in s.effects:
					if e.type=="apply_status" and (sim.registry.status_catalog.get(e.status_id,{}).get("hard_control",false) or str(e.status_id) in ["slow","silence","fear","beguile_tactical","bind","sleep","freeze","stun"]):
						var previous=float(e.get("duration_s",0))
						if previous>0:e.duration_s=previous*(1.0+minf(val,0.10))
						typed(s,row,"duration",previous,float(e.get("duration_s",0)))
			"summon_hp_fraction_bonus":
				for e in s.effects:
					if e.type=="summon":
						var previous=float(e.hp_owner_fraction)
						e.hp_owner_fraction=previous*(1.0+minf(val,0.10))
						typed(s,row,"summon",previous,float(e.hp_owner_fraction))

static func combo_bonus(sim,combo: Dictionary,entries: Array) -> float:
	if not sim.use_passives:return 0.0
	var value=0.0
	for entry in entries:
		var a=sim.actor_by_uid(int(entry.uid))
		if a.is_empty():continue
		for row in rows(sim,a):
			if eligible(sim,a,row) and row.effect.type=="combo_payload_bonus" and combo.id in row.effect.combo_ids:
				value=maxf(value,potency(row,a,int(a.stars)))
	return minf(value,0.08)

static func has_debuff(a: Dictionary) -> bool:
	for effect in a.get("passive_timed",{}).values():
		if effect.group=="negative":return true
	return false

static func aura_source(sim,a: Dictionary) -> bool:
	for row in rows(sim,a):
		if eligible(sim,a,row) and row.trigger.event=="continuous_aura" and recipients(sim,a,row).size()>1:return true
	return false

static func cleanse(a: Dictionary,limit: int) -> int:
	var removed=0
	for key in a.get("passive_timed",{}).keys():
		if removed>=limit:break
		if a.passive_timed[key].group=="negative":
			a.passive_timed.erase(key)
			removed+=1
	return removed
