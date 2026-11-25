extends RefCounted
# Explicit allow-list; unknown special parameters keep D4, never silently become P2.
const TYPES=["damage","multi_hit","decoy","chakra_regen","dash_damage","dash_multi_hit","counter","wall","projectile_damage","stance","line_damage","zone_damage","area_damage","shield","cone_damage","ground_damage","heal","cleanse","activate_form","heal_pulse","status","directional_shield","teleport","projectile_mark","team_buff","trap","chakra_drain","mark","chakra_restore","displace","zone_drain","pierce","absorb","position_swap","summon","beguile_tactical"]
const SPECIAL=["requires_owned_clone_or_anchor","adapter_gate","eye_strain","do_not_add_duplicate_dot","retrieve","max_objects","shrink_target","requires_contact_with_ally","mark_throw_before_teleport","invulnerability_s","decoy_evasion_once"]
static func compile(raw: Dictionary,base: Dictionary) -> Dictionary:
	var p=raw.effect.params
	var kind=str(raw.effect.type)
	if raw.design_status=="HOLD_ERA":return {"reason":"HOLD_ERA"}
	if not kind in TYPES:return {"reason":"mechanic:"+kind}
	for key in SPECIAL:
		if p.has(key):return {"reason":"special:"+key}
	if kind=="summon" and not str(p.get("role","melee")) in ["melee","melee_decoy","track_bind","heal_ally","frontline","bind","guard","ranged_puppet","ranged","element_ranged"]:return {"reason":"summon_role"}
	var s=base.duplicate(true)
	var g=raw.geometry
	var t=raw.timing
	s.kind="ultimate" if int(raw.slot)==5 or raw.kind=="ultimate" and raw.trigger=="manual_player_ai_enemy" else str(raw.kind)
	# Slot five is always manual for player; additional ultimate classification follows D4 unless explicit.
	if int(raw.slot)!=5 and s.kind=="ultimate" and raw.trigger!="manual_player_ai_enemy":s.kind="auto"
	s.element=raw.element
	s.damage_type=raw.damage_type
	s.target="self" if raw.target in ["self","allies_in_radius"] or g.shape in ["circle_self","arc_self","summon"] else "ally_lowest_effective_hp" if raw.target=="ally_lowest_effective_hp" else "enemy_ai"
	s.shape=g.shape
	s.range_m=float(g.range_m)
	s.radius_m=float(g.extent) if g.extent_unit=="radius_m" else 0.0
	s.line_width_m=float(g.extent) if g.extent_unit=="width_m" else 0.0
	s.max_targets=int(g.max_targets)
	s.cast_s=float(t.windup_s)
	s.recovery_s=float(t.recovery_s)
	s.chakra=float(t.chakra)
	s.cooldown_s=float(t.cooldown_s)
	s.interruptible=bool(t.interruptible)
	s.projectile_speed_m_s=float(t.projectile_speed_m_s)
	s.p2=raw
	s.effects=[]
	var coef=float(raw.effect.total_coefficient)
	var dot_fraction=clampf(float(p.get("dot_fraction_of_total",0)),0,0.9)
	var damage_types=["damage","multi_hit","decoy","dash_damage","dash_multi_hit","projectile_damage","line_damage","zone_damage","area_damage","cone_damage","ground_damage","status","teleport","projectile_mark","trap","chakra_drain","mark","displace","zone_drain","pierce"]
	if kind in damage_types and coef>0:s.effects.append({"type":"damage","coefficient":coef*(1-dot_fraction),"damage_type":raw.damage_type})
	if kind in ["heal","heal_pulse"]:s.effects.append({"type":"heal","coefficient":coef})
	if kind=="shield":s.effects.append({"type":"shield","coefficient":coef,"duration_s":float(p.get("duration_s",5))})
	if kind=="directional_shield":s.effects.append({"type":"shield","coefficient":coef,"duration_s":float(p.get("duration_s",4))})
	if kind=="cleanse":s.effects.append({"type":"cleanse","max_statuses":int(p.get("max_statuses",1))})
	if kind=="activate_form":
		if not p.has("form_id"):return {"reason":"missing_form"}
		s.effects.append({"type":"activate_form","form_id":p.form_id})
	if kind=="summon":s.effects.append({"type":"summon","template_id":"SUMMON-SKILL-"+str(raw.skill_id),"cap":int(p.cap),"lifetime_s":float(p.ttl_s),"hp_owner_fraction":float(p.hp_fraction),"attack_owner_fraction":float(p.attack_fraction),"can_summon":false,"p2_role":str(p.get("role","melee")),"p2_params":p})
	if p.has("status"):
		var duration=float(p.get("status_s",1.5))
		var status={"type":"apply_status","status_id":p.status,"chance":float(p.get("chance",1)),"duration_s":duration,"magnitude":float(p.get("magnitude",0.2))}
		if dot_fraction>0:status.tick_coefficient=coef*dot_fraction/maxf(1.0,floorf(duration))
		s.effects.append(status)
	if kind in ["stance","team_buff","chakra_regen"]:
		var stat=str(p.get("stat","chakra"))
		var statuses={"attack":"attack_up","defense":"defense_up","accuracy":"accuracy_up","move_speed":"haste","evasion":"evasion","chakra":"chakra_up"}
		if not statuses.has(stat):return {"reason":"stat:"+stat}
		s.effects.append({"type":"apply_status","status_id":statuses[stat],"chance":1.0,"duration_s":float(p.get("duration_s",5)),"magnitude":float(p.get("magnitude",0.2))})
	if p.has("secondary_stance"):
		var secondary=p.secondary_stance
		if secondary.stat!="evasion":return {"reason":"secondary_stance"}
		s.effects.append({"type":"apply_status","status_id":"evasion","chance":1.0,"duration_s":float(p.get("duration_s",5)),"magnitude":float(secondary.magnitude)})
	if kind=="counter":s.effects.append({"type":"counter","window_s":float(p.get("duration_s",4)),"coefficient":coef})
	# New mechanisms have explicit engine dispatch, not fake D4 effect.
	if s.effects.is_empty() and not kind in ["wall","teleport","position_swap","absorb","chakra_restore","mark","projectile_mark"]:return {"reason":"empty:"+kind}
	s.ai={"base_priority":int(base.ai.base_priority),"condition":"ally_dispellable_status" if raw.conditions.ai=="ally_has_dispellable_status" and s.target!="self" else "valid_target","reserve_ultimate_chakra":true}
	return {"skill":s}
