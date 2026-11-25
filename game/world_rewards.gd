extends RefCounted
# Shared capacity-aware reward/refund routing; does not persist by itself.
# Caller owns the surrounding SaveStore transaction.
static func capacity(s: Dictionary,id: String) -> int:
	if id in ["RES-001","RES-002","RES-003","RES-004","RES-005"]:return 9000000000000
	return 10000+5000*int(s.get("building_states",{}).get("BLD-020",{}).get("level",0))

static func deliver(s: Dictionary,id: String,qty: int) -> void:
	if qty<=0:return
	var take=mini(qty,maxi(0,capacity(s,id)-int(s.inventory.get(id,0))))
	if take>0:s.inventory[id]=int(s.inventory.get(id,0))+take
	if take<qty:
		if not s.has("reward_inbox"):s.reward_inbox={}
		s.reward_inbox[id]=int(s.reward_inbox.get(id,0))+qty-take
