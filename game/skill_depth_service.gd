extends RefCounted
# DEV V5 monotonic training. Old saves retain their IDs and G/L.
static func factor(p: Dictionary) -> float:
	return 1.0+0.50*(int(p.get("grade",1))-1)+0.02*(int(p.get("level",1))-1)

static func star_discount(stars: int) -> float:
	return 0.06 if stars>=15 else 0.04 if stars>=10 else 0.02 if stars>=5 else 0.0

static func apply(reg,s: Dictionary,p: Dictionary,stars: int) -> void:
	if s.kind=="basic":return
	var f=factor(p)
	var ratio=(f-1.0)/f
	var branch=str(p.get("branch",""))
	var specific=reg.depth_branches.get(branch,{})
	var exact=reg.depth_exact_branches.get(branch,{})
	if not exact.is_empty() and (exact.skill!=s.skill_id or int(p.get("grade",1))<int(exact.grade)):branch="";specific={};exact={}
	var kind=str(s.p2.effect.type) if s.has("p2") else ""
	var params=s.p2.effect.params if s.has("p2") else {}
	# B1 only strengthens existing typed payload, B2 geometry once or paid CP.
	var coefficient=f*(1.12 if branch.ends_with("-B1") and specific.is_empty() and exact.is_empty() else 1.0)
	for e in s.effects:
		match str(e.type):
			"damage","heal","shield","counter":
				if e.has("coefficient"):e.coefficient=float(e.coefficient)*coefficient
			"apply_status":
				if e.has("tick_coefficient"):e.tick_coefficient=float(e.tick_coefficient)*coefficient
				elif reg.status_catalog.get(e.status_id,{}).get("hard_control",false):
					e.duration_s=float(e.get("duration_s",reg.status_catalog[e.status_id].duration_s))*(1.0+0.20*ratio)
				elif e.status_id in ["attack_up","defense_up","accuracy_up","haste","chakra_up","evasion"]:
					e.magnitude=float(e.get("magnitude",0.2))*(1.0+0.35*ratio)
			"summon":
				e.hp_owner_fraction=float(e.hp_owner_fraction)*(1.0+0.50*ratio)
				e.attack_owner_fraction=float(e.attack_owner_fraction)*(1.0+0.50*ratio)
			"chakra_restore":
				e.amount=floorf(float(e.amount)*(1.0+0.50*ratio))
			"activate_form":
				s.chakra=float(s.chakra)*(1.0-0.15*ratio)
	if kind=="wall":params.duration_s=float(params.get("duration_s",6))*(1.0+0.25*ratio)
	if kind in ["chakra_restore","chakra_drain","zone_drain"]:
		for key in ["chakra_amount","chakra_per_tick"]:
			if params.has(key):params[key]=floorf(float(params[key])*(1.0+0.50*ratio))
	if branch.ends_with("-B2") and specific.is_empty() and exact.is_empty():
		if s.shape in ["circle_ground","circle_self","circle_target","zone_target","projectile_burst","circle"]:s.radius_m=float(s.radius_m)*1.15
		elif s.shape=="line":s.line_width_m=float(s.line_width_m)*1.15
		elif s.chakra>0:s.chakra=float(s.chakra)*0.90
	# Explicit V4 growth fields override generic parameters only once.
	var growth=reg.depth_growth.get(s.skill_id,{})
	if not growth.is_empty() and s.has("p2"):
		var spec=growth.additional_scaling
		var base=float(spec.base)
		match str(spec.field):
			"params.magnitude":
				for e in s.effects:
					if e.type=="apply_status":e.magnitude=base*(1.0+0.20*ratio)
			"timing.windup_s":
				var speed=0.20 if str(spec.formula).contains(".20") else 0.15
				s.cast_s=maxf(0.12 if speed==0.20 else 0.25,float(s.cast_s)*(1.0-speed*ratio))
			"params.mark_ttl_s":params.mark_ttl_s=base*(1.0+0.15*ratio)
			"params.duration_s":params.duration_s=base*(1.0+0.15*ratio)
			"params.chakra_amount":params.chakra_amount=floorf(base*(1.0+0.25*ratio))
	# Exact V4 branch contract; duration never multiplies total DOT budget.
	if not specific.is_empty() and s.has("p2"):
		if specific.old_hold=="DOT_FIXED_TOTAL_ADAPTER":
			for e in s.effects:
				if not e.has("tick_coefficient"):continue
				var old_duration=float(e.duration_s)
				e.fixed_dot_total_coefficient=float(e.tick_coefficient)*maxf(1.0,floorf(old_duration))
				e.fixed_dot_skill=s.skill_id
				e.duration_s=old_duration*float(specific.operation.multiplier)
				e.tick_coefficient=0.0
		elif specific.old_hold=="RESOURCE_LOOP_TEST":
			if params.has("chakra_per_tick"):
				params.chakra_per_tick=float(params.chakra_per_tick)*float(specific.operation.multiplier)
				s.depth_drain_contract=true
	if not exact.is_empty() and specific.is_empty() and s.has("p2"):apply_exact(s,exact)
	elif not exact.is_empty() and not s.has("p2"):s.depth_branch_hold=exact.id
	if s.chakra>0:s.chakra=maxf(1.0,float(s.chakra)*(1.0-star_discount(stars)))

