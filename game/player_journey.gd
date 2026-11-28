extends RefCounted
# E2 read-only recommendations. No automatic spending, rewards, or artificial progression.
const Village=preload("res://game/village_service.gd")
const Content=preload("res://game/content_service.gd")
const Activities=preload("res://game/world_activities.gd")
const Quotes=preload("res://game/progression_quotes.gd")
static func missing(s:Dictionary,cost:Dictionary)->Dictionary:
	var out={}
	for id in cost:
		var shortfall=maxi(0,int(cost[id])-int(s.inventory.get(id,0)))
		if shortfall>0:out[id]=shortfall
	return out

static func next_stage(reg,s:Dictionary)->String:
	for i in range(1,121):
		var id="STG-%03d"%i
		if not reg.stages.has(id) or s.cleared.has(id):continue
		var stage=reg.stages[id]
		if stage.requires==null or s.cleared.has(str(stage.requires)):return id
	return ""

static func quest_action(kind:String)->String:
	match kind:
		"clear_chapter","clear_stage":return "campaign"
		"train_ninja":return "growth"
		"recruit":return "recruit"
		"craft_item":return "craft"
		"collect_production":return "production"
		"finish_mission":return "mission"
		"trade":return "trade"
		"territory_battle","visit_territory":return "world"
	return "quests"

