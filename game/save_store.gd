extends RefCounted
const World=preload("res://game/world_service.gd")
const Village=preload("res://game/village_service.gd")
const Combat=preload("res://game/combat.gd")
const PATH = "user://naru_save_v1.json"
var state: Dictionary = {}
var rng = RandomNumberGenerator.new()
var save_path = PATH


func new_game(reg) -> void:
	rng.randomize()
	state = {"schema_version":1,"inventory":reg.initial.account_currency.duplicate(true),"owned":{},"team":reg.initial.starter_team.duplicate(),"cleared":{},"stamina":reg.initial.initial_stamina,"pity4":0,"pity5":0,"draws":0,"battle_seq":0,"ledger":{},"rng_seed":str(rng.seed),"rng_state":str(rng.state)}
	ensure_account(reg)
	for id in reg.initial.ninja_ids:
		grant(reg,id)
	save_now()

func load_or_new(reg) -> void:
	for p in [save_path,save_path+".bak"]:
		if FileAccess.file_exists(p):
			var d = JSON.parse_string(FileAccess.get_file_as_string(p))
			if d is Dictionary and int(d.get("schema_version",0))==1 and d.has("owned") and d.has("inventory") and d.has("rng_state"):
				state=d
				ensure_account(reg)
				for id in state.owned:
					ensure_growth(state.owned[id])
					if not state.owned[id].has("talent"):state.owned[id].talent=reg.growth.talents[int(str(id).right(3))%reg.growth.talents.size()].id
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
		state.owned[id].talent=reg.growth.talents[rng.randi_range(0,reg.growth.talents.size()-1)].id

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

func finish_stage(reg,stage: Dictionary,event_id: String,won: bool,action_counts: Dictionary,mastery_counts: Dictionary={}) -> bool:
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
			for skill_id in mastery_counts:
				if skill_allowed(reg,id,skill_id):p.skill_mastery[skill_id]=int(p.skill_mastery.get(skill_id,0))+int(mastery_counts[skill_id])
	if not save_now():
		state=prior
		return false
	return true

func ensure_growth(p: Dictionary) -> void:
	for k in {"points":0,"allocated":{},"realm_failures":0,"skill_levels":{},"battle_actions":0,"gear":{},"unlocked_skills":[],"skill_mastery":{},"quality_trials":{},"forms":[]}:
		if not p.has(k):
			p[k]={"points":0,"allocated":{},"realm_failures":0,"skill_levels":{},"battle_actions":0,"gear":{},"unlocked_skills":[],"skill_mastery":{},"quality_trials":{},"forms":[]}[k]

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
	if ids.size()>6 or not state.get("travel",{}).is_empty(): return false
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

func ensure_account(reg) -> void:
	Village.ensure(reg,state)
	if not state.has("gear_instances"):state.gear_instances={}
	if not state.has("gear_seq"):state.gear_seq=0
	if not state.has("building_states"):
		state.building_states={}
		for b in reg.initial.initial_buildings:state.building_states[b.building_id]=b.duplicate(true)

func skill_allowed(reg,id: String,skill_id: String) -> bool:
	if not state.owned.has(id) or not reg.skills.has(skill_id) or reg.skills[skill_id].ninja_id!=id:return false
	return skill_id in reg.ninjas[id].skills or skill_id in state.owned[id].get("unlocked_skills",[])

func skill_progress(p: Dictionary,skill_id: String) -> Dictionary:
	return p.get("skill_levels",{}).get(skill_id,{"level":1,"grade":1,"fails":0,"branch":""}).duplicate(true)

func skill_book(reg,skill_id: String) -> String:
	match str(reg.skills[skill_id].damage_type):
		"physical":return "RES-118"
		"genjutsu":return "RES-120"
		_:return "RES-119"

