extends RefCounted
const Village=preload("res://game/village_service.gd")
const World=preload("res://game/world_service.gd")
# Read-only source discovery. No resource creation, automatic spending or gate bypass.
static func sellers(reg,s: Dictionary,id: String) -> Array:
	var out=[]
	if not reg.resources.has(id) or not reg.resources[id].tradable:return out
	if id in ["RES-001","RES-002","RES-003","RES-004","RES-005"]:return out
	for faction in reg.factions:
		if faction==World.PLAYER:continue
		var stock=int(s.faction_states[faction].stock.get(id,0))
		if stock<=0:continue
		var relation=World.relation(s,World.PLAYER,faction)
		var accessible=relation.state!="war" and int(relation.score)>=-30 and (relation.state in ["trade","allied"] or (s.travel.is_empty() and s.territory_states[s.world_location].owner==faction))
		out.append({"faction":faction,"stock":stock,"accessible":accessible,"price":World.price(reg,s,faction,id,true)})
	out.sort_custom(func(a,b):return int(a.price)<int(b.price))
	return out

static func recipes_for(reg,id: String) -> Array:
	var out=[]
	for recipe in reg.recipes.values():
		if recipe.output.resource_id==id:out.append(recipe)
	return out

# Allocate shared stock once across all branches; planned outputs are not credited to save.
static func expand(reg,id: String,needed: int,available: Dictionary,visiting: Dictionary,depth: int,rows: Array,orders: Dictionary,raw: Dictionary) -> void:
	var take=mini(needed,int(available.get(id,0)))
	available[id]=int(available.get(id,0))-take
	var shortage=needed-take
	if shortage<=0:return
	rows.append({"resource":id,"qty":shortage,"depth":depth})
	var choices=recipes_for(reg,id)
	if visiting.has(id) or depth>=20 or choices.is_empty():
		raw[id]=int(raw.get(id,0))+shortage
		return
	var recipe=choices[0]
	var batches=ceili(float(shortage)/maxi(1,int(recipe.output.qty)))
	var seen=visiting.duplicate()
	seen[id]=true
	for item in recipe.inputs:
		expand(reg,str(item.resource_id),batches*int(item.qty),available,seen,depth+1,rows,orders,raw)
	orders[recipe.id]=int(orders.get(recipe.id,0))+batches
	available[id]=int(available.get(id,0))+batches*int(recipe.output.qty)-shortage

static func plan(reg,needs: Dictionary,stock: Dictionary) -> Dictionary:
	var available=stock.duplicate()
	var rows=[]
	var orders={}
	var raw={}
	for id in needs:
		expand(reg,str(id),int(needs[id]),available,{},0,rows,orders,raw)
	return {"rows":rows,"orders":orders,"raw":raw}

static func chain(reg,id: String,needed: int,stock: Dictionary,visiting: Dictionary={},depth: int=0) -> Array:
	var rows=[]
	expand(reg,id,needed,stock.duplicate(),visiting,depth,rows,{},{})
	return rows

static func stage_sources(reg,id: String) -> Array:
	var out=[]
	for stage in reg.stages.values():
		for reward in stage.first_clear_rewards+stage.repeat_rewards:
			if reward.resource_id==id:
				out.append(stage.id)
				break
	return out
