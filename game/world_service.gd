extends RefCounted
const Combat=preload("res://game/combat.gd")
const PLAYER="FAC-009"
const HOME="TER-058"
static func relation_key(a: String,b: String) -> String:
	return a+":"+b if a<b else b+":"+a

static func ensure(reg,s: Dictionary) -> void:
	if not s.has("territory_states"):
		s.territory_states={}
		for id in reg.territories:
			var def=reg.territories[id]
			s.territory_states[id]={"owner":def.owner_id,"discovered":def.owner_id==PLAYER,"visits":0}
	if not s.has("faction_states"):
		s.faction_states={}
		for id in reg.factions:s.faction_states[id]={"stock":reg.factions[id].stock.duplicate(true),"actions":0}
	if not s.has("relations"):
		s.relations={}
		for r in reg.relation_defs:s.relations[relation_key(r.a,r.b)]={"score":int(r.score),"state":r.state}
	if not s.has("world_location"):s.world_location=HOME
	if not s.has("travel"):s.travel={}
	if not s.has("world_seconds"):s.world_seconds=0
	if not s.has("world_tick"):s.world_tick=0
	if not s.has("raid_protection"):s.raid_protection=0
	if not s.has("world_log"):s.world_log=[]
	if not s.has("trade_count"):s.trade_count=0
	if not s.has("territory_battles"):s.territory_battles=0
	if not s.has("world_squads"):s.world_squads={}
	for key in ["SQUAD-2","SQUAD-3"]:
		if not s.world_squads.has(key):s.world_squads[key]={"team":[],"location":HOME,"travel":{}}
	if not s.has("home_defense"):s.home_defense=[]
	if not s.has("npc_war_count"):s.npc_war_count=0
	for id in s.faction_states:
		var npc=s.faction_states[id]
		if not npc.has("infrastructure"):npc.infrastructure={"production":1,"defense":1,"training":1}
		if not npc.has("last_war_tick"):npc.last_war_tick=-1000

static func note(s: Dictionary,message: String) -> void:
	s.world_log.append(message)
	if s.world_log.size()>20:s.world_log.pop_front()

static func edges(reg,id: String) -> Array:
	var out=[]
	for r in reg.routes:
		if r.from==id:out.append({"to":r.to,"seconds":int(r.travel_seconds)})
		elif r.to==id and r.bidirectional:out.append({"to":r.from,"seconds":int(r.travel_seconds)})
	return out

static func path(reg,s: Dictionary,origin: String,destination: String) -> Dictionary:
	if not reg.territories.has(origin) or not reg.territories.has(destination):return {}
	var distance={origin:0}
	var prev={}
	var closed={}
	while true:
		var current=""
		var best=2147483647
		for id in distance:
			if not closed.has(id) and int(distance[id])<best:
				current=id
				best=int(distance[id])
		if current=="":return {}
		if current==destination:break
		closed[current]=true
		for edge in edges(reg,current):
			var next=str(edge.to)
			if next!=destination and not s.territory_states[next].discovered:continue
			var cost=best+int(edge.seconds)
			if cost<int(distance.get(next,2147483647)):
				distance[next]=cost
				prev[next]=current
	var route=[destination]
	while route[0]!=origin:route.push_front(prev[route[0]])
	return {"path":route,"seconds":int(distance[destination])}

static func depart(reg,s: Dictionary,destination: String) -> bool:
	if not s.travel.is_empty() or s.team.is_empty() or destination==s.world_location:return false
	var route=path(reg,s,s.world_location,destination)
	if route.is_empty():return false
	s.travel={"destination":destination,"remaining":route.seconds,"path":route.path,"team":s.team.duplicate()}
	return true

static func relation(s: Dictionary,a: String,b: String) -> Dictionary:
	return s.relations.get(relation_key(a,b),{"score":0,"state":"neutral"})

