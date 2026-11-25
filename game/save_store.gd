extends RefCounted
const Passive=preload("res://game/passive_service.gd")
const Rewards=preload("res://game/world_rewards.gd")
const Quotes=preload("res://game/progression_quotes.gd")
const Stats=preload("res://game/stats_service.gd")
const SaveGuard=preload("res://game/save_guard.gd")
const Content=preload("res://game/content_service.gd")
const World=preload("res://game/world_service.gd")
const Village=preload("res://game/village_service.gd")
const Combat=preload("res://game/combat.gd")
const Formation=preload("res://game/formation_service.gd")
const PATH = "user://naru_save_v1.json"
var state: Dictionary = {}
var rng = RandomNumberGenerator.new()
var save_path = PATH
var load_notice=""


func new_game(reg) -> void:
	rng.randomize()
	state = {"schema_version":1,"inventory":reg.initial.account_currency.duplicate(true),"owned":{},"team":reg.initial.starter_team.duplicate(),"cleared":{},"stamina":reg.initial.initial_stamina,"pity4":0,"pity5":0,"draws":0,"battle_seq":0,"ledger":{},"rng_seed":str(rng.seed),"rng_state":str(rng.state)}
	ensure_account(reg)
	for id in reg.initial.ninja_ids:
		grant(reg,id)
	save_now()

func load_or_new(reg) -> void:
	load_notice=""
	for p in [save_path,save_path+".bak",save_path+".tmp"]:
		if FileAccess.file_exists(p):
			var d = JSON.parse_string(FileAccess.get_file_as_string(p))
			if SaveGuard.valid(reg,d):
				if p!=save_path:
					load_notice="Đã phục hồi từ bản dự phòng."
					if FileAccess.file_exists(save_path):
						DirAccess.rename_absolute(save_path,save_path+".corrupt-"+str(Time.get_ticks_usec()))
				state=d
				ensure_account(reg)
				for id in state.owned:
					ensure_growth(state.owned[id])
					Passive.migrate(id,state.owned[id])
					if not state.owned[id].has("talent"):state.owned[id].talent=reg.growth.talents[int(str(id).right(3))%reg.growth.talents.size()].id
				rng.seed=int(str(d.rng_seed))
				rng.state=int(str(d.rng_state))
				# Interrupted battles are refunded once, in the same persisted transaction.
				var prior=state.duplicate(true)
				if recover_interrupted(reg):commit_change(prior,rng.state)
				return
	for p in [save_path,save_path+".bak",save_path+".tmp"]:
		if FileAccess.file_exists(p):
			DirAccess.rename_absolute(p,p+".corrupt-"+str(Time.get_ticks_usec()))
			load_notice="Save cũ không hợp lệ; đã giữ bản lỗi riêng và tạo hồ sơ mới."
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
		Passive.migrate(id,state.owned[id])
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
	Content.bump(state,"recruit")
	if not save_now():
		state=prior
		rng.state=old_rng
		return ""
	return id

func begin_stage(stage: Dictionary) -> String:
	for event in state.ledger.values():
		if event is Dictionary and event.get("status")=="started":return ""
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

func finish_stage(reg,stage: Dictionary,event_id: String,won: bool,action_counts: Dictionary,mastery_counts: Dictionary={},action_stats: Dictionary={},passive_mastery: Dictionary={}) -> bool:
	var entry=state.ledger.get(event_id)
	if not entry is Dictionary or entry.get("status")!="started" or entry.get("stage_id")!=stage.id: return false
	var prior=state.duplicate(true)
	var old_rng=rng.state
	state.ledger[event_id].status="win" if won else "loss"
	if won:
		var rewards=stage.repeat_rewards if state.cleared.has(stage.id) else stage.first_clear_rewards
		for r in rewards:
			grant_reward(str(r.resource_id),int(r.qty))
		state.cleared[stage.id]=true
		Content.bump(state,"clear_stage")
		if stage.boss_id!=null and int(state.building_states["BLD-001"].level)>=8:
			for source in reg.supply:
				if source.source_type!="boss_or_contract":continue
				var building=str(source.building_id)
				# Contract hall is available at HQ13; other special resources still require Beast Hall.
				if source.resource_id=="RES-148" and Village.level(state,"BLD-026")>0:building="BLD-026"
				if Village.level(state,building)>0:grant_reward(str(source.resource_id),int(source.base_yield))
		for id in entry.team:
			var p=state.owned[id]
			var earned_xp=int(reg.campaign_xp.get(stage.id,{}).get("battle_xp",100+15*int(str(stage.id).right(3))))
			var stats=Stats.derive(reg,reg.ninjas[id],p)
			p.xp=int(p.xp)+roundi(earned_xp*(1+Stats.effect(reg,stats,"xp_efficiency")))
			apply_levels(p)
			var actions=int(action_counts.get(id,0))
			var difficulty=stage_difficulty(reg,stage,entry.team)
			if actions>0 and difficulty>=0.1:
				p.battle_actions=int(p.get("battle_actions",0))+actions
				var breakdown=action_stats.get(id,{"strength":actions})
				for stat in breakdown:
					if not stat in ["strength","vitality","intellect","spirit","agility","potential"]:continue
					var prior_gain=float(p.permanent.get(stat,0))
					p.permanent[stat]=prior_gain+0.02*sqrt(float(breakdown[stat]))*difficulty*rng.randf_range(0.9,1.1)/pow(1+prior_gain/100.0,0.7)
			if difficulty>=0.1:
				Passive.migrate(id,p)
				for passive_id in passive_mastery:
					if p.passive_progress.has(passive_id) and reg.passives[passive_id].ninja_id==id:p.passive_progress[passive_id].mastery=int(p.passive_progress[passive_id].mastery)+1
			for skill_id in mastery_counts:
				if skill_allowed(reg,id,skill_id):
					var talent=reg.ninjas[id].unique_talent_design
					var factor=float(talent.value) if talent.skill_id==skill_id and talent.bonus=="mastery_gain_multiplier" else 1.0
					p.skill_mastery[skill_id]=int(p.skill_mastery.get(skill_id,0))+maxi(1,roundi(float(mastery_counts[skill_id])*factor))
	if not save_now():
		state=prior
		rng.state=old_rng
		return false
	return true

