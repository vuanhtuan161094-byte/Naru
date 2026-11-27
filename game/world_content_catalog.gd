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
const VARIANTS=[
	{"id":"EXP-13","base_id":"EXP-01","name":"Sát hạch đội hình","enemy_ids":["NPC-009","NPC-008","NPC-007"],"map_profile":"compact","terrain":[{"center":[0.5,0.22],"size":[1,1.2],"kind":"obstacle"},{"center":[0.5,0.78],"size":[1,1.2],"kind":"obstacle"}]},
	{"id":"EXP-14","base_id":"EXP-02","name":"Phục kích trên cầu","enemy_ids":["NPC-020","NPC-018","NPC-021"],"map_profile":"large","terrain":[{"center":[0.5,0.5],"size":[3,2],"kind":"slow","speed":0.8}]},
	{"id":"EXP-15","base_id":"EXP-03","name":"Đấu trường trung nhẫn","enemy_ids":["NPC-031","NPC-030","NPC-029"],"map_profile":"standard","terrain":[{"center":[0.5,0.35],"size":[1,1],"kind":"obstacle"},{"center":[0.5,0.65],"size":[1,1],"kind":"obstacle"}]},
	{"id":"EXP-16","base_id":"EXP-04","name":"Mật đạo Orochimaru","enemy_ids":["NPC-042","NPC-041","NPC-038"],"map_profile":"compact","terrain":[{"center":[0.5,0.22],"size":[1,1.2],"kind":"obstacle"},{"center":[0.5,0.78],"size":[1,1.2],"kind":"obstacle"}]},
	{"id":"EXP-17","base_id":"EXP-05","name":"Đội cứu viện","enemy_ids":["NPC-053","NPC-051","NPC-049"],"map_profile":"large","terrain":[{"center":[0.5,0.5],"size":[3,2],"kind":"slow","speed":0.8}]},
	{"id":"EXP-18","base_id":"EXP-06","name":"Tử chiến thung lũng","enemy_ids":["NPC-068","NPC-066","NPC-065","NPC-062"],"map_profile":"standard","terrain":[{"center":[0.5,0.35],"size":[1,1],"kind":"obstacle"},{"center":[0.5,0.65],"size":[1,1],"kind":"obstacle"}]},
	{"id":"EXP-19","base_id":"EXP-07","name":"Truy kích liên đội","enemy_ids":["NPC-116","NPC-114","NPC-113","NPC-110"],"map_profile":"compact","terrain":[{"center":[0.5,0.22],"size":[1,1.2],"kind":"obstacle"},{"center":[0.5,0.78],"size":[1,1.2],"kind":"obstacle"}]},
	{"id":"EXP-20","base_id":"EXP-08","name":"Phòng tuyến Thiên Đạo","enemy_ids":["NPC-152","NPC-151","NPC-150","NPC-148","NPC-153"],"map_profile":"large","terrain":[{"center":[0.5,0.5],"size":[3,2],"kind":"slow","speed":0.8}]},
	{"id":"EXP-21","base_id":"EXP-09","name":"Hộ tống Jinchuriki","enemy_ids":["NPC-194","NPC-193","NPC-192","NPC-190","NPC-195"],"map_profile":"standard","terrain":[{"center":[0.5,0.35],"size":[1,1],"kind":"obstacle"},{"center":[0.5,0.65],"size":[1,1],"kind":"obstacle"}]},
	{"id":"EXP-22","base_id":"EXP-10","name":"Đại chiến liên quân","enemy_ids":["NPC-236","NPC-235","NPC-234","NPC-232","NPC-237"],"map_profile":"compact","terrain":[{"center":[0.5,0.22],"size":[1,1.2],"kind":"obstacle"},{"center":[0.5,0.78],"size":[1,1.2],"kind":"obstacle"}]},
	{"id":"EXP-23","base_id":"EXP-11","name":"Đột kích căn cứ Kara","enemy_ids":["NPC-395","NPC-393","NPC-392","NPC-391","NPC-396","NPC-397"],"map_profile":"large","terrain":[{"center":[0.5,0.5],"size":[3,2],"kind":"slow","speed":0.8}]},
	{"id":"EXP-24","base_id":"EXP-12","name":"Liên chiến nhẫn giới","enemy_ids":["NPC-485","NPC-484","NPC-482","NPC-481","NPC-486","NPC-487"],"map_profile":"standard","terrain":[{"center":[0.5,0.35],"size":[1,1],"kind":"obstacle"},{"center":[0.5,0.65],"size":[1,1],"kind":"obstacle"}]}
]

static func all() -> Array:
	var out=EXPEDITIONS.duplicate(true)
	for variant in VARIANTS:
		var row=find(variant.id)
		if not row.is_empty():out.append(row)
	return out

static func battle_stage(reg,id:String) -> Dictionary:
	var row=find(id)
	if row.is_empty() or not reg.stages.has(row.stage):return {}
	var stage=reg.stages[row.stage].duplicate(true)
	if row.has("enemy_ids"):
		stage.name_vi=row.name
		stage.enemy_ids=row.enemy_ids.duplicate()
		stage.map_profile=row.map_profile
		stage.terrain=row.terrain.duplicate(true)
	return stage

static func find(id:String) -> Dictionary:
	for row in EXPEDITIONS:
		if row.id==id:return row.duplicate(true)
	for variant in VARIANTS:
		if variant.id!=id:continue
		for base in EXPEDITIONS:
			if base.id!=variant.base_id:continue
			var row=base.duplicate(true)
			for key in variant:row[key]=variant[key]
			row.qty=maxi(1,int(base.qty))
			return row
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
	for row in all():
		if row.resource==id:out.append(row.duplicate(true))
	return out