static func diplomacy(reg,s: Dictionary,id: String,action: String) -> bool:
	if id==PLAYER or not reg.factions.has(id):return false
	var r=relation(s,PLAYER,id)
	match action:
		"gift":
			if int(s.inventory.get("RES-001",0))<200:return false
			s.inventory["RES-001"]=int(s.inventory["RES-001"])-200
			s.faction_states[id].stock["RES-001"]=int(s.faction_states[id].stock.get("RES-001",0))+200
			r.score=mini(100,int(r.score)+10)
		"trade":
			if int(r.score)<-30 or r.state=="war":return false
			r.state="trade"
		"ally":
			if int(r.score)<65 or r.state=="war":return false
			r.state="allied"
		"war":
			if r.state=="allied":return false
			r.score=mini(-60,int(r.score))
			r.state="war"
		"peace":
			if r.state!="war" or int(r.score)<-30:return false
			r.state="neutral"
		"break":
			if r.state!="allied" and r.state!="trade":return false
			r.state="neutral"
			r.score=maxi(-100,int(r.score)-15)
		_:return false
	return true

static func price(reg,s: Dictionary,id: String,resource: String,buy: bool) -> int:
	var stock=int(s.faction_states[id].stock.get(resource,0))
	var r=relation(s,PLAYER,id)
	var factor=pow(clampf(251.0/(stock+1),0.5,3.0),0.35)*clampf(1.0-0.002*int(r.score),0.8,1.2)
	return maxi(1,ceili(float(reg.resources[resource].base_price_ryo)*factor*1.1) if buy else floori(float(reg.resources[resource].base_price_ryo)*factor*0.9))

static func trade(reg,s: Dictionary,id: String,resource: String,qty: int,buy: bool) -> bool:
	if not reg.factions.has(id) or id==PLAYER or not reg.resources.has(resource) or resource in ["RES-001","RES-002","RES-003","RES-004","RES-005"] or qty<=0 or qty>100:return false
	if not bool(reg.resources[resource].tradable):return false
	var r=relation(s,PLAYER,id)
	if r.state=="war" or int(r.score)<-30:return false
	if s.territory_states[s.world_location].owner!=id and r.state!="trade" and r.state!="allied":return false
	var stock=s.faction_states[id].stock
	# Price per unit against pre-trade stock; use a single unit transaction in UI.
	var amount=price(reg,s,id,resource,buy)*qty
	var capacity=10000+5000*int(s.building_states["BLD-020"].level)
	if buy:
		if int(stock.get(resource,0))<qty or int(s.inventory.get("RES-001",0))<amount or int(s.inventory.get(resource,0))+qty>capacity:return false
		stock[resource]=int(stock[resource])-qty
		stock["RES-001"]=int(stock.get("RES-001",0))+amount
		s.inventory["RES-001"]=int(s.inventory["RES-001"])-amount
		s.inventory[resource]=int(s.inventory.get(resource,0))+qty
	else:
		if int(stock.get("RES-001",0))<amount or int(s.inventory.get(resource,0))<qty:return false
		stock["RES-001"]=int(stock["RES-001"])-amount
		stock[resource]=int(stock.get(resource,0))+qty
		s.inventory["RES-001"]=int(s.inventory.get("RES-001",0))+amount
		s.inventory[resource]=int(s.inventory[resource])-qty
	s.trade_count=int(s.trade_count)+1
	return true

static func resolve_team(reg,s: Dictionary,player_team: Array,enemy_team: Array,level: int,seed_value: int) -> bool:
	if player_team.is_empty():return false
	var sim=Combat.new()
	sim.registry=reg
	sim.auto_player_ultimate=true
	sim.rng.seed=seed_value
	var slots={}
	if player_team==s.team:
		sim.configure_team_formation(s)
		slots=preload("res://game/formation_service.gd").normalize_slots(player_team,s.get("formation_slots",{}))
	for id in player_team:
		if not s.owned.has(id):return false
		var p=s.owned[id]
		sim.add_actor(id,0,int(p.level),int(p.quality),p.permanent,int(slots.get(id,sim.actors.size())),1.0,p,s.gear_instances)
	var slot=0
	for id in enemy_team:
		sim.add_actor(id,1,level,int(reg.ninjas[id].initial_quality),{},slot,1.0)
		slot+=1
	if enemy_team.is_empty():return true
	for i in range(24000):
		sim.tick(0.05)
		if sim.outcome!="":return sim.outcome=="win"
		if sim.deadlock:return false
	return false