func ensure_growth(p: Dictionary) -> void:
	for k in {"points":0,"allocated":{},"realm_failures":0,"skill_levels":{},"battle_actions":0,"gear":{},"unlocked_skills":[],"skill_mastery":{},"quality_trials":{},"forms":[],"bloodline_levels":{},"summon_contract":"","beast_id":""}:
		if not p.has(k):
			p[k]={"points":0,"allocated":{},"realm_failures":0,"skill_levels":{},"battle_actions":0,"gear":{},"unlocked_skills":[],"skill_mastery":{},"quality_trials":{},"forms":[],"bloodline_levels":{},"summon_contract":"","beast_id":""}[k]

func apply_levels(p: Dictionary) -> void:
	ensure_growth(p)
	var cap=(int(p.realm)+1)*20
	while int(p.level)<cap:
		var need=Quotes.xp_need(int(p.level),int(p.realm))
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
	if ids.size()>6 or state.get("world_location",World.HOME)!=World.HOME or not state.get("travel",{}).is_empty() or not World.roster_available(state,ids,"main"): return false
	var seen={}
	for id in ids:
		if seen.has(id) or not state.owned.has(id): return false
		seen[id]=true
	var prior=state.duplicate(true)
	state.team=ids.duplicate()
	state.formation_slots=Formation.normalize_slots(state.team)
	return commit_change(prior,rng.state)

func set_formation_slot(slot: int,id: String) -> bool:
	if slot<0 or slot>8 or state.get("world_location",World.HOME)!=World.HOME or not state.get("travel",{}).is_empty():return false
	var positions=Formation.normalize_slots(state.team,state.get("formation_slots",{}))
	var occupied=""
	for ninja in positions:
		if int(positions[ninja])==slot:occupied=str(ninja);break
	var team=state.team.duplicate()
	if id=="":
		if occupied=="":return false
		team.erase(occupied)
		positions.erase(occupied)
	elif not state.owned.has(id):return false
	elif id in team:
		var old=int(positions[id])
		positions[id]=slot
		if occupied!="" and occupied!=id:positions[occupied]=old
	else:
		if occupied!="":
			team.erase(occupied)
			positions.erase(occupied)
		if team.size()>=6:return false
		team.append(id)
		positions[id]=slot
	if not World.roster_available(state,team,"main"):return false
	var prior=state.duplicate(true)
	team.sort_custom(func(a,b):return int(positions[a])<int(positions[b]))
	state.team=team
	state.formation_slots=positions
	return commit_change(prior,rng.state)

func select_formation(reg,id: String) -> bool:
	if not reg.formations.has(id) or not state.get("travel",{}).is_empty():return false
	var prior=state.duplicate(true)
	state.formation_id=id
	return commit_change(prior,rng.state)

func upgrade_formation(reg,id: String) -> bool:
	if not reg.formations.has(id) or not state.get("travel",{}).is_empty():return false
	var level=int(state.formation_levels.get(id,1))
	if level>=int(reg.combat_v3.upgrade.max_level):return false
	var currency=str(reg.combat_v3.upgrade.currency)
	var cost={currency:Formation.cost(reg,level)}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	debit(cost)
	state.formation_levels[id]=level+1
	return commit_change(prior,rng.state)

func train(id: String) -> bool:
	if not state.owned.has(id) or int(state.inventory.get("RES-116",0))<1: return false
	var p=state.owned[id]
	if int(p.level)>=(int(p.realm)+1)*20: return false
	var prior=state.duplicate(true)
	state.inventory["RES-116"]=int(state.inventory["RES-116"])-1
	p.xp=int(p.xp)+200
	Content.bump(state,"train_ninja")
	apply_levels(p)
	return commit_change(prior,rng.state)

