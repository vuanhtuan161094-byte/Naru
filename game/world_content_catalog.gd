extends RefCounted
# Optional side expeditions reuse actual authored boss battles; never manufacture a second combat engine.
# Stable IDs and explicit cooldowns. No extra first-clear, unlock, bloodline or beast grants.
const EXPEDITIONS=[
	{"id":"EXP-01","name":"Học viện • ôn luyện","stage":"STG-005","resource":"RES-116","qty":4,"hq":2,"cooldown":21600},
	{"id":"EXP-02","name":"Bảo vệ cầu • thể thuật","stage":"STG-010","resource":"RES-118","qty":3,"hq":2,"cooldown":21600},
	{"id":"EXP-03","name":"Trung nhẫn • nhẫn cụ","stage":"STG-015","resource":"RES-113","qty":3,"hq":3,"cooldown":21600},
	{"id":"EXP-04","name":"Đối đầu Orochimaru • ảo thuật","stage":"STG-020","resource":"RES-120","qty":3,"hq":3,"cooldown":21600},
	{"id":"EXP-05","name":"Thử thách y thuật • kinh nghiệm","stage":"STG-025","resource":"RES-117","qty":2,"hq":4,"cooldown":21600},
	{"id":"EXP-06","name":"Thung lũng Tận Cùng • tiến giai","stage":"STG-030","resource":"RES-130","qty":2,"hq":5,"cooldown":21600},
	{"id":"EXP-07","name":"Truy kích Akatsuki • tinh luyện","stage":"STG-045","resource":"RES-114","qty":3,"hq":6,"cooldown":21600},
	{"id":"EXP-08","name":"Thiên Đạo • đột phá","stage":"STG-055","resource":"RES-128","qty":3,"hq":7,"cooldown":21600},
	{"id":"EXP-09","name":"Chakra Kurama • mảnh sao","stage":"STG-065","resource":"RES-134","qty":3,"hq":8,"cooldown":43200},
	{"id":"EXP-10","name":"Đại chiến • phẩm chất","stage":"STG-075","resource":"RES-132","qty":2,"hq":9,"cooldown":43200},
	{"id":"EXP-11","name":"Kara • chế tác nhẫn cụ","stage":"STG-105","resource":"RES-112","qty":5,"hq":12,"cooldown":43200},
	{"id":"EXP-12","name":"Nhẫn giới vô tận • bảo hộ","stage":"STG-120","resource":"RES-115","qty":3,"hq":15,"cooldown":43200}
]
static func find(id:String) -> Dictionary:
	for row in EXPEDITIONS:
		if row.id==id:return row.duplicate(true)
	return {}

static func cooldown_key(id:String) -> String:
	return "expedition:"+id

static func quote(reg,s:Dictionary,id:String) -> Dictionary:
	var row=find(id)
	if row.is_empty() or not reg.stages.has(row.stage) or not reg.resources.has(row.resource):return {}
	var remaining=maxi(0,int(s.get("source_cooldowns",{}).get(cooldown_key(id),0))-int(s.get("simulation_seconds",0)))
	var reason=""
	var stage=reg.stages[row.stage]
	if not s.cleared.has(row.stage) or (stage.requires!=null and not s.cleared.has(str(stage.requires))):reason="Cần vượt "+str(row.stage)
	elif int(s.building_states["BLD-001"].level)<int(row.hq):reason="Cần Tổng bộ cấp "+str(row.hq)
	elif remaining>0:reason="Hồi "+str(remaining)+" giây"
	elif s.team.is_empty():reason="Cần bố trận"
	elif int(s.stamina)<int(stage.stamina_cost):reason="Thiếu thể lực"
	for event in s.ledger.values():
		if event is Dictionary and event.get("status")=="started":reason="Đang có trận chưa quyết toán";break
	return {"ready":reason.is_empty(),"reason":reason,"remaining":remaining,"row":row,"stamina":int(stage.stamina_cost)}

static func for_resource(id:String) -> Array:
	var out=[]
	for row in EXPEDITIONS:
		if row.resource==id:out.append(row.duplicate(true))
	return out