static func capture(reg,s: Dictionary,id: String) -> bool:
	return capture_with(reg,s,id,s.team,s.world_location,s.travel)

static func capture_with(reg,s: Dictionary,id: String,roster: Array,location: String,travel: Dictionary) -> bool:
	if not reg.territories.has(id) or id==HOME or not reg.territories[id].capture_allowed or location!=id or not travel.is_empty() or roster.is_empty():return false
	var state=s.territory_states[id]
	if not state.discovered or state.owner==PLAYER:return false
	var border=false
	for edge in edges(reg,id):
		if s.territory_states[edge.to].owner==PLAYER:border=true
	if not border:return false
	var owner=state.owner
	if owner!=null:
		if relation(s,PLAYER,owner).state!="war":return false
		# Sequential defense teams; each battle uses new actors/full recovery.
		for team in reg.factions[owner].teams:
			var level=maxi(1,floori(float(reg.territories[id].defense_rating)/80.0)+int(s.faction_states[owner].infrastructure.training)-1)
			if not resolve_team(reg,s,roster,team.ninja_template_ids,level,int(s.world_tick)+int(str(id).right(3))*101):
				s.territory_battles=int(s.territory_battles)+1
				note(s,"Thất bại tại "+id)
				return true
	state.owner=PLAYER
	s.territory_battles=int(s.territory_battles)+1
	note(s,"Kiểm soát "+id)
	return true

static func adjacent(reg,s: Dictionary,owner: String,other: String) -> bool:
	for route in reg.routes:
		var a=s.territory_states[route.from].owner
		var b=s.territory_states[route.to].owner
		if (a==owner and b==other) or (b==owner and a==other):return true
	return false

static func raid(reg,s: Dictionary,id: String) -> bool:
	if not reg.factions.has(id) or id==PLAYER or relation(s,id,PLAYER).state!="war" or int(s.raid_protection)>0 or not adjacent(reg,s,id,PLAYER):return false
	var teams=reg.factions[id].teams
	if teams.is_empty():return false
	var defenders=s.home_defense.duplicate()
	if defenders.is_empty() and s.travel.is_empty() and s.world_location==HOME:defenders=s.team.duplicate()
	var lost=not resolve_team(reg,s,defenders,teams[0].ninja_template_ids,maxi(1,4+int(s.faction_states[id].infrastructure.training)+floori(float(s.world_tick)/144.0)),int(s.world_tick)+int(id.right(3))*300)
	s.raid_protection=43200
	if lost:
		for resource in s.inventory:
			if not resource in ["RES-002","RES-003","RES-004","RES-005"]:
				var loss=floori(float(s.inventory[resource])*0.1)
				s.inventory[resource]=int(s.inventory[resource])-loss
				var stock=s.faction_states[id].stock
				stock[resource]=int(stock.get(resource,0))+loss
		for b in s.building_states.values():
			if int(b.level)>0:b.condition=maxf(0.5,float(b.condition)*0.5)
		note(s,"Đột kích "+id+": mất tài nguyên và hư hại công trình")
	else:note(s,"Phòng thủ thành công trước "+id)
	return true