func allocate(id: String, stat: String,quantity: int=1) -> bool:
	if not state.owned.has(id) or not stat in ["strength","vitality","spirit","agility","intellect","potential"]: return false
	var p=state.owned[id]
	ensure_growth(p)
	if quantity<1 or quantity>100 or int(p.points)<quantity:return false
	var prior=state.duplicate(true)
	p.points=int(p.points)-quantity
	p.allocated[stat]=int(p.allocated.get(stat,0))+quantity
	return commit_change(prior,rng.state)

func breakthrough(id: String) -> String:
	if not state.owned.has(id): return "locked"
	var p=state.owned[id]
	ensure_growth(p)
	if int(p.level)<(int(p.realm)+1)*20: return "locked"
	var cost=Quotes.realm_cost(int(p.realm))
	if int(state.inventory.get("RES-128",0))<cost: return "locked"
	var prior=state.duplicate(true)
	var old_rng=rng.state
	state.inventory["RES-128"]=int(state.inventory["RES-128"])-cost
	var fails=int(p.realm_failures)
	var won=fails>=5 or rng.randf()<Quotes.realm_chance(fails)
	if won:
		p.realm=int(p.realm)+1
		Passive.migrate(id,p)
		p.realm_failures=0
		p.points=int(p.points)+5
		apply_levels(p)
	else:
		p.realm_failures=fails+1
	if not commit_change(prior,old_rng): return "error"
	return "success" if won else "failure"

# DEV targeted conversion only for owned versions, preserving draw pity and duplicate identity.
func shard_exchange_cost(quantity: int) -> Dictionary:
	return {"RES-134":quantity*2,"RES-001":quantity*200}

func exchange_shards(id: String,quantity: int) -> bool:
	if not state.owned.has(id) or quantity<1 or quantity>20 or Village.level(state,"BLD-001")<5 or Village.level(state,"BLD-009")<=0:return false
	var cost=shard_exchange_cost(quantity)
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	debit(cost)
	state.owned[id].shards=int(state.owned[id].shards)+quantity
	return commit_change(prior,rng.state)

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
	Formation.ensure(reg,state)
	Village.ensure(reg,state)
	Content.ensure(state)
	if not state.has("gear_instances"):state.gear_instances={}
	if not state.has("gear_seq"):state.gear_seq=0
	if not state.has("reward_inbox"):state.reward_inbox={}
	if not state.has("lifetime_counts"):state.lifetime_counts={}
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

func upgrade_skill(reg,id: String,skill_id: String,limit: int=1) -> bool:
	if not skill_allowed(reg,id,skill_id) or not reg.skill_policies.has(skill_id) or limit<1 or limit>20:return false
	var p=state.owned[id]
	var sk=skill_progress(p,skill_id)
	var resource=skill_book(reg,skill_id)
	var quote=Quotes.skill_batch(int(sk.level),int(sk.grade),int(state.inventory.get(resource,0)),limit)
	if int(quote.count)==0:return false
	var prior=state.duplicate(true)
	debit({resource:quote.cost})
	sk.level=int(sk.level)+int(quote.count)
	p.skill_levels[skill_id]=sk
	return commit_change(prior,rng.state)

func advance_skill(reg,id: String,skill_id: String) -> String:
	if not skill_allowed(reg,id,skill_id) or not reg.skill_policies.has(skill_id):return "locked"
	var p=state.owned[id]
	var sk=skill_progress(p,skill_id)
	if int(sk.level)<20:return "locked"
	var cost=Quotes.advance_cost(int(sk.grade))
	if int(state.inventory.get("RES-130",0))<cost:return "locked"
	var prior=state.duplicate(true)
	var old_rng=rng.state
	state.inventory["RES-130"]=int(state.inventory["RES-130"])-cost
	var won=int(sk.fails)>=4 or rng.randf()<Quotes.grade_chance(int(sk.grade),int(sk.fails))
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

# DEV early-game alternative: only Q1, fixed quality, no high-tier forge bypass.
func starter_gear_cost(reg,template_id: String) -> Dictionary:
	if not reg.gear_templates.has(template_id) or int(reg.gear_templates[template_id].quality)!=1:return {}
	var def=reg.gear_templates[template_id]
	if def.craft.building_id=="BLD-017":return {"RES-001":180,"RES-006":3,"RES-011":2}
	return {"RES-001":180,"RES-006":3,"RES-076":2}