static func apply_exact(s: Dictionary,row: Dictionary) -> void:
	var m=float(row.multiplier)
	var params=s.p2.effect.params
	var changed=false
	match str(row.field):
		"effect.total_coefficient":
			for e in s.effects:
				if e.type in ["damage","heal","shield","counter"] and float(e.get("coefficient",0))>0:
					e.coefficient=float(e.coefficient)*m
					changed=true
				if e.has("tick_coefficient"):
					e.tick_coefficient=float(e.tick_coefficient)*m
					changed=true
		"timing.chakra":
			if s.chakra>0:s.chakra=float(s.chakra)*m;changed=true
		"geometry.extent":
			if s.shape=="line":s.line_width_m=float(s.line_width_m)*m;changed=true
			elif float(s.radius_m)>0:s.radius_m=float(s.radius_m)*m;changed=true
		"effect.params.status_s":
			for e in s.effects:
				if e.type=="apply_status" and e.has("duration_s"):
					e.duration_s=float(e.duration_s)*m
					changed=true
		"effect.params.magnitude":
			for e in s.effects:
				if e.type=="apply_status" and e.has("magnitude"):e.magnitude=float(e.magnitude)*m;changed=true
				elif e.type=="temporary_stance" and e.has("multiplier"):e.multiplier=1.0+(float(e.multiplier)-1.0)*m;changed=true
		"effect.params.duration_s":
			if params.has("duration_s"):params.duration_s=float(params.duration_s)*m;changed=true
			for e in s.effects:
				if e.type in ["shield","temporary_stance","apply_status"] and e.has("duration_s"):
					e.duration_s=float(e.duration_s)*m
					changed=true
				elif e.type=="counter" and e.has("window_s"):e.window_s=float(e.window_s)*m;changed=true
		"effect.params.width_m":
			if params.has("width_m"):params.width_m=float(params.width_m)*m;changed=true
		"effect.params.angle_deg":
			if params.has("angle_deg"):params.angle_deg=minf(360.0,float(params.angle_deg)*m);changed=true
		"effect.params.interval_s":
			if params.has("interval_s"):params.interval_s=maxf(0.05,float(params.interval_s)*m);changed=true
		"effect.params.trigger_radius_m":
			if params.has("trigger_radius_m"):
				params.trigger_radius_m=float(params.trigger_radius_m)*m
				s.radius_m=float(s.radius_m)*m
				changed=true
		"effect.params.hp_fraction","effect.params.attack_fraction":
			var field="hp_owner_fraction" if row.field=="effect.params.hp_fraction" else "attack_owner_fraction"
			for e in s.effects:
				if e.type=="summon" and e.has(field):e[field]=float(e[field])*m;changed=true
	if changed:s.depth_exact_branch=row.id
	else:s.depth_branch_hold=row.id

