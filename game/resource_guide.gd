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

static func chain(reg,id: String,needed: int,stock: Dictionary,visiting: Dictionary={},depth: int=0) -> Array:
	var shortage=maxi(0,needed-int(stock.get(id,0)))
	if shortage==0:return []
	var out=[{"resource":id,"qty":shortage,"depth":depth}]
	if visiting.has(id) or depth>=10:return out
	var recipes=recipes_for(reg,id)
	if recipes.is_empty():return out
	var seen=visiting.duplicate()
	seen[id]=true
	var recipe=recipes[0]
	var batches=ceili(float(shortage)/maxi(1,int(recipe.output.qty)))
	for item in recipe.inputs:
		out.append_array(chain(reg,str(item.resource_id),batches*int(item.qty),stock,seen,depth+1))
	return out

static func stage_sources(reg,id: String) -> Array:
	var out=[]
	for stage in reg.stages.values():
		for reward in stage.first_clear_rewards+stage.repeat_rewards:
			if reward.resource_id==id:
				out.append(stage.id)
				break
	return out