func craft_gear(reg,template_id: String,starter: bool=false) -> String:
	if not reg.gear_templates.has(template_id):return ""
	var def=reg.gear_templates[template_id]
	var building=str(def.craft.building_id)
	var cost={}
	if starter:
		if Village.level(state,"BLD-001")<2 or Village.level(state,"BLD-002")<1:return ""
		cost=starter_gear_cost(reg,template_id)
		if cost.is_empty():return ""
		building="BLD-002"
	else:
		if Village.level(state,building)<=0:return ""
		for r in def.craft.inputs:cost[r.resource_id]=int(cost.get(r.resource_id,0))+int(r.qty)
	if not has_cost(cost):return ""
	var prior=state.duplicate(true)
	var old_rng=rng.state
	debit(cost)
	state.gear_seq=int(state.gear_seq)+1
	var id="GEAR-"+str(state.gear_seq)
	Content.bump(state,"craft_item")
	var profession_level=0 if starter else Village.worker_level(state,building)
	var quality=1 if starter else clampi(floori(1+0.04*profession_level+0.5*float(def.quality)+2*Village.trait_bonus(state,building,"quality")+rng.randf_range(0,1.5)),1,8)
	var affixes=[]
	var pool=reg.affix_pools[def.affix_pool].duplicate()
	for i in range(mini(int(def.affix_slots),pool.size())):
		var index=rng.randi_range(0,pool.size()-1)
		affixes.append({"stat":pool[index],"value":maxi(1,floori((1+quality)*(1+0.05*profession_level)*rng.randf_range(0.8,1.2)))})
		pool.remove_at(index)
	state.gear_instances[id]={"template_id":template_id,"owner":"","enhance":0,"refine":0,"evolution":0,"fails":0,"quality":quality,"gems":[],"affixes":affixes,"set_id":"","pending_affix":{}}
	if not commit_change(prior,old_rng):return ""
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
	var cost=Quotes.enhancement_cost(n,protect)
	if not has_cost(cost):return "locked"
	var prior=state.duplicate(true)
	var old_rng=rng.state
	debit(cost)
	var won=int(gear.fails)>=20 or rng.randf()<Quotes.enhancement_chance(n,int(gear.fails))
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

func set_gear_set(reg,gear_id: String,set_id: String) -> bool:
	if not state.gear_instances.has(gear_id):return false
	var item=state.gear_instances[gear_id]
	if str(item.get("set_id",""))!="":return false
	var allowed=false
	for rule in reg.gear_rules.sets:
		if rule.id==set_id and reg.gear_templates[item.template_id].slot_id in rule.eligible_slots:allowed=true
	if not allowed or not has_cost({"RES-112":5}):return false
	var prior=state.duplicate(true)
	debit({"RES-112":5})
	item.set_id=set_id
	return commit_change(prior,rng.state)

func reroll_affix(reg,id: String,index: int) -> bool:
	if not state.gear_instances.has(id):return false
	var item=state.gear_instances[id]
	var affixes=item.get("affixes",[])
	if index<0 or index>=affixes.size() or not item.get("pending_affix",{}).is_empty() or not has_cost({"RES-112":5}):return false
	var prior=state.duplicate(true)
	var old_rng=rng.state
	var pool=reg.affix_pools[reg.gear_templates[item.template_id].affix_pool]
	debit({"RES-112":5})
	item.pending_affix={"index":index,"stat":pool[rng.randi_range(0,pool.size()-1)],"value":maxi(1,floori((1+int(item.quality))*rng.randf_range(0.8,1.2)))}
	return commit_change(prior,old_rng)

func settle_affix(id: String,accept: bool) -> bool:
	if not state.gear_instances.has(id):return false
	var item=state.gear_instances[id]
	var pending=item.get("pending_affix",{})
	if pending.is_empty():return false
	var prior=state.duplicate(true)
	if accept:item.affixes[int(pending.index)]={"stat":pending.stat,"value":pending.value}
	item.pending_affix={}
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
		Rewards.deliver(state,resource,1)
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
	sim.auto_player_ultimate=true
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

func production(reg,id: String,recipe: String,repeat: bool,batches: int=1) -> bool:
	var prior=state.duplicate(true)
	if not Village.queue_recipe(reg,state,id,recipe,repeat,batches):return false
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
	Content.bump(state,"trade")
	return commit_change(prior,rng.state)

func harvest_territory(reg,territory: String,resource: String) -> bool:
	var prior=state.duplicate(true)
	if not World.harvest(reg,state,territory,resource):return false
	Content.bump(state,"collect_production")
	return commit_change(prior,rng.state)

func capture_territory(reg,id: String) -> bool:
	var prior=state.duplicate(true)
	if not World.capture(reg,state,id):return false
	Content.bump(state,"territory_battle")
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

func claim_quest(reg,id: String) -> bool:
	var prior=state.duplicate(true)
	if not Content.claim(reg,state,id):return false
	return commit_change(prior,rng.state)

func start_mission(reg,id: String,resource: String,repeat: bool=false) -> bool:
	var prior=state.duplicate(true)
	if not Content.start_mission(reg,state,id,resource,repeat):return false
	return commit_change(prior,rng.state)