static func npc_tick(reg,s: Dictionary) -> void:
	s.world_tick=int(s.world_tick)+1
	for id in reg.factions:
		if id==PLAYER:continue
		var npc=s.faction_states[id]
		for territory in reg.territories.values():
			if s.territory_states[territory.id].owner!=id:continue
			# NPC territorial market revenue, no player upkeep or tax deduction.
			npc.stock["RES-001"]=mini(50000,int(npc.stock.get("RES-001",0))+8+3*int(npc.infrastructure.production))
			for resource in territory.resources:
				var key=str(resource.resource_id)
				npc.stock[key]=mini(50000,int(npc.stock.get(key,0))+roundi(float(resource.yield_per_tick)*10*(1+0.06*(int(npc.infrastructure.production)-1))))
		var acted=false
		if int(s.world_tick)%6==int(id.right(3))%6:acted=npc_border_action(reg,s,id)
		if not acted:acted=develop_npc(reg,s,id)
		# NPC buys a scarce stock from another NPC with finite money and inventory.
		for resource in ["RES-006","RES-009","RES-021","RES-011"]:
			if acted:break
			if int(npc.stock.get(resource,0))>=50:continue
			for other in reg.factions:
				if other==id or other==PLAYER or relation(s,id,other).state=="war":continue
				var seller=s.faction_states[other].stock
				var unit=maxi(1,int(reg.resources[resource].base_price_ryo))
				var qty=mini(10,mini(int(seller.get(resource,0)),floori(float(npc.stock.get("RES-001",0))/unit)))
				if qty<=0:continue
				npc.stock["RES-001"]=int(npc.stock["RES-001"])-qty*unit
				seller["RES-001"]=int(seller.get("RES-001",0))+qty*unit
				seller[resource]=int(seller[resource])-qty
				npc.stock[resource]=int(npc.stock.get(resource,0))+qty
				acted=true
				break
			if acted:break
		if not acted:
			var r=relation(s,id,PLAYER)
			if r.state=="war" and raid(reg,s,id):acted=true
			elif int(r.score)<=-60 and r.state!="war":
				r.state="war"
				acted=true
		if not acted:
			# Neutral capture only if adjacent and undefended; consume real NPC treasury.
			for territory in reg.territories:
				if s.territory_states[territory].owner!=null or not reg.territories[territory].capture_allowed:continue
				var border=false
				for edge in edges(reg,territory):
					if s.territory_states[edge.to].owner==id:border=true
				if border and int(npc.stock.get("RES-001",0))>=200:
					npc.stock["RES-001"]=int(npc.stock["RES-001"])-200
					s.territory_states[territory].owner=id
					acted=true
					break
		if not acted:acted=npc_border_action(reg,s,id)
		if acted:npc.actions=int(npc.actions)+1

static func step(reg,s: Dictionary,dt: int) -> void:
	if not s.travel.is_empty():
		s.travel.remaining=int(s.travel.remaining)-dt
		if int(s.travel.remaining)<=0:
			var dest=str(s.travel.destination)
			s.world_location=dest
			s.territory_states[dest].discovered=true
			s.territory_states[dest].visits=int(s.territory_states[dest].visits)+1
			s.travel={}
			note(s,"Đến "+dest)
	for squad in s.world_squads.values():
		if squad.travel.is_empty():continue
		squad.travel.remaining=int(squad.travel.remaining)-dt
		if int(squad.travel.remaining)<=0:
			var dest=str(squad.travel.destination)
			squad.location=dest
			squad.travel={}
			s.territory_states[dest].discovered=true
			s.territory_states[dest].visits=int(s.territory_states[dest].visits)+1
			note(s,"Đội phụ đến "+dest)
	s.raid_protection=maxi(0,int(s.raid_protection)-dt)
	s.world_seconds=int(s.world_seconds)+dt
	while int(s.world_seconds)>=600:
		s.world_seconds=int(s.world_seconds)-600
		npc_tick(reg,s)

static func roster_available(s: Dictionary,roster: Array,except: String) -> bool:
	if roster.size()>6:return false
	var seen={}
	for id in roster:
		if not s.owned.has(id) or seen.has(id):return false
		seen[id]=true
		if except!="main" and id in s.team:return false
		if except!="defense" and id in s.home_defense:return false
		for key in s.world_squads:
			if key!=except and id in s.world_squads[key].team:return false
	return true

static func set_squad(s: Dictionary,key: String,roster: Array) -> bool:
	if not roster_available(s,roster,key):return false
	if key=="defense":
		s.home_defense=roster.duplicate()
		return true
	if not s.world_squads.has(key):return false
	var squad=s.world_squads[key]
	if not squad.travel.is_empty() or squad.location!=HOME:return false
	squad.team=roster.duplicate()
	return true