func upgrade_skill(reg,id: String,skill_id: String) -> bool:
	if not skill_allowed(reg,id,skill_id) or not reg.skill_policies.has(skill_id):return false
	var p=state.owned[id]
	var sk=skill_progress(p,skill_id)
	if int(sk.level)>=20:return false
	var cost=int(ceil(4*pow(float(sk.level),1.35)*(1+0.25*float(sk.grade))))
	var resource=skill_book(reg,skill_id)
	if int(state.inventory.get(resource,0))<cost:return false
	var prior=state.duplicate(true)
	state.inventory[resource]=int(state.inventory[resource])-cost
	sk.level=int(sk.level)+1
	p.skill_levels[skill_id]=sk
	return commit_change(prior,rng.state)

func advance_skill(reg,id: String,skill_id: String) -> String:
	if not skill_allowed(reg,id,skill_id) or not reg.skill_policies.has(skill_id):return "locked"
	var p=state.owned[id]
	var sk=skill_progress(p,skill_id)
	if int(sk.level)<20:return "locked"
	var cost=int(ceil(5*pow(float(sk.grade),1.45)))
	if int(state.inventory.get("RES-130",0))<cost:return "locked"
	var prior=state.duplicate(true)
	var old_rng=rng.state
	state.inventory["RES-130"]=int(state.inventory["RES-130"])-cost
	var won=int(sk.fails)>=4 or rng.randf()<maxf(0.1,0.75/(1+0.15*(float(sk.grade)-1)))
	if won:
		sk.grade=int(sk.grade)+1
		sk.level=1
		sk.fails=0
	else:sk.fails=int(sk.fails)+1
	p.skill_levels[skill_id]=sk
	if not commit_change(prior,old_rng):return "error"
	return "success" if won else "failure"

func choose_skill_branch(reg,id: String,skill_id: String,branch_id: String) -> bool:
	if not skill_allowed(reg,id,skill_id) or not reg.skill_policies.has(skill_id):return false
	var p=state.owned[id]
	var sk=skill_progress(p,skill_id)
	if not str(sk.branch).is_empty():return false
	for branch in reg.skill_policies[skill_id].branches:
		if branch.id==branch_id and int(sk.grade)>=int(branch.unlock_grade):
			var prior=state.duplicate(true)
			sk.branch=branch_id
			p.skill_levels[skill_id]=sk
			return commit_change(prior,rng.state)
	return false

func has_cost(cost: Dictionary) -> bool:
	for key in cost:
		if int(state.inventory.get(key,0))<int(cost[key]):return false
	return true

func debit(cost: Dictionary) -> void:
	for key in cost:state.inventory[key]=int(state.inventory.get(key,0))-int(cost[key])

func craft_gear(reg,template_id: String) -> String:
	if not reg.gear_templates.has(template_id):return ""
	var def=reg.gear_templates[template_id]
	if int(state.building_states.get(def.craft.building_id,{}).get("level",0))<=0:return ""
	var cost={}
	for r in def.craft.inputs:cost[r.resource_id]=int(cost.get(r.resource_id,0))+int(r.qty)
	if not has_cost(cost):return ""
	var prior=state.duplicate(true)
	debit(cost)
	state.gear_seq=int(state.gear_seq)+1
	var id="GEAR-"+str(state.gear_seq)
	state.gear_instances[id]={"template_id":template_id,"owner":"","enhance":0,"refine":0,"evolution":0,"fails":0,"quality":int(def.quality),"gems":[]}
	if not commit_change(prior,rng.state):return ""
	return id

func equip_gear(reg,id: String,gear_id: String) -> bool:
	if not state.owned.has(id) or not state.gear_instances.has(gear_id):return false
	var gear=state.gear_instances[gear_id]
	if not str(gear.owner).is_empty() and gear.owner!=id:return false
	var slot=str(reg.gear_templates[gear.template_id].slot_id)
	var prior=state.duplicate(true)
	var p=state.owned[id]
	var old=str(p.gear.get(slot,""))
	if not old.is_empty() and state.gear_instances.has(old):state.gear_instances[old].owner=""
	if old==gear_id:
		p.gear.erase(slot)
	else:
		p.gear[slot]=gear_id
		gear.owner=id
	return commit_change(prior,rng.state)