func resource_trial(reg,id: String,resource: String) -> bool:
	if not state.owned.has(id):return false
	var source=Content.source_for(reg,resource)
	if source.is_empty() or not source.source_type in ["trial","bloodline_trial"]:return false
	if int(state.building_states[source.building_id].level)<=0 or int(state.building_states["BLD-001"].level)<int(source.source_min_hq):return false
	var now=int(state.simulation_seconds)
	var key=id+":"+resource
	if int(state.source_cooldowns.get(key,0))>now:return false
	var p=state.owned[id]
	var prior=state.duplicate(true)
	var old_rng=rng.state
	var won=duel(reg,id,maxi(1,int(p.realm)*20+1),rng.randi())
	state.source_cooldowns[key]=now+int(source.period_seconds)
	if won:Rewards.deliver(state,resource,int(source.base_yield))
	if not commit_change(prior,old_rng):return false
	return won

func native_bloodline(reg,id: String,bloodline: String) -> bool:
	if not state.owned.has(id) or not reg.bloodlines.has(bloodline):return false
	var p=state.owned[id]
	var def=reg.bloodlines[bloodline]
	# Native affinity is derived only from the authored template; implants/Rinnegan remain held.
	if not native_bloodline_allowed(reg,id,bloodline):return false
	var current=int(p.bloodline_levels.get(bloodline,0))
	if current>=int(def.progression.tier_max) or int(p.realm)<int(def.native_unlock.realm):return false
	if current==0:
		for other in p.bloodline_levels:
			if reg.bloodlines[other].exclusive_group==def.exclusive_group:return false
	var qty=int(def.native_unlock.resource_qty) if current==0 else ceili(10*pow(float(current),1.6))
	var cost={str(def.resource_id):qty}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	debit(cost)
	p.bloodline_levels[bloodline]=current+1
	return commit_change(prior,rng.state)

func capture_beast(reg,id: String,beast_id: String) -> bool:
	if not state.owned.has(id) or not reg.beasts.has(beast_id) or state.beasts.has(beast_id):return false
	var p=state.owned[id]
	var def=reg.beasts[beast_id]
	var req=def.capture_requires
	if int(p.realm)<int(req.realm) or int(state.building_states["BLD-027"].level)<=0:return false
	var cost={str(req.seal_resource):int(req.seal_qty)}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	var old_rng=rng.state
	debit(cost)
	var sim=Combat.new()
	sim.registry=reg
	sim.auto_player_ultimate=true
	sim.rng.seed=rng.randi()
	sim.add_actor(id,0,int(p.level),int(p.quality),p.permanent,0,1.0,p,state.gear_instances)
	sim.add_beast(beast_id,int(req.realm)*20+10)
	var won=false
	for i in range(24000):
		sim.tick(0.05)
		if sim.outcome!="":
			won=sim.outcome=="win"
			break
		if sim.deadlock:break
	if won:
		state.beasts[beast_id]={"host":"","level":1,"xp":0}
		for reward in def.capture_reward:
			Rewards.deliver(state,str(reward.resource_id),int(reward.qty))
	if not commit_change(prior,old_rng):return false
	return won

func bind_beast(reg,id: String,beast_id: String) -> bool:
	if not state.owned.has(id) or not state.beasts.has(beast_id):return false
	var p=state.owned[id]
	var beast=state.beasts[beast_id]
	if not id in reg.beasts[beast_id].compatibility.preferred_host_ids or str(p.beast_id)!="" or str(beast.host)!="":return false
	var prior=state.duplicate(true)
	var cost={"RES-100":int(reg.beasts[beast_id].capture_requires.seal_qty)}
	if not has_cost(cost):return false
	debit(cost)
	beast.host=id
	p.beast_id=beast_id
	return commit_change(prior,rng.state)

func train_beast(reg,beast_id: String,quantity: int=1) -> bool:
	if not state.beasts.has(beast_id) or quantity<1 or quantity>100:return false
	var b=state.beasts[beast_id]
	var resource=str(reg.beasts[beast_id].training_resource)
	if int(state.inventory.get(resource,0))<quantity:return false
	var prior=state.duplicate(true)
	debit({resource:quantity})
	b.xp=int(b.xp)+100*quantity
	while int(b.xp)>=ceili(100*pow(float(b.level),1.6)):
		b.xp=int(b.xp)-ceili(100*pow(float(b.level),1.6))
		b.level=int(b.level)+1
	return commit_change(prior,rng.state)

func make_contract(reg,id: String) -> bool:
	if not reg.contracts.has(id) or state.summon_contracts.has(id) or int(state.building_states["BLD-026"].level)<=0:return false
	var def=reg.contracts[id]
	var cost={str(def.contract_resource):int(def.contract_qty)}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	debit(cost)
	state.summon_contracts[id]={"owner":"","level":1}
	return commit_change(prior,rng.state)

