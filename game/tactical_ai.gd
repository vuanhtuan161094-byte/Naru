extends RefCounted
# V4 DEV. Only selects real positions/targets; never changes costs, range or legal cast gates.
static func role(sim,a: Dictionary) -> String:
	return str(sim.registry.ninjas.get(a.id,{}).get("role_hint","đấu sĩ"))

static func hp_ratio(a: Dictionary) -> float:
	return float(a.hp)/maxf(1.0,float(a.max_hp))

static func threat(sim,a: Dictionary) -> float:
	var value=0.0
	for enemy in sim.primary_alive(1-int(a.side)):
		if enemy.get("focus_uid",0)==a.uid:value+=1.0
		if enemy.pos.distance_to(a.pos)<2.0:value+=0.5
	return value

static func target_bonus(sim,a: Dictionary,b: Dictionary,s: Dictionary,allied: bool) -> float:
	var r=role(sim,a)
	var br=role(sim,b)
	var missing=1.0-hp_ratio(b)
	if allied:
		var score=0.0
		if r=="trị liệu":score+=missing*45.0+threat(sim,b)*7.0
		if r in ["đỡ đòn","hỗ trợ"]:score+=threat(sim,b)*7.0
		if sim.has_debuff(b):score+=8.0
		return score
	var occupied=0
	for ally in sim.primary_alive(int(a.side)):
		if ally.uid!=a.uid and int(ally.get("focus_uid",0))==b.uid:occupied+=1
	var score=-float(occupied)*4.0
	# Spread opening basic targets across lanes. Keep deliberate combo, pressure,
	# taunt and role-based focus rules intact.
	if s.kind=="basic" and not sim.pressure_mode:
		score-=maxf(0.0,float(occupied)-1.0)*8.0
		if sim.ticks<100 and a.has("deployment_slot") and b.has("deployment_slot"):
			var lane_diff=absi(int(a.deployment_slot)%3-int(b.deployment_slot)%3)
			score-=float(lane_diff)*12.0
	if int(a.get("focus_uid",0))==b.uid and sim.ticks<int(a.get("focus_until",0)):score+=11.0
	if sim.pressure_mode:
		if br in ["trị liệu","hỗ trợ"]:score+=28.0
		score+=minf(occupied,3)*8.0
	score+=sim.combo_target_bonus(a,b,s)
	if r=="sát thủ":
		score+=missing*40.0
		if br in ["trị liệu","hỗ trợ","công kích xa"]:score+=12.0
		if occupied>2:score-=8.0
	elif r=="khống chế":
		if not sim.hard_block(b):
			score+=12.0 if br in ["trị liệu","khống chế","sát thủ"] else 3.0
			if not b.pending.is_empty():score+=10.0
		else:score-=18.0
	elif r=="đỡ đòn":
		for ally in sim.primary_alive(int(a.side)):
			if role(sim,ally) in ["trị liệu","hỗ trợ","công kích xa"] and (int(b.get("focus_uid",0))==ally.uid or b.pos.distance_to(ally.pos)<2.5):score+=8.0
	elif r=="đấu sĩ":score+=8.0 if int(a.get("focus_uid",0))==b.uid else 0.0
	return score

static func hazard(sim,a: Dictionary,p: Vector2) -> float:
	var score=0.0
	for job in sim.p2_jobs:
		var owner=sim.actor_by_uid(int(job.source))
		if owner.is_empty() or owner.side==a.side or not job.dynamic:continue
		if job.skill.p2.target in ["self","allies_in_radius","ally_lowest_effective_hp"]:continue
		var radius=float(job.skill.radius_m)+sim.body_radius(a)
		if p.distance_to(job.point)<radius:score+=1.0+(radius-p.distance_to(job.point))*0.5
	for projectile in sim.projectiles:
		var owner=sim.actor_by_uid(int(projectile.source))
		if owner.is_empty() or owner.side==a.side:continue
		var start=Vector2(projectile.pos)
		var end=start+Vector2(projectile.direction)*minf(float(projectile.distance_left),float(projectile.skill.projectile_speed_m_s)*0.45)
		if start.distance_to(end)<0.01:continue
		if p.distance_to(Geometry2D.get_closest_point_to_segment(p,start,end))<sim.body_radius(a)+0.18:score+=2.0
	return score

static func spacing(sim,a: Dictionary,p: Vector2) -> float:
	var cost=0.0
	for ally in sim.primary_alive(int(a.side)):
		if ally.uid==a.uid:continue
		var delta=p-Vector2(ally.pos)
		var gap=Vector2(delta.x,delta.y*0.72).length()
		var preferred=1.9 if role(sim,a) in ["công kích xa","trị liệu","hỗ trợ","khống chế"] else 1.65
		cost+=maxf(0.0,preferred-gap)*3.0
	return cost

static func avoid(sim,a: Dictionary) -> Vector2:
	var origin=Vector2(a.pos)
	var risk=hazard(sim,a,origin)
	if risk<=0 or sim.ticks<int(a.get("dodge_until",0)):return origin
	var best=origin
	var best_score=risk*8.0+spacing(sim,a,origin)
	for i in range(8):
		var point=sim.clamp_body(origin+Vector2.RIGHT.rotated(i*TAU/8.0)*1.1,sim.body_radius(a))
		if not sim.position_clear(a,point) or not sim.clear_segment(origin,point,sim.body_radius(a)):continue
		var value=hazard(sim,a,point)*8.0+spacing(sim,a,point)+0.25
		if value+2.0<best_score:best_score=value;best=point
	return best

