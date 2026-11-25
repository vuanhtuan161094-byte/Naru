extends RefCounted
const PATH = "user://naru_save_v1.json"
var state: Dictionary = {}
var rng = RandomNumberGenerator.new()
var save_path = PATH


func new_game(reg) -> void:
	rng.randomize()
	state = {"schema_version":1,"inventory":reg.initial.account_currency.duplicate(true),"owned":{},"team":reg.initial.starter_team.duplicate(),"cleared":{},"stamina":reg.initial.initial_stamina,"pity4":0,"pity5":0,"draws":0,"battle_seq":0,"ledger":{},"rng_seed":str(rng.seed),"rng_state":str(rng.state)}
	for id in reg.initial.ninja_ids:
		grant(reg,id)
	save_now()

func load_or_new(reg) -> void:
	for p in [save_path,save_path+".bak"]:
		if FileAccess.file_exists(p):
			var d = JSON.parse_string(FileAccess.get_file_as_string(p))
			if d is Dictionary and int(d.get("schema_version",0))==1 and d.has("owned") and d.has("inventory") and d.has("rng_state"):
				state=d
				for id in state.owned:
					ensure_growth(state.owned[id])
				rng.seed=int(str(d.rng_seed))
				rng.state=int(str(d.rng_state))
				return
	new_game(reg)

func save_now() -> bool:
	state.rng_state=str(rng.state)
	var f = FileAccess.open(save_path+".tmp",FileAccess.WRITE)
	if f==null: return false
	f.store_string(JSON.stringify(state))
	f.flush()
	f.close()
	if FileAccess.file_exists(save_path):
		if FileAccess.file_exists(save_path+".bak"): DirAccess.remove_absolute(save_path+".bak")
		if DirAccess.rename_absolute(save_path,save_path+".bak")!=OK: return false
	if DirAccess.rename_absolute(save_path+".tmp",save_path)!=OK:
		if FileAccess.file_exists(save_path+".bak"): DirAccess.rename_absolute(save_path+".bak",save_path)
		return false
	return true

func grant(reg,id: String) -> void:
	if state.owned.has(id):
		var tier = int(reg.ninjas[id].initial_quality)
		state.owned[id].shards=int(state.owned[id].shards)+int(reg.recruit.duplicate_shards_by_quality[tier-1])
	else:
		state.owned[id]={"level":1,"xp":0,"realm":0,"quality":reg.ninjas[id].initial_quality,"stars":1,"shards":0,"mastery":{},"permanent":{}}
		ensure_growth(state.owned[id])

func draw(reg) -> String:
	var currency = str(reg.recruit.price.currency)
	var price = int(reg.recruit.price.single)
	if int(state.inventory.get(currency,0))<price: return ""
	var prior = state.duplicate(true)
	var old_rng = rng.state
	var floor_tier = 1
	if int(state.draws)==0: floor_tier=3
	if int(state.pity4)>=19: floor_tier=maxi(floor_tier,4)
	if int(state.pity5)>=79: floor_tier=maxi(floor_tier,5)
	var total = 0.0
	for p in reg.recruit.pool:
		if int(p.quality)>=floor_tier: total+=float(p.weight)
	var roll = rng.randf()*total
	var id = ""
	var tier = 1
	for p in reg.recruit.pool:
		if int(p.quality)<floor_tier: continue
		roll-=float(p.weight)
		if roll<=0:
			tier=int(p.quality)
			id=str(p.ninja_ids[rng.randi_range(0,p.ninja_ids.size()-1)])
			break
	if id.is_empty(): return ""
	state.inventory[currency]=int(state.inventory[currency])-price
	state.draws=int(state.draws)+1
	state.pity4=0 if tier>=4 else int(state.pity4)+1
	state.pity5=0 if tier>=5 else int(state.pity5)+1
	grant(reg,id)
	if not save_now():
		state=prior
		rng.state=old_rng
		return ""
	return id

func begin_stage(stage: Dictionary) -> String:
	if stage.requires!=null and not state.cleared.has(str(stage.requires)): return ""
	if int(state.stamina)<int(stage.stamina_cost) or state.team.is_empty(): return ""
	var prior=state.duplicate(true)
	state.stamina=int(state.stamina)-int(stage.stamina_cost)
	state.battle_seq=int(state.battle_seq)+1
	var id="battle-"+str(state.battle_seq)
	state.ledger[id]={"status":"started","stage_id":stage.id,"team":state.team.duplicate()}
	if not save_now():
		state=prior
		return ""
	return id