static func snapshot(reg,store)->Dictionary:
	var s:Dictionary=store.state
	var stage_id=next_stage(reg,s)
	var story={}
	var steps=[]
	var growth=[]
	var claimable=[]
	var daily=[]
	var hq=Village.level(s,"BLD-001")
	var cleared=s.cleared.size()
	var phase="Khởi đầu" if cleared<5 else "Phát triển đội hình" if cleared<30 else "Mở rộng thế lực" if cleared<90 else "Chinh phục Nhẫn giới"
	if stage_id.is_empty():phase="Hậu kỳ • hoàn thành cốt truyện"
	if not stage_id.is_empty():
		var stage=reg.stages[stage_id]
		var enemy_level=0
		for npc in stage.enemy_ids:enemy_level=maxi(enemy_level,int(reg.npcs[npc].level))
		var required=int(stage.stamina_cost)
		var shortfall=maxi(0,required-int(s.stamina))
		var food=""
		for id in Activities.FOOD:
			if Activities.food_quote(s,id).ready:food=id;break
		var reason=""
		var route="battle"
		if s.team.is_empty():reason="Chưa có đội hình";route="formation"
		elif shortfall>0:reason="Thiếu %d thể lực"%shortfall;route="food"
		else:
			for entry in s.ledger.values():
				if entry is Dictionary and entry.get("status")=="started":reason="Còn trận chưa kết thúc";route="campaign";break
		story={"id":stage_id,"name":stage.name_vi,"enemy_level":enemy_level,"cost":required,"missing_stamina":shortfall,"food":food,"wait_s":maxi(0,shortfall*360-int(s.get("stamina_seconds",0))) if shortfall>0 else 0,"reason":reason,"route":route,"rewards":stage.first_clear_rewards}
	if int(s.draws)==0:
		var gap=missing(s,{"RES-002":int(reg.recruit.price.single)})
		steps.append({"title":"Chiêu mộ đồng đội đầu tiên","desc":"Lượt đầu bảo đảm SR trở lên. Chiêu mộ thêm để xây đội hình.","route":"recruit","target":"","missing":gap})
	if s.team.size()<mini(6,s.owned.size()):
		steps.append({"title":"Bổ sung đội hình","desc":"Đang xuất trận %d/6 • sở hữu %d ninja. Chọn vị trí trước, giữa, sau."%[s.team.size(),s.owned.size()],"route":"formation","target":"","missing":{}})
	elif s.team.size()<6 and int(s.inventory.get("RES-002",0))>=int(reg.recruit.price.single) and int(s.draws)>0:
		steps.append({"title":"Có thể chiêu mộ thêm ninja","desc":"Đội chưa đủ 6 người. Chiêu mộ là tùy chọn, không bắt buộc để vào ải.","route":"recruit","target":"","missing":{}})
	if s.jobs.is_empty():
		steps.append({"title":"Phân công sản xuất","desc":"Tạo nguồn tài nguyên đều đặn để nâng làng và huấn luyện.","route":"jobs","target":"","missing":{}})
	var construction=Village.construction_quote(reg,s,"BLD-001")
	if hq<100:
		var building=s.building_states["BLD-001"]
		var desc=str(construction.reason)
		if not building.upgrade.is_empty():desc="Đang nâng cấp • còn %d giây"%int(building.upgrade.remaining)
		steps.append({"title":"Tổng bộ cấp %d → %d"%[hq,hq+1],"desc":desc,"route":"building","target":"BLD-001","missing":missing(s,construction.cost) if building.upgrade.is_empty() else {}})
	# Show actual opportunities and exact deficits, restricted to active team.
	for id in s.team:
		if not s.owned.has(id):continue
		var p=s.owned[id]
		var name=str(reg.ninjas[id].name_vi)
		var cap=(int(p.realm)+1)*20
		if int(p.level)>=cap:
			var q=store.breakthrough_quote(id)
			growth.append({"title":name+" • Đột phá","desc":"Cấp %d/%d • xác suất %.0f%%"%[int(p.level),cap,100*float(q.chance)],"route":"detail","target":id,"missing":missing(s,{"RES-128":int(q.cost)}),"ready":q.ready})
		else:
			var xp=store.xp_to_cap(id)
			var q=store.training_scroll_quote(reg,id,"RES-116")
			var big=store.training_scroll_quote(reg,id,"RES-117")
			growth.append({"title":name+" • Tăng cấp","desc":"Cấp %d/%d • còn %d EXP đến trần • có %d điểm phân bổ"%[int(p.level),cap,xp,int(p.points)],"route":"training","target":id,"missing":{"RES-116":1} if int(q.qty)==0 and int(big.qty)==0 else {},"ready":int(q.qty)>0 or int(big.qty)>0})
		if int(p.stars)<15:
			var step=reg.growth.stars[int(p.stars)-1]
			var q=store.star_quote(reg,id)
			var costs={}
			for resource in step.resources:costs[resource.resource_id]=int(resource.qty)
			growth.append({"title":name+" • %d → %d sao"%[int(p.stars),int(p.stars)+1],"desc":str(q.reason)+" • mảnh ninja %d/%d"%[int(p.shards),int(step.shards)],"route":"detail","target":id,"missing":missing(s,costs),"ready":q.ready,"shard_missing":maxi(0,int(step.shards)-int(p.shards))})
		for skill_id in reg.ninjas[id].additional_skill_ids:
			if store.skill_allowed(reg,id,skill_id):continue
			var req=reg.names[skill_id].unlock_require
			var prev=store.skill_progress(p,str(req.prior_skill_id))
			var book=store.skill_book(reg,str(req.prior_skill_id))
			var need=Quotes.level_cost(int(prev.level),int(prev.grade))
			var lacks={}
			if int(prev.grade)<int(req.grade):
				if int(prev.level)<20:lacks=missing(s,{book:need})
				else:lacks=missing(s,{"RES-130":Quotes.advance_cost(int(prev.grade))})
			growth.append({"title":name+" • Mở nhẫn thuật","desc":"%s • cảnh %d/%d • giai %d/%d • thành thạo %d/%d"%[reg.names[skill_id].name_vi,int(p.realm),int(reg.trials[str(req.challenge_id)].requires_realm),int(prev.grade),int(req.grade),int(p.skill_mastery.get(req.prior_skill_id,0)),int(req.mastery)],"route":"skill","target":id,"missing":lacks,"ready":store.trial_ready(reg,id,str(req.challenge_id))})
			break
	# Daily objective counts are read from a normalized COPY, not mutated in a UI query.
	var quest_state=s.duplicate(true)
	Content.sync_day(quest_state)
	for id in reg.quests:
		var q=reg.quests[id]
		if quest_state.quest_claimed.has(Content.claim_key(quest_state,q)):continue
		var count=Content.objective(reg,quest_state,q)
		var row={"id":id,"title":q.name_vi,"count":count,"goal":int(q.objective.count),"reward":q.reward,"route":quest_action(str(q.objective.kind))}
		if count>=int(q.objective.count):claimable.append(row)
		elif q.repeatable:daily.append(row)
	growth.sort_custom(func(a,b):return bool(a.ready) and not bool(b.ready))
	return {"phase":phase,"cleared":cleared,"total":reg.stages.size(),"hq":hq,"team":s.team.size(),"owned":s.owned.size(),"story":story,"steps":steps,"growth":growth,"claimable":claimable,"daily":daily}