static func goal(sim,a: Dictionary,enemy: Dictionary,basic: Dictionary) -> Vector2:
	var r=role(sim,a)
	var origin=Vector2(a.pos)
	var dodge=avoid(sim,a)
	if dodge!=origin:return dodge
	var center=Vector2(enemy.pos)
	var desired=maxf(sim.body_radius(a)+sim.body_radius(enemy)+0.08,float(basic.range_m)*0.78)
	var ranged=r in ["công kích xa","trị liệu","hỗ trợ","khống chế"]
	if ranged:
		var long_range=false
		for id in a.skills:
			var s=sim.decision_skill(a,id)
			if s.kind!="ultimate" and s.target=="enemy_ai" and sim.ready(a,s):
				desired=maxf(desired,float(s.range_m)*0.78)
				if float(s.range_m)>=2.7:long_range=true
		# Do not hold a melee-only actor permanently outside its actual attack range.
		if long_range:desired=maxf(desired,2.2)
		if r in ["trị liệu","hỗ trợ"]:
			var anchor={}
			var best_priority=-INF
			for ally in sim.primary_alive(int(a.side)):
				if ally.uid==a.uid:continue
				var priority=(1.0-hp_ratio(ally))*25.0-origin.distance_to(ally.pos)*2.0
				if role(sim,ally) in ["đỡ đòn","đấu sĩ"]:priority+=5.0
				if priority>best_priority:best_priority=priority;anchor=ally
			if not anchor.is_empty():
				var away=(Vector2(anchor.pos)-center).normalized()
				var support_point=sim.clamp_body(Vector2(anchor.pos)+away*1.8,sim.body_radius(a))
				if origin.distance_to(anchor.pos)>3.5 and sim.position_clear(a,support_point) and sim.clear_segment(origin,support_point,sim.body_radius(a)):return support_point
	var direction=(origin-center).normalized()
	if direction==Vector2.ZERO:direction=Vector2.LEFT if a.side==0 else Vector2.RIGHT
	var best=origin
	var best_score=INF
	for i in range(12):
		var angle=0.0 if i==0 else float((i+1)/2)*PI/6.0*(1.0 if i%2==1 else -1.0)
		var p=sim.clamp_body(center+direction.rotated(angle)*desired,sim.body_radius(a))
		if not sim.position_clear(a,p):continue
		var value=origin.distance_to(p)*0.7+spacing(sim,a,p)+hazard(sim,a,p)*8.0
		if not sim.clear_segment(p,center,0.03):value+=5.0
		value+=(1.0-sim.terrain_speed(p))*2.0
		value-=sim.prospective_links(a,p)*0.45
		if a.has("ai_goal") and sim.ticks<int(a.get("goal_until",0)):value+=minf(2.0,p.distance_to(a.ai_goal)*0.6)
		for ally in sim.primary_alive(int(a.side)):
			if ally.uid==a.uid:continue
			if ally.has("ai_goal"):value+=maxf(0.0,1.0-p.distance_to(ally.ai_goal))*3.0
		if value<best_score:best_score=value;best=p
	if best_score==INF:return center
	if origin.distance_to(center)<desired+0.4 and origin.distance_to(center)>desired-0.45 and sim.clear_segment(origin,center,0.03) and spacing(sim,a,origin)<0.35:return origin
	return best

static func skill_bonus(sim,a: Dictionary,b: Dictionary,s: Dictionary) -> float:
	if b.is_empty():return 0.0
	var r=role(sim,a)
	var score=sim.combo_skill_bonus(a,b,s)
	if sim.pressure_mode and b.side!=a.side:
		if r in ["sát thủ","khống chế","đấu sĩ"] and role(sim,b) in ["trị liệu","hỗ trợ"]:score+=15.0
	for e in s.effects:
		match str(e.type):
			"heal":
				var missing=maxf(0.0,float(b.max_hp)-float(b.hp))
				score+=minf(28.0,28.0*missing/maxf(1.0,float(a.natk)*float(e.coefficient))) if r=="trị liệu" else 0.0
				if hp_ratio(b)<0.25:score+=30.0
			"shield":score+=minf(25.0,threat(sim,b)*8.0) if r in ["đỡ đòn","hỗ trợ"] and b.shield<=0 else 0.0
			"apply_status":
				if sim.pressure_mode and e.status_id in ["antiheal","chakra_lock","silence","attack_down"]:score+=18.0
				if sim.registry.status_catalog.get(e.status_id,{}).get("hard_control",false):
					score+=10.0 if not sim.hard_block(b) and b.immune<=0 else -18.0
			"cleanse":score+=20.0 if sim.has_debuff(b) else -25.0
	if s.kind!="basic" and s.kind!="ultimate" and a.side==0 and not sim.ultimate_requests.has(a.uid):
		if a.chakra-float(s.chakra)<float(a.max_chakra)*0.20:score-=12.0
	return score