static func depart_squad(reg,s: Dictionary,key: String,destination: String) -> bool:
	if not s.world_squads.has(key):return false
	var squad=s.world_squads[key]
	if not squad.travel.is_empty() or squad.team.is_empty() or squad.location==destination:return false
	var route=path(reg,s,squad.location,destination)
	if route.is_empty():return false
	squad.travel={"destination":destination,"remaining":route.seconds,"path":route.path,"team":squad.team.duplicate()}
	return true

static func capture_squad(reg,s: Dictionary,key: String) -> bool:
	if not s.world_squads.has(key):return false
	var squad=s.world_squads[key]
	return capture_with(reg,s,str(squad.location),squad.team,str(squad.location),squad.travel)

static func develop_npc(reg,s: Dictionary,id: String) -> bool:
	var npc=s.faction_states[id]
	if int(s.world_tick)%12!=int(id.right(3))%12:return false
	var chosen="production"
	var lowest=INF
	for kind in npc.infrastructure:
		var weight=float(reg.factions[id].strategy_weights.get(kind,0.3))
		if kind=="training":weight=float(reg.factions[id].strategy_weights.get("expansion",0.25))
		var score=float(npc.infrastructure[kind])/maxf(0.1,weight)
		if score<lowest:
			lowest=score
			chosen=kind
	var level=int(npc.infrastructure[chosen])
	if level>=100:return false
	var cost={"RES-001":ceili(200*pow(1.12,level-1)),"RES-006":ceili(15*pow(1.10,level-1)),"RES-009":ceili(10*pow(1.10,level-1))}
	for resource in cost:
		if int(npc.stock.get(resource,0))<int(cost[resource]):return false
	for resource in cost:npc.stock[resource]=int(npc.stock[resource])-int(cost[resource])
	npc.infrastructure[chosen]=level+1
	return true

static func strategic_power(reg,s: Dictionary,id: String) -> float:
	var infra=s.faction_states[id].infrastructure
	var strength=0.0
	for team in reg.factions[id].teams:
		for ninja in team.ninja_template_ids:
			var n=reg.ninjas[ninja]
			strength+=float(n.base_stats.strength+n.base_stats.vitality+n.base_stats.spirit)*float(n.initial_quality)
	return strength*(1+0.08*(int(infra.training)-1))

static func npc_border_action(reg,s: Dictionary,id: String) -> bool:
	var npc=s.faction_states[id]
	if int(s.world_tick)-int(npc.last_war_tick)<36:return false
	var tension_seen={}
	for route in reg.routes:
		var target=""
		if s.territory_states[route.from].owner==id:target=route.to
		elif s.territory_states[route.to].owner==id:target=route.from
		if target=="" or not reg.territories[target].capture_allowed:continue
		var owner=s.territory_states[target].owner
		if owner==null or owner==id or owner==PLAYER:continue
		var r=relation(s,id,owner)
		if r.state=="allied" or r.state=="trade":continue
		if r.state!="war":
			if int(s.world_tick)%36==int(id.right(3))%36 and not tension_seen.has(owner):
				tension_seen[owner]=true
				r.score=maxi(-100,int(r.score)-2)
				if int(r.score)<=-60:r.state="war"
			continue
		if int(npc.stock.get("RES-001",0))<300:continue
		npc.last_war_tick=int(s.world_tick)
		npc.stock["RES-001"]=int(npc.stock["RES-001"])-300
		var attack=strategic_power(reg,s,id)
		var defense=strategic_power(reg,s,owner)*(1+0.05*(int(s.faction_states[owner].infrastructure.defense)-1))+float(reg.territories[target].defense_rating)*0.5
		var roll=0.85+float(posmod(int(s.world_tick)*37+int(target.right(3))*17+int(id.right(3))*13,31))/100.0
		s.npc_war_count=int(s.npc_war_count)+1
		if attack*roll>defense:
			s.territory_states[target].owner=id
			note(s,"Chiến tranh NPC: "+id+" chiếm "+target+" từ "+str(owner))
		else:note(s,"Chiến tranh NPC: "+str(owner)+" giữ "+target)
		return true
	return false