func assign_contract(id: String,ninja: String) -> bool:
	if not state.summon_contracts.has(id) or not state.owned.has(ninja):return false
	var c=state.summon_contracts[id]
	var p=state.owned[ninja]
	if str(c.owner)!="" or str(p.summon_contract)!="":return false
	var prior=state.duplicate(true)
	c.owner=ninja
	p.summon_contract=id
	return commit_change(prior,rng.state)

func contract_training_cost(id: String,quantity: int=1) -> int:
	if not state.summon_contracts.has(id) or quantity<1 or quantity>20:return 0
	var total=0
	var level=int(state.summon_contracts[id].level)
	for n in range(level,level+quantity):total+=ceili(30*pow(float(n),1.5))
	return total

func train_contract(id: String,quantity: int=1) -> bool:
	if not state.summon_contracts.has(id) or quantity<1 or quantity>20:return false
	var c=state.summon_contracts[id]
	var cost={"RES-001":contract_training_cost(id,quantity)}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	debit(cost)
	c.level=int(c.level)+quantity
	return commit_change(prior,rng.state)

func stage_difficulty(reg,stage: Dictionary,team: Array) -> float:
	var player=0.0
	for id in team:
		var p=state.owned[id]
		var base=Stats.derive(reg,reg.ninjas[id],{"level":p.level,"quality":p.quality})
		var actual=Stats.derive(reg,reg.ninjas[id],p)
		var ratio=0.0
		for key in ["hp","patk","natk","armor","nres"]:ratio+=float(actual[key])/maxf(1.0,float(base[key]))
		var equipment_bonus=0.0
		for gear_id in p.get("gear",{}).values():
			var gear=state.gear_instances.get(gear_id,{})
			if not gear.is_empty():equipment_bonus+=0.02*float(gear.quality)*(1+0.06*float(gear.enhance)+0.025*float(gear.refine))
		player+=float(p.level)*float(p.quality)*(1+0.04*(int(p.stars)-1))*maxf(1.0,ratio/5.0+equipment_bonus)
	var enemy=0.0
	for id in stage.enemy_ids:
		var npc=reg.npcs[id]
		enemy+=float(npc.level)*clampi(int(reg.ninjas[npc.template_ninja_id].initial_quality)+int(npc.quality_bonus),1,8)*float(npc.stat_multiplier)
	return clampf(enemy/maxf(1.0,player),0.0,1.5)

func export_save() -> String:
	return JSON.stringify(state,"\t")

func recover_interrupted(reg) -> bool:
	var changed=false
	for event in state.ledger.values():
		if event is Dictionary and event.get("status")=="started" and reg.stages.has(event.get("stage_id","")):
			state.stamina=mini(120,int(state.stamina)+int(reg.stages[event.stage_id].stamina_cost))
			event.status="interrupted"
			changed=true
	return changed

func import_save(reg,raw: String) -> bool:
	if raw.length()>8000000:return false
	var data=JSON.parse_string(raw)
	if not SaveGuard.valid(reg,data):return false
	# Import cannot move the high-water clock backwards.
	if int(data.get("high_water_timestamp",0))<int(state.get("high_water_timestamp",0)):return false
	var prior=state.duplicate(true)
	var old_rng=rng.state
	state=data
	ensure_account(reg)
	for id in state.owned:
		ensure_growth(state.owned[id])
		Passive.migrate(id,state.owned[id])
	rng.seed=int(str(state.rng_seed))
	rng.state=int(str(state.rng_state))
	recover_interrupted(reg)
	return commit_change(prior,old_rng)

func stop_mission(id: String) -> bool:
	if not state.missions.has(id):return false
	var prior=state.duplicate(true)
	state.missions.erase(id)
	return commit_change(prior,rng.state)

func choose_job_talent(id: String,profession: String,talent: String) -> bool:
	var prior=state.duplicate(true)
	if not Village.choose_talent(state,id,profession,talent):return false
	return commit_change(prior,rng.state)

func set_world_squad(key: String,roster: Array) -> bool:
	var prior=state.duplicate(true)
	if not World.set_squad(state,key,roster):return false
	if not state.has("squad_formations"):state.squad_formations={}
	var old=state.squad_formations.get(key,{"formation_id":"FRM-01","slots":{}})
	old.slots=Formation.normalize_slots(roster,old.slots)
	state.squad_formations[key]=old
	return commit_change(prior,rng.state)

func squad_travel(reg,key: String,dest: String) -> bool:
	var prior=state.duplicate(true)
	if not World.depart_squad(reg,state,key,dest):return false
	return commit_change(prior,rng.state)

func squad_capture(reg,key: String) -> bool:
	var prior=state.duplicate(true)
	if not World.capture_squad(reg,state,key):return false
	Content.bump(state,"territory_battle")
	return commit_change(prior,rng.state)

