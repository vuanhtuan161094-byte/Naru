extends RefCounted
# Optional paid world upgrades; no combat stats or Luna-owned equipment formula edits.
const PROJECTS=[
	{"id":"TECH-01","name":"Tối ưu dây chuyền","effect":"craft_speed","step":0.05,"description":"Rút ngắn thời gian chế tạo theo hệ số tốc độ"},
	{"id":"TECH-02","name":"Tái sử dụng phế liệu","effect":"economy","step":0.03,"description":"Giảm định mức nguyên liệu mỗi mẻ"},
	{"id":"TECH-03","name":"Cơ giới hóa xây dựng","effect":"build_speed","step":0.06,"description":"Rút ngắn thời gian nâng cấp công trình"},
	{"id":"TECH-04","name":"Khai thác hiệu quả","effect":"supply_speed","step":0.05,"description":"Rút ngắn chu kỳ khai thác tự nhiên"}
]
static func find(id:String) -> Dictionary:
	for row in PROJECTS:
		if row.id==id:return row
	return {}

static func bonus(s:Dictionary,effect:String) -> float:
	for row in PROJECTS:
		if row.effect==effect:return float(row.step)*clampi(int(s.get("world_projects",{}).get(row.id,0)),0,5)
	return 0.0

static func affordable(s:Dictionary,cost:Dictionary) -> bool:
	for id in cost:
		if int(s.inventory.get(id,0))<int(cost[id]):return false
	return true

static func pay(s:Dictionary,cost:Dictionary) -> void:
	for id in cost:s.inventory[id]=int(s.inventory.get(id,0))-int(cost[id])

static func quote(s:Dictionary,id:String) -> Dictionary:
	var row=find(id)
	if row.is_empty():return {}
	var lv=int(s.get("world_projects",{}).get(id,0))
	var next=lv+1
	var cost={"RES-001":500*next*next,"RES-068":2*next,"RES-086":next}
	var reason=""
	if lv>=5:reason="Đã tối đa"
	elif int(s.building_states["BLD-028"].level)<next:reason="Cần Phòng nghiên cứu cấp "+str(next)
	elif not affordable(s,cost):reason="Thiếu tài nguyên"
	return {"ready":reason.is_empty(),"reason":reason,"level":lv,"cost":cost,"bonus":float(row.step)*lv}

static func upgrade(s:Dictionary,id:String) -> bool:
	var q=quote(s,id)
	if q.is_empty() or not q.ready:return false
	pay(s,q.cost)
	if not s.has("world_projects"):s.world_projects={}
	s.world_projects[id]=int(q.level)+1
	return true

static func territory_quote(reg,s:Dictionary,id:String) -> Dictionary:
	if not reg.territories.has(id) or not s.territory_states.has(id):return {}
	var t=s.territory_states[id]
	var lv=int(t.get("development",0))
	var next=lv+1
	var cost={"RES-001":300*next*next,"RES-056":2*next,"RES-057":2*next}
	var reason=""
	if t.owner!="FAC-009" or not t.discovered:reason="Chưa kiểm soát lãnh địa"
	elif lv>=5:reason="Đã tối đa"
	elif int(s.building_states["BLD-001"].level)<next+2:reason="Cần Tổng bộ cấp "+str(next+2)
	elif not affordable(s,cost):reason="Thiếu tài nguyên"
	return {"ready":reason.is_empty(),"reason":reason,"level":lv,"cost":cost,"bonus":0.05*lv}

static func develop(reg,s:Dictionary,id:String) -> bool:
	var q=territory_quote(reg,s,id)
	if q.is_empty() or not q.ready:return false
	pay(s,q.cost)
	s.territory_states[id].development=int(q.level)+1
	return true

# Levy is a conversion of earned production, not an additional passive grant.
# Default 0 preserves existing progression. The best-developed owned region
# supplies a shared resource; ties are resolved by stable registry order.
static func territory_tax(s:Dictionary,id:String,rate:int) -> bool:
	if not s.territory_states.has(id) or not rate in [0,10,20,30]:return false
	var territory=s.territory_states[id]
	if territory.owner!="FAC-009" or not territory.discovered:return false
	territory.tax_rate=rate
	return true

static func source_region(reg,s:Dictionary,resource_id:String) -> String:
	var best=""
	var highest=-1
	for id in reg.territories:
		var t=s.territory_states[id]
		if t.owner!="FAC-009":continue
		for row in reg.territories[id].resources:
			if row.resource_id!=resource_id:continue
			var development=int(t.get("development",0))
			if development>highest:
				best=id
				highest=development
	return best

static func levy_quote(reg,s:Dictionary,region:String,resource_id:String,qty:int) -> Dictionary:
	var rate=clampi(int(s.territory_states.get(region,{}).get("tax_rate",0)),0,30)
	if region.is_empty() or not reg.resources[resource_id].tradable or resource_id in ["RES-001","RES-002","RES-003","RES-004","RES-005"]:rate=0
	var levy=floori(float(qty)*rate/100.0)
	var unit=maxi(1,floori(float(reg.resources[resource_id].base_price_ryo)*0.35))
	return {"qty":qty-levy,"levy":levy,"ryo":levy*unit}