func enhance_gear(gear_id: String,protect: bool=false) -> String:
	if not state.gear_instances.has(gear_id):return "locked"
	var gear=state.gear_instances[gear_id]
	var n=int(gear.enhance)
	var stones=int(ceil(1+float(n)/5))
	var cost={"RES-001":int(ceil(20*pow(1+n,1.65))),"RES-113":stones}
	if protect:cost["RES-115"]=1
	if not has_cost(cost):return "locked"
	var prior=state.duplicate(true)
	var old_rng=rng.state
	debit(cost)
	var won=int(gear.fails)>=20 or rng.randf()<minf(1.0,maxf(0.05,0.95/(1+0.055*n))+0.05*int(gear.fails))
	if won:
		gear.enhance=n+1
		gear.fails=0
	else:
		gear.fails=int(gear.fails)+1
		if protect:state.inventory["RES-113"]=int(state.inventory["RES-113"])+floori(float(stones)*0.5)
	if not commit_change(prior,old_rng):return "error"
	return "success" if won else "failure"

func refine_gear(gear_id: String,evolve: bool=false) -> bool:
	if not state.gear_instances.has(gear_id):return false
	var gear=state.gear_instances[gear_id]
	var field="evolution" if evolve else "refine"
	var resource="RES-132" if evolve else "RES-114"
	var cost={resource:int(ceil((3 if evolve else 5)*pow(float(gear[field])+1,1.4)))}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	debit(cost)
	gear[field]=int(gear[field])+1
	if evolve:gear.quality=mini(8,int(gear.quality)+1)
	return commit_change(prior,rng.state)

func socket_gear(reg,gear_id: String,resource: String,remove: bool=false) -> bool:
	if not state.gear_instances.has(gear_id):return false
	var gear=state.gear_instances[gear_id]
	var allowed=false
	for gem in reg.gear_rules.socket.gems:
		if gem.resource_id==resource:allowed=true
	if not allowed:return false
	var prior=state.duplicate(true)
	if remove:
		if not resource in gear.gems:return false
		gear.gems.erase(resource)
		state.inventory[resource]=int(state.inventory.get(resource,0))+1
	else:
		if gear.gems.size()>=mini(4,floori(float(gear.quality)/2)) or int(state.inventory.get(resource,0))<1:return false
		state.inventory[resource]=int(state.inventory[resource])-1
		gear.gems.append(resource)
	return commit_change(prior,rng.state)

func total_mastery(p: Dictionary) -> int:
	var total=0
	for value in p.skill_mastery.values():total+=int(value)
	return total

func unlock_form(reg,id: String,form_id: String) -> bool:
	if not state.owned.has(id) or not reg.forms.has(form_id):return false
	var p=state.owned[id]
	var def=reg.forms[form_id]
	if def.ninja_id!=id or form_id in p.forms or int(p.realm)<int(def.unlock_realm):return false
	var cost={str(def.require_resource):int(def.resource_count)}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	debit(cost)
	p.forms.append(form_id)
	return commit_change(prior,rng.state)

func trial_ready(reg,id: String,trial_id: String) -> bool:
	if not state.owned.has(id) or not reg.trials.has(trial_id):return false
	var trial=reg.trials[trial_id]
	var p=state.owned[id]
	var req=reg.names[trial.skill_id].unlock_require
	return trial.ninja_id==id and not trial.skill_id in p.unlocked_skills and int(p.realm)>=int(trial.requires_realm) and int(p.skill_mastery.get(req.prior_skill_id,0))>=int(req.mastery) and int(skill_progress(p,req.prior_skill_id).grade)>=int(req.grade)

func duel(reg,id: String,level: int,seed_value: int) -> bool:
	var p=state.owned[id]
	var sim=Combat.new()
	sim.registry=reg
	sim.rng.seed=seed_value
	sim.add_actor(id,0,int(p.level),int(p.quality),p.permanent,0,1.0,p,state.gear_instances)
	sim.add_actor(id,1,level,int(reg.ninjas[id].initial_quality),{},0,1.0)
	for i in range(24000):
		sim.tick(0.05)
		if sim.outcome!="":return sim.outcome=="win"
		if sim.deadlock:return false
	return false