func train_batch(reg,id: String,resource: String,quantity: int) -> bool:
	if not state.owned.has(id) or not resource in ["RES-116","RES-117"] or quantity<1 or quantity>100:return false
	if int(state.inventory.get(resource,0))<quantity:return false
	var p=state.owned[id]
	if int(p.level)>=(int(p.realm)+1)*20:return false
	var prior=state.duplicate(true)
	var stats=Stats.derive(reg,reg.ninjas[id],p)
	var base=200 if resource=="RES-116" else 1000
	debit({resource:quantity})
	p.xp=int(p.xp)+roundi(base*quantity*(1+Stats.effect(reg,stats,"xp_efficiency")))
	Content.bump(state,"train_ninja",quantity)
	apply_levels(p)
	return commit_change(prior,rng.state)

func training_quote(id: String,stat: String) -> Dictionary:
	var p=state.owned[id]
	var mapping={"strength":["BLD-003","RES-118"],"vitality":["BLD-003","RES-122"],"spirit":["BLD-005","RES-124"],"agility":["BLD-003","RES-118"],"intellect":["BLD-004","RES-123"],"potential":["BLD-006","RES-135"]}
	if not mapping.has(stat):return {}
	var row=mapping[stat]
	var current=float(p.get("training",{}).get(stat,0))
	return {"building":row[0],"resource":row[1],"ryo":ceili(80*pow(1+current,1.35)),"qty":ceili(1+current/10.0)}

func train_stat(reg,id: String,stat: String) -> bool:
	if not state.owned.has(id):return false
	var quote=training_quote(id,stat)
	if quote.is_empty() or Village.level(state,quote.building)<=0:return false
	var cost={"RES-001":quote.ryo,str(quote.resource):quote.qty}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	var p=state.owned[id]
	var stats=Stats.derive(reg,reg.ninjas[id],p)
	debit(cost)
	if not p.has("training"):p.training={}
	p.training[stat]=float(p.training.get(stat,0))+1+Stats.effect(reg,stats,"training_speed")*0.5+Stats.effect(reg,stats,"absorption")*0.5
	Content.bump(state,"train_ninja")
	return commit_change(prior,rng.state)

func buy_training_scrolls(resource: String,quantity: int) -> bool:
	if Village.level(state,"BLD-001")<2 or not resource in ["RES-116","RES-117"] or quantity<1 or quantity>10:return false
	var cost={"RES-001":quantity*(120 if resource=="RES-116" else 600)}
	if not has_cost(cost):return false
	var prior=state.duplicate(true)
	if not Village.put(state,resource,quantity):return false
	debit(cost)
	return commit_change(prior,rng.state)

func setup_starter_jobs(reg) -> bool:
	var prior=state.duplicate(true)
	var targets=[["NIN-001","BLD-015","JOB-10"],["NIN-003","BLD-014","JOB-10"],["NIN-005","BLD-012","JOB-09"]]
	for row in targets:
		if state.owned.has(row[0]) and not state.jobs.has(row[0]):Village.assign(reg,state,row[0],row[1],row[2])
	if state.owned.has("NIN-001") and not state.missions.has("NIN-001"):Content.start_mission(reg,state,"NIN-001","RES-001",true)
	return commit_change(prior,rng.state)

func create_world_squad() -> String:
	var capacity=state.owned.size()-state.team.size()-state.home_defense.size()
	for q in state.world_squads.values():capacity-=q.team.size()
	if capacity<=0:return ""
	var empty_count=0
	for q in state.world_squads.values():
		if q.team.is_empty():empty_count+=1
	if empty_count>=capacity:return ""
	var prior=state.duplicate(true)
	var i=2
	while state.world_squads.has("SQUAD-"+str(i)):i+=1
	var id="SQUAD-"+str(i)
	state.world_squads[id]={"team":[],"location":World.HOME,"travel":{}}
	return id if commit_change(prior,rng.state) else ""

func native_bloodline_allowed(reg,id: String,bloodline: String) -> bool:
	if not reg.ninjas.has(id) or not reg.bloodlines.has(bloodline) or bloodline=="BL-139":return false
	var n=reg.ninjas[id]
	var def=reg.bloodlines[bloodline]
	var affinity={"BL-140":"wood","BL-141":"ice","BL-142":"lava","BL-143":"dust"}
	if affinity.has(bloodline):return affinity[bloodline] in n.chakra_elements
	return def.required_family_for_native!=null and n.family_hint==def.required_family_for_native

func grant_reward(id: String,qty: int) -> void:
	Rewards.deliver(state,id,qty)

func collect_reward_inbox(id: String) -> bool:
	var qty=int(state.get("reward_inbox",{}).get(id,0))
	var available=maxi(0,Village.capacity(state,id)-int(state.inventory.get(id,0)))
	var take=mini(qty,available)
	if take<=0:return false
	var prior=state.duplicate(true)
	state.inventory[id]=int(state.inventory.get(id,0))+take
	state.reward_inbox[id]=qty-take
	if int(state.reward_inbox[id])==0:state.reward_inbox.erase(id)
	return commit_change(prior,rng.state)

