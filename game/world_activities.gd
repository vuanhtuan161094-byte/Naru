extends RefCounted
const Content=preload("res://game/content_service.gd")
const Projects=preload("res://game/world_economy_projects.gd")
const TOWER_MAX=30
const FOOD={"RES-034":6,"RES-035":12}
const FOOD_LIMIT=36

static func food_quote(s:Dictionary,id:String) -> Dictionary:
	if not FOOD.has(id):return {}
	var used=int(s.get("daily_counts",{}).get("food_stamina",0)) if int(s.get("quest_day",0))==Content.day(s) else 0
	var gain=mini(int(FOOD[id]),mini(120-int(s.stamina),FOOD_LIMIT-used))
	return {"ready":gain>0 and int(s.inventory.get(id,0))>0,"gain":maxi(0,gain),"used":used,"remaining":maxi(0,FOOD_LIMIT-used)}

static func eat(s:Dictionary,id:String) -> bool:
	var q=food_quote(s,id)
	if q.is_empty() or not q.ready:return false
	Content.sync_day(s)
	s.inventory[id]=int(s.inventory[id])-1
	s.stamina=int(s.stamina)+int(q.gain)
	s.daily_counts.food_stamina=int(q.used)+int(q.gain)
	return true

static func tower_stage_id(floor_number:int) -> String:
	return "STG-%03d" % (floor_number*4) if floor_number>=1 and floor_number<=TOWER_MAX else ""

static func tower_stage(reg,floor_number:int) -> Dictionary:
	var key=tower_stage_id(floor_number)
	if not reg.stages.has(key):return {}
	var stage=reg.stages[key].duplicate(true)
	stage.name_vi="Tháp nhẫn thuật • Tầng "+str(floor_number)
	stage.map_profile=["compact","standard","large"][posmod(floor_number-1,3)]
	stage.terrain=[{"center":[0.5,0.23],"size":[1.1,1.1],"kind":"obstacle"},{"center":[0.5,0.77],"size":[1.1,1.1],"kind":"obstacle"}] if floor_number%3==1 else [{"center":[0.5,0.5],"size":[2.0,2.0],"kind":"slow","speed":0.8}] if floor_number%3==2 else []
	return stage

static func tower_rewards(floor_number:int) -> Array:
	if tower_stage_id(floor_number).is_empty():return []
	var out=[{"resource_id":"RES-001","qty":200+100*floor_number},{"resource_id":"RES-116","qty":2+floori(float(floor_number)/5)}]
	if floor_number%5==0:out.append({"resource_id":["RES-128","RES-130","RES-134","RES-132","RES-113","RES-115"][floori(float(floor_number)/5)-1],"qty":3+floori(float(floor_number)/5)})
	return out

static func tower_quote(reg,s:Dictionary,floor_number:int) -> Dictionary:
	var stage=tower_stage(reg,floor_number)
	if stage.is_empty():return {}
	var cleared=int(s.get("tower_best",0))
	var reason=""
	if not s.cleared.has("STG-005"):reason="Cần vượt STG-005"
	elif int(s.building_states["BLD-001"].level)<2:reason="Cần Tổng bộ cấp 2"
	elif floor_number!=cleared+1:reason="Đã vượt" if floor_number<=cleared else "Cần vượt tầng trước"
	elif int(s.stamina)<int(stage.stamina_cost):reason="Thiếu thể lực"
	elif s.team.is_empty():reason="Chưa bố trận"
	for entry in s.ledger.values():
		if entry is Dictionary and entry.get("status")=="started":reason="Đang có trận chưa quyết toán";break
	return {"ready":reason.is_empty(),"reason":reason,"stage":stage,"rewards":tower_rewards(floor_number)}

static func defense_quote(s:Dictionary) -> Dictionary:
	var lv=int(s.get("fortification",0))
	var next=lv+1
	var cost={"RES-001":1000*next*next,"RES-057":5*next,"RES-059":3*next}
	var reason=""
	if lv>=5:reason="Đã tối đa"
	elif int(s.building_states["BLD-030"].level)<next:reason="Cần Tháp canh cấp "+str(next)
	elif not Projects.affordable(s,cost):reason="Thiếu nguyên liệu"
	return {"ready":reason.is_empty(),"reason":reason,"level":lv,"cost":cost,"loss_rate":0.10-0.012*lv,"condition_factor":0.5+0.08*lv}

static func fortify(s:Dictionary) -> bool:
	var q=defense_quote(s)
	if not q.ready:return false
	Projects.pay(s,q.cost)
	s.fortification=int(q.level)+1
	return true