func run_trial(reg,id: String,trial_id: String) -> bool:
	if not trial_ready(reg,id,trial_id):return false
	var p=state.owned[id]
	var prior=state.duplicate(true)
	var old_rng=rng.state
	var won=duel(reg,id,maxi(1,int(p.realm)*20+10),rng.randi())
	if won:p.unlocked_skills.append(reg.trials[trial_id].skill_id)
	if not commit_change(prior,old_rng):return false
	return won

func quality_trial(reg,id: String) -> bool:
	if not state.owned.has(id):return false
	var p=state.owned[id]
	var tier=int(p.quality)
	if tier>=8:return false
	var rule=reg.growth.quality_upgrade_steps[tier-1]
	if int(p.realm)<int(rule.min_realm) or total_mastery(p)<int(rule.min_mastery) or p.quality_trials.has(str(tier)):return false
	var prior=state.duplicate(true)
	var old_rng=rng.state
	var won=duel(reg,id,int(p.realm)*20+1,rng.randi())
	if won:p.quality_trials[str(tier)]=true
	if not commit_change(prior,old_rng):return false
	return won

func evolve_quality(reg,id: String) -> bool:
	if not state.owned.has(id):return false
	var p=state.owned[id]
	var tier=int(p.quality)
	if tier>=8:return false
	var rule=reg.growth.quality_upgrade_steps[tier-1]
	if int(p.realm)<int(rule.min_realm) or total_mastery(p)<int(rule.min_mastery) or not p.quality_trials.has(str(tier)) or int(p.shards)<int(rule.shards):return false
	var cost={}
	for r in rule.resources:cost[r.resource_id]=int(r.qty)
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	debit(cost)
	p.shards=int(p.shards)-int(rule.shards)
	p.quality=tier+1
	return commit_change(prior,rng.state)

func advance_clock(reg,now: int) -> bool:
	var prior=state.duplicate(true)
	if not Village.advance(reg,state,now):return false
	return commit_change(prior,rng.state)

func construct(reg,id: String) -> bool:
	var prior=state.duplicate(true)
	if not Village.construct(reg,state,id):return false
	return commit_change(prior,rng.state)

func assign_job(reg,ninja: String,id: String,profession: String) -> bool:
	var prior=state.duplicate(true)
	if not Village.assign(reg,state,ninja,id,profession):return false
	return commit_change(prior,rng.state)

func production(reg,id: String,recipe: String,repeat: bool) -> bool:
	var prior=state.duplicate(true)
	if not Village.queue_recipe(reg,state,id,recipe,repeat):return false
	return commit_change(prior,rng.state)

func cancel_production(id: String) -> bool:
	var prior=state.duplicate(true)
	if not Village.cancel(state,id):return false
	return commit_change(prior,rng.state)

func travel_to(reg,id: String) -> bool:
	var prior=state.duplicate(true)
	if not World.depart(reg,state,id):return false
	return commit_change(prior,rng.state)

func diplomatic_action(reg,id: String,action: String) -> bool:
	var prior=state.duplicate(true)
	if not World.diplomacy(reg,state,id,action):return false
	return commit_change(prior,rng.state)

func trade_resource(reg,id: String,resource: String,qty: int,buy: bool) -> bool:
	var prior=state.duplicate(true)
	if not World.trade(reg,state,id,resource,qty,buy):return false
	return commit_change(prior,rng.state)

func capture_territory(reg,id: String) -> bool:
	var prior=state.duplicate(true)
	if not World.capture(reg,state,id):return false
	return commit_change(prior,rng.state)

func repair_building(reg,id: String) -> bool:
	if not reg.buildings.has(id):return false
	var b=state.building_states[id]
	if int(b.level)<=0 or float(b.condition)>=1:return false
	var cost={"RES-001":ceili(float(reg.buildings[id].base_upgrade_ryo)*(1-float(b.condition))*int(b.level))}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	debit(cost)
	b.condition=1.0
	return commit_change(prior,rng.state)