func finish_stage(reg,stage: Dictionary,event_id: String,won: bool,action_counts: Dictionary) -> bool:
	var entry=state.ledger.get(event_id)
	if not entry is Dictionary or entry.get("status")!="started" or entry.get("stage_id")!=stage.id: return false
	var prior=state.duplicate(true)
	state.ledger[event_id].status="win" if won else "loss"
	if won:
		var rewards=stage.repeat_rewards if state.cleared.has(stage.id) else stage.first_clear_rewards
		for r in rewards:
			state.inventory[r.resource_id]=int(state.inventory.get(r.resource_id,0))+int(r.qty)
		state.cleared[stage.id]=true
		for id in entry.team:
			var p=state.owned[id]
			p.xp=int(p.xp)+100
			apply_levels(p)
			var actions=int(action_counts.get(id,0))
			# Permanent action growth requires difficulty and anti-farm gates; deferred.
			if actions>0: p.battle_actions=int(p.get("battle_actions",0))+actions
	if not save_now():
		state=prior
		return false
	return true

func ensure_growth(p: Dictionary) -> void:
	for k in {"points":0,"allocated":{},"realm_failures":0,"skill_levels":{},"battle_actions":0}:
		if not p.has(k):
			p[k]={"points":0,"allocated":{},"realm_failures":0,"skill_levels":{},"battle_actions":0}[k]

func apply_levels(p: Dictionary) -> void:
	ensure_growth(p)
	var cap=(int(p.realm)+1)*20
	while int(p.level)<cap:
		var need=int(ceil(100*pow(float(p.level),1.6)*(1+0.15*float(p.realm))))
		if int(p.xp)<need: break
		p.xp=int(p.xp)-need
		p.level=int(p.level)+1
		p.points=int(p.points)+3

func commit_change(prior: Dictionary, old_rng: int) -> bool:
	if save_now(): return true
	state=prior
	rng.state=old_rng
	return false

func set_team(ids: Array) -> bool:
	if ids.size()>6: return false
	var seen={}
	for id in ids:
		if seen.has(id) or not state.owned.has(id): return false
		seen[id]=true
	var prior=state.duplicate(true)
	state.team=ids.duplicate()
	return commit_change(prior,rng.state)

func train(id: String) -> bool:
	if not state.owned.has(id) or int(state.inventory.get("RES-116",0))<1: return false
	var p=state.owned[id]
	if int(p.level)>=(int(p.realm)+1)*20: return false
	var prior=state.duplicate(true)
	state.inventory["RES-116"]=int(state.inventory["RES-116"])-1
	p.xp=int(p.xp)+200
	apply_levels(p)
	return commit_change(prior,rng.state)

func allocate(id: String, stat: String) -> bool:
	if not state.owned.has(id) or not stat in ["strength","vitality","spirit","agility","intellect","potential"]: return false
	var p=state.owned[id]
	ensure_growth(p)
	if int(p.points)<1: return false
	var prior=state.duplicate(true)
	p.points=int(p.points)-1
	p.allocated[stat]=int(p.allocated.get(stat,0))+1
	return commit_change(prior,rng.state)

func breakthrough(id: String) -> String:
	if not state.owned.has(id): return "locked"
	var p=state.owned[id]
	ensure_growth(p)
	if int(p.level)<(int(p.realm)+1)*20: return "locked"
	var cost=int(ceil(3*pow(float(p.realm)+1,1.4)))
	if int(state.inventory.get("RES-128",0))<cost: return "locked"
	var prior=state.duplicate(true)
	var old_rng=rng.state
	state.inventory["RES-128"]=int(state.inventory["RES-128"])-cost
	var fails=int(p.realm_failures)
	var won=fails>=5 or rng.randf()<minf(1.0,0.65+0.08*fails)
	if won:
		p.realm=int(p.realm)+1
		p.realm_failures=0
		p.points=int(p.points)+5
		apply_levels(p)
	else:
		p.realm_failures=fails+1
	if not commit_change(prior,old_rng): return "error"
	return "success" if won else "failure"

func raise_star(reg,id: String) -> bool:
	if not state.owned.has(id): return false
	var p=state.owned[id]
	if int(p.stars)>=15: return false
	var step=reg.growth.stars[int(p.stars)-1]
	if int(p.shards)<int(step.shards): return false
	for r in step.resources:
		if int(state.inventory.get(r.resource_id,0))<int(r.qty): return false
	var prior=state.duplicate(true)
	p.shards=int(p.shards)-int(step.shards)
	for r in step.resources:
		state.inventory[r.resource_id]=int(state.inventory[r.resource_id])-int(r.qty)
	p.stars=int(p.stars)+1
	return commit_change(prior,rng.state)