func sell_surplus(reg,id: String,qty: int) -> bool:
	# Optional local merchant sink for capped stock; does not mint premium currency.
	if not reg.resources.has(id) or not reg.resources[id].tradable or id in ["RES-001","RES-002","RES-003","RES-004","RES-005"] or qty<1 or qty>100:return false
	if Village.level(state,"BLD-001")<2 or int(state.inventory.get(id,0))<qty:return false
	var unit=maxi(1,floori(float(reg.resources[id].base_price_ryo)*0.35))
	if int(state.inventory.get("RES-001",0))+unit*qty>Village.capacity(state,"RES-001"):return false
	var prior=state.duplicate(true)
	state.inventory[id]=int(state.inventory[id])-qty
	state.inventory["RES-001"]=int(state.inventory.get("RES-001",0))+unit*qty
	return commit_change(prior,rng.state)

func set_squad_formation(reg,key: String,formation_id: String,slot: int=-1,ninja: String="") -> bool:
	if not reg.formations.has(formation_id):return false
	if key!="defense" and not state.world_squads.has(key):return false
	if key!="defense":
		var squad=state.world_squads[key]
		if squad.location!=World.HOME or not squad.travel.is_empty():return false
	var roster=state.home_defense if key=="defense" else state.world_squads[key].team
	var config=state.get("squad_formations",{}).get(key,{"formation_id":"FRM-01","slots":{}})
	var slots=Formation.normalize_slots(roster,config.slots)
	if slot!=-1:
		if slot<0 or slot>8 or not ninja in roster:return false
		var old=int(slots[ninja])
		for id in slots:
			if int(slots[id])==slot:slots[id]=old;break
		slots[ninja]=slot
	var prior=state.duplicate(true)
	if not state.has("squad_formations"):state.squad_formations={}
	state.squad_formations[key]={"formation_id":formation_id,"slots":slots}
	return commit_change(prior,rng.state)

func passive_allowed(reg,id: String,key: String) -> bool:
	return state.owned.has(id) and reg.passives.has(key) and reg.passives[key].ninja_id==id and int(state.owned[id].realm)>=int(reg.passives[key].unlock.realm)

func passive_spend_allowed(reg,id: String,key: String) -> bool:
	return passive_allowed(reg,id,key) and reg.passive_ledger.get(key,"")=="DEV_CANDIDATE" and reg.synergy_gaps.get(key,"")!="FORM_ZERO_PAYLOAD_REVIEW"

func upgrade_passive(reg,id: String,key: String,limit: int=1) -> bool:
	if not passive_spend_allowed(reg,id,key) or limit<1 or limit>20:return false
	var p=state.owned[id]
	var sk=Passive.progress(p,key)
	var resource=reg.passives[key].progression.book
	var quote=Quotes.skill_batch(int(sk.level),int(sk.grade),int(state.inventory.get(resource,0)),limit,true)
	if int(quote.count)==0:return false
	var prior=state.duplicate(true)
	Passive.migrate(id,p)
	debit({resource:quote.cost})
	sk.level=int(sk.level)+int(quote.count)
	p.passive_progress[key]=sk
	return commit_change(prior,rng.state)

func advance_passive(reg,id: String,key: String) -> String:
	if not passive_spend_allowed(reg,id,key):return "locked"
	var p=state.owned[id]
	var sk=Passive.progress(p,key)
	var cost=Quotes.advance_cost(int(sk.grade),true)
	if int(sk.level)<20 or int(state.inventory.get("RES-130",0))<cost:return "locked"
	var prior=state.duplicate(true)
	var old_rng=rng.state
	Passive.migrate(id,p)
	state.inventory["RES-130"]=int(state.inventory["RES-130"])-cost
	var won=int(sk.fails)>=4 or rng.randf()<Quotes.grade_chance(int(sk.grade),int(sk.fails))
	if won:
		sk.grade=int(sk.grade)+1
		sk.level=1
		sk.fails=0
	else:sk.fails=int(sk.fails)+1
	p.passive_progress[key]=sk
	if not commit_change(prior,old_rng):return "error"
	return "success" if won else "failure"

func branch_passive(reg,id: String,key: String,branch_id: String) -> bool:
	if not passive_spend_allowed(reg,id,key):return false
	var p=state.owned[id]
	var sk=Passive.progress(p,key)
	if not str(sk.branch).is_empty():return false
	for br in reg.passives[key].progression.branches:
		if br.id==branch_id and int(sk.grade)>=int(br.grade):
			var prior=state.duplicate(true)
			Passive.migrate(id,p)
			sk.branch=branch_id
			p.passive_progress[key]=sk
			return commit_change(prior,rng.state)
	return false
