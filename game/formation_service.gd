extends RefCounted
# Combat V3: deployment is metadata, not a movement grid.
static func normalize_slots(team: Array, raw: Dictionary = {}) -> Dictionary:
	var result: Dictionary={}
	var used: Array=[]
	for id in team:
		var value=raw.get(id,-1)
		if not (value is int or value is float):continue
		var slot=int(value)
		if float(value)!=float(slot) or slot<0 or slot>8 or slot in used:continue
		result[id]=slot
		used.append(slot)
	for id in team:
		if result.has(id):continue
		for slot in range(9):
			if slot in used:continue
			result[id]=slot
			used.append(slot)
			break
	return result

static func ensure(reg,state: Dictionary) -> void:
	state.formation_slots=normalize_slots(state.team,state.get("formation_slots",{}))
	if not reg.formations.has(state.get("formation_id","")):state.formation_id="FRM-01"
	if not state.get("formation_levels") is Dictionary:state.formation_levels={}
	for id in reg.formations:
		state.formation_levels[id]=clampi(int(state.formation_levels.get(id,1)),1,int(reg.combat_v3.upgrade.max_level))

static func cost(reg,level: int) -> int:
	return ceili(float(reg.combat_v3.upgrade.base_cost)*pow(float(level),float(reg.combat_v3.upgrade.cost_power)))

static func linked(slot_a: int,slot_b: int,kind: String) -> bool:
	if slot_a==slot_b or slot_a<0 or slot_b<0 or slot_a>8 or slot_b>8:return false
	var rank=absi(floori(float(slot_a)/3.0)-floori(float(slot_b)/3.0))
	var lane=absi(slot_a%3-slot_b%3)
	match kind:
		"rank":return rank==0 and lane==1
		"lane":return lane==0 and rank==1
		"diagonal":return rank==1 and lane==1
		_:return rank+lane==1

static func spawn(side: int,slot: int,width: int,height: int,rank_spacing: float=1.2,lane_spacing: float=1.5) -> Vector2:
	var rank=floori(float(clampi(slot,0,8))/3.0)
	var lane=clampi(slot,0,8)%3
	var x=0.9+float(2-rank)*rank_spacing
	if side==1:x=float(width)-x
	return Vector2(x,float(height)*0.5+float(lane-1)*lane_spacing)
