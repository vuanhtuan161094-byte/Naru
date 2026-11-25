extends RefCounted
const PATH = "user://naru_save_v1.json"
var state: Dictionary = {}
var rng = RandomNumberGenerator.new()

func new_game(reg) -> void:
	rng.randomize()
	state = {"schema_version":1,"inventory":reg.initial.account_currency.duplicate(true),"owned":{},"team":reg.initial.starter_team.duplicate(),"cleared":{},"stamina":reg.initial.initial_stamina,"pity4":0,"pity5":0,"draws":0,"battle_seq":0,"ledger":{},"rng_seed":str(rng.seed),"rng_state":str(rng.state)}
	for id in reg.initial.ninja_ids:
		grant(reg,id)
	save_now()

func load_or_new(reg) -> void:
	for p in [PATH,PATH+".bak"]:
		if FileAccess.file_exists(p):
			var d = JSON.parse_string(FileAccess.get_file_as_string(p))
			if d is Dictionary and int(d.get("schema_version",0))==1 and d.has("owned") and d.has("inventory") and d.has("rng_state"):
				state=d
				rng.seed=int(str(d.rng_seed))
				rng.state=int(str(d.rng_state))
				return
	new_game(reg)

func save_now() -> bool:
	state.rng_state=str(rng.state)
	var f = FileAccess.open(PATH+".tmp",FileAccess.WRITE)
	if f==null: return false
	f.store_string(JSON.stringify(state))
	f.flush()
	f.close()
	if FileAccess.file_exists(PATH):
		if FileAccess.file_exists(PATH+".bak"): DirAccess.remove_absolute(PATH+".bak")
		if DirAccess.rename_absolute(PATH,PATH+".bak")!=OK: return false
	if DirAccess.rename_absolute(PATH+".tmp",PATH)!=OK:
		if FileAccess.file_exists(PATH+".bak"): DirAccess.rename_absolute(PATH+".bak",PATH)
		return false
	return true

func grant(reg,id: String) -> void:
	if state.owned.has(id):
		var tier = int(reg.ninjas[id].initial_quality)
		state.owned[id].shards=int(state.owned[id].shards)+int(reg.recruit.duplicate_shards_by_quality[tier-1])
	else:
		state.owned[id]={"level":1,"xp":0,"realm":0,"quality":reg.ninjas[id].initial_quality,"stars":1,"shards":0,"mastery":{},"permanent":{}}

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
	state.ledger[id]="started"
	if not save_now():
		state=prior
		return ""
	return id

func finish_stage(reg,stage: Dictionary,event_id: String,won: bool,action_counts: Dictionary) -> bool:
	if state.ledger.get(event_id)!="started": return false
	var prior=state.duplicate(true)
	state.ledger[event_id]="win" if won else "loss"
	if won:
		var rewards=stage.repeat_rewards if state.cleared.has(stage.id) else stage.first_clear_rewards
		for r in rewards:
			state.inventory[r.resource_id]=int(state.inventory.get(r.resource_id,0))+int(r.qty)
		state.cleared[stage.id]=true
		for id in state.team:
			var p=state.owned[id]
			p.xp=int(p.xp)+100
			var cap=(int(p.realm)+1)*20
			while int(p.level)<cap:
				var need=int(ceil(100*pow(float(p.level),1.6)*(1+0.15*float(p.realm))))
				if int(p.xp)<need: break
				p.xp=int(p.xp)-need
				p.level=int(p.level)+1
			var actions=int(action_counts.get(id,0))
			if actions>0: p.permanent.strength=float(p.permanent.get("strength",0))+0.02*sqrt(float(actions))
	if not save_now():
		state=prior
		return false
	return true
