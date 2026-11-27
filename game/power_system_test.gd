extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Stats=preload("res://game/stats_service.gd")
const Formula=preload("res://game/combat_formula_service.gd")
const Combat=preload("res://game/combat.gd")
const Store=preload("res://game/save_store.gd")
const Snapshot=preload("res://game/combat_stat_snapshot.gd")
var failures=0

func check(ok: bool,message: String) -> void:
	if not ok:
		failures+=1
		push_error("POWER_SYSTEM_FAIL "+message)
	else:print("POWER_SYSTEM_OK "+message)

func sample_actual_damage(sim,a: Dictionary,b: Dictionary,skill: Dictionary,samples: int,shield_value: float) -> float:
	var total=0.0
	for i in range(samples):
		b.hp=b.max_hp
		b.shield=shield_value
		b.shield_sources.clear()
		sim.release(a,skill,b)
		total+=float(b.max_hp)-float(b.hp)+shield_value-float(b.shield)
	return total/float(maxi(1,samples))

func _initialize() -> void:
	var registry=Registry.new()
	if not registry.load_all():
		push_error("POWER_SYSTEM_FAIL registry: "+str(registry.errors))
		quit(1)
		return
	check(registry.stat_rules.size()==78 and registry.stat_catalog.size()==78,"78 runtime stat contracts")
	var affinity_elements={}
	var complete_affinity=true
	for key in registry.affinity:
		var pair=str(key).split(":")
		if pair.size()!=2:complete_affinity=false;continue
		affinity_elements[pair[0]]=true
		affinity_elements[pair[1]]=true
	for attack_element in affinity_elements:
		for defense_element in affinity_elements:
			if not registry.affinity.has(str(attack_element)+":"+str(defense_element)):complete_affinity=false
	check(complete_affinity and affinity_elements.size()==21 and registry.affinity.size()==441 and is_equal_approx(float(registry.affinity.get("storm:neutral",0.0)),1.0) and is_equal_approx(float(registry.affinity.get("neutral:storm",0.0)),1.0),"all 441 directional affinity pairs exist with neutral Storm defaults")
	var profiles_ready=0
	var breakdown_rows=0
	var maximum_breakdown_drift=0.0
	for ninja in registry.ninjas.values():
		var base_profile=ninja.get("base_stats",{})
		var growth_profile=ninja.get("level_growth",{})
		var probe={"level":17,"quality":int(ninja.get("initial_quality",1)),"allocated":{"vitality":-2,"agility":3},"training":{"strength":2.5},"permanent":{"intellect":-1,"accuracy":4},"specialization":{"hp":5},"talent":"TAL-02","bloodline_levels":{}}
		for bloodline_id in registry.bloodlines:
			if str(registry.bloodlines[bloodline_id].get("required_family_for_native",""))==str(ninja.get("family_hint","")):
				probe.bloodline_levels[bloodline_id]=2
				break
		var profile_stats=Stats.derive(registry,ninja,probe,{"vitality":2,"agility":-1,"hp":-20,"accuracy":3})
		if base_profile.size()==6 and growth_profile.size()==6 and profile_stats.size()==78:profiles_ready+=1
		for stat_id in registry.stat_rules:
			var row=Stats.breakdown(registry,ninja,probe,{"vitality":2,"agility":-1,"hp":-20,"accuracy":3},str(stat_id))
			var drift=absf(float(row.reconciliation_delta))
			maximum_breakdown_drift=maxf(maximum_breakdown_drift,drift)
			if is_equal_approx(float(row.reconstructed_value),float(row.final_value)):breakdown_rows+=1
	check(profiles_ready==144,"all 144 profiles produce a complete 78-stat snapshot")
	check(breakdown_rows==144*78 and maximum_breakdown_drift<0.0001,"all 11,232 profile/stat breakdowns reconcile against derive ordering")

	var fire_ninja=registry.ninjas["NIN-002"]
	var fire_stats=Stats.derive(registry,fire_ninja,{"level":1,"quality":3})
	check(fire_stats.size()==78,"all stats derive into player snapshot")
	check(float(fire_stats.fire_power)>float(fire_stats.water_power),"chakra nature adds character-specific elemental power")
	var growth_preview={"level":15,"quality":3,"allocated":{"strength":5},"training":{"strength":3},"permanent":{"strength":2,"fire_power":10},"specialization":{"fire_power":5},"talent":"TAL-02","bloodline_levels":{}}
	var preview_gear={"strength":7,"fire_power":2}
	var source_detail=Stats.breakdown(registry,fire_ninja,growth_preview,preview_gear,"strength")
	var source_sum=0.0
	for component in source_detail.components:source_sum+=float(component.value)
	var expected_strength=float(fire_ninja.base_stats.strength)+float(fire_ninja.level_growth.strength)*14.0*1.12+17.0
	check(is_equal_approx(source_sum,source_detail.final_value) and is_equal_approx(source_detail.final_value,Stats.derive(registry,fire_ninja,growth_preview,preview_gear).strength),"stat source tooltip reconciles profile, growth, investment, and gear")
	check(Stats.tooltip(registry,"strength",source_detail.final_value,source_detail).contains("Nguồn hiện tại:"),"stat UI tooltip displays current source contributions")
	var rich_preview={"level":30,"quality":4,"allocated":{"agility":3},"training":{"agility":2},"permanent":{"agility":4,"accuracy":3},"specialization":{"mastery_speed":7},"talent":"TAL-02","bloodline_levels":{"BL-137":2}}
	var rich_stats=Stats.derive(registry,fire_ninja,rich_preview,{"agility":2,"fire_power":3})
	var agility_detail=Stats.breakdown(registry,fire_ninja,rich_preview,{"agility":2,"fire_power":3},"agility")
	var agility_delta=0.0
	for component in agility_detail.components:agility_delta+=float(component.value)
	var nature_detail=Stats.breakdown(registry,fire_ninja,rich_preview,{"agility":2,"fire_power":3},"fire_power")
	var bloodline_detail=Stats.breakdown(registry,fire_ninja,rich_preview,{"agility":2,"fire_power":3},"accuracy")
	check(agility_detail.modifier_steps.size()>=2 and is_equal_approx(agility_delta,float(rich_stats.agility)) and nature_detail.components.any(func(x):return x.name.begins_with("Thiên hướng")) and bloodline_detail.modifier_steps.size()==1,"breakdown records multiplicative talent, fixed talent, nature and bloodline in execution order")
	var rating_preview={"level":1,"quality":3,"permanent":{"pcrit":75}}
	var rating_detail=Stats.breakdown(registry,fire_ninja,rating_preview,{"pcrit":75},"pcrit")
	var rating_expected=Stats.derive(registry,fire_ninja,rating_preview,{"pcrit":75})
	check(is_equal_approx(float(rating_detail.raw_rating),float(rating_expected.pcrit)) and is_equal_approx(float(rating_detail.effective_value),Stats.effect(registry,rating_expected,"pcrit")) and float(rating_detail.effective_value)<float(rating_detail.raw_rating) and Stats.tooltip(registry,"pcrit",rating_detail.final_value,rating_detail).contains("Rating thô"),"raw rating remains separate from capped effective probability")
	var negative_stats=Stats.derive(registry,fire_ninja,{"level":1,"quality":3,"permanent":{"vitality":-1000,"strength":-1000}})
	var negative_armor=Stats.breakdown(registry,fire_ninja,{"level":1,"quality":3,"permanent":{"vitality":-1000,"strength":-1000}}, {},"armor")
	check(float(negative_stats.armor)==0.0 and is_equal_approx(float(negative_armor.reconstructed_value),0.0) and Stats.effect(registry,negative_stats,"vitality")==0.0,"negative raw values reconcile through dependent minimum caps and zero-floor rating conversion")
	check(Stats.display_value(registry,"pcrit",150.0).contains("45.0%"),"rating display shows effective crit probability")
	var early_snapshot=Snapshot.snapshot(registry,fire_ninja,1,1,{}, {"level":1,"quality":1,"stars":1,"realm":0}, {},true)
	var mid_snapshot=Snapshot.snapshot(registry,fire_ninja,50,4,{}, {"level":50,"quality":4,"stars":5,"realm":2}, {},true)
	var late_snapshot=Snapshot.snapshot(registry,fire_ninja,160,8,{}, {"level":160,"quality":8,"stars":15,"realm":7}, {},true)
	var star_one=Snapshot.snapshot(registry,fire_ninja,50,4,{}, {"level":50,"quality":4,"stars":1}, {},true)
	var star_fifteen=Snapshot.snapshot(registry,fire_ninja,50,4,{}, {"level":50,"quality":4,"stars":15}, {},true)
	check(float(early_snapshot.stats.strength)<float(mid_snapshot.stats.strength) and float(mid_snapshot.stats.strength)<float(late_snapshot.stats.strength) and is_equal_approx(float(star_fifteen.natural_star_multiplier),1.56) and float(star_fifteen.stats.patk)>float(star_one.stats.patk),"early/mid/late quality and level snapshots retain authored star scaling and power disparity")
	var low_training_store=Store.new()
	var high_training_store=Store.new()
	low_training_store.save_path="user://naru-power-training-low.json"
	high_training_store.save_path="user://naru-power-training-high.json"
	low_training_store.new_game(registry)
	high_training_store.new_game(registry)
	for store in [low_training_store,high_training_store]:
		store.state.building_states["BLD-003"].level=1
		store.state.inventory["RES-001"]=100000
		store.state.inventory["RES-118"]=100000
		store.state.owned["NIN-001"].permanent["training_speed"]=0.0
	high_training_store.state.owned["NIN-001"].permanent.training_speed=100.0
	var low_training_before=float(low_training_store.state.owned["NIN-001"].get("training",{}).get("strength",0.0))
	var high_training_before=float(high_training_store.state.owned["NIN-001"].get("training",{}).get("strength",0.0))
	var low_training_ok=low_training_store.train_stat(registry,"NIN-001","strength")
	var high_training_ok=high_training_store.train_stat(registry,"NIN-001","strength")
	var low_training_gain=float(low_training_store.state.owned["NIN-001"].training.strength)-low_training_before
	var high_training_gain=float(high_training_store.state.owned["NIN-001"].training.strength)-high_training_before
	check(low_training_ok and high_training_ok and high_training_gain>low_training_gain,"training_speed changes an earned training transaction instead of only appearing in the stat catalog")
	for store_path in [low_training_store.save_path,high_training_store.save_path]:
		for suffix in ["",".bak",".tmp"]:
			var absolute=ProjectSettings.globalize_path(str(store_path)+suffix)
			if FileAccess.file_exists(absolute):DirAccess.remove_absolute(absolute)

	var attacker={"stats":{"accuracy":1000.0,"pcrit":1000.0,"crit_damage":1000.0}}
	var target={"stats":{"evasion":0.0,"crit_resist":0.0}}
	check(is_equal_approx(Formula.hit_chance(registry,attacker,target),0.99),"hit chance has 99 percent ceiling")
	var capped_crit=Formula.critical_chance(registry,attacker,target,true)
	check(capped_crit<=0.75 and capped_crit>0.65,"critical conversion remains capped")

	var resisting_target={"stats":{"control_resist":1000.0,"stun_resist":1000.0}}
	var stun_rule=registry.status_catalog["stun"]
	var guaranteed={"chance":1.0,"duration_s":2.0}
	var resisted_chance=Formula.status_chance(registry,attacker,resisting_target,"stun",stun_rule,guaranteed)
	var ignored_chance=Formula.status_chance(registry,attacker,resisting_target,"stun",stun_rule,{"chance":1.0,"duration_s":2.0,"ignore_resist_stats":["control_resist","stun_resist"]})
	check(resisted_chance<1.0 and is_equal_approx(ignored_chance,1.0),"guaranteed status still checks named resistances")
	var first_duration=Formula.status_duration(registry,attacker,target,"stun",stun_rule,guaranteed,0)
	var repeat_duration=Formula.status_duration(registry,attacker,target,"stun",stun_rule,guaranteed,2)
	check(repeat_duration<first_duration,"repeated hard control has diminishing duration")

	var affinity=Formula.affinity_factor(registry.affinity,"fire",["wind","water"])
	check(is_equal_approx(affinity,1.025),"multiple chakra natures contribute to defense")
	var elemental_attacker={"stats":{"element_power":0.0,"fire_power":100.0}}
	var elemental_target={"stats":{"fire_resist":100.0},"elemental_types":["wind","water"]}
	var elemental=Formula.elemental_factor(registry,elemental_attacker,elemental_target,"fire",registry.affinity,1.0,1.0)
	check(elemental<affinity,"element-specific resistance reduces elemental damage")
	var genjutsu_target={"nres":900.0,"stats":{"genjutsu_resist":35.0,"accuracy":0.0,"evasion":0.0,"crit_resist":0.0,"damage_reduction":0.0,"block_chance":0.0}}
	var genjutsu_a={"natk":100.0,"stats":{"genjutsu_power":180.0,"accuracy":0.0,"ncrit":0.0,"crit_damage":0.0,"magic_pen":0.0}}
	var genjutsu_b={"natk":9000.0,"stats":{"genjutsu_power":180.0,"accuracy":0.0,"ncrit":0.0,"crit_damage":0.0,"magic_pen":0.0}}
	check(is_equal_approx(Formula.expected_damage_factor(registry,genjutsu_a,genjutsu_target,"genjutsu","neutral"),Formula.expected_damage_factor(registry,genjutsu_b,genjutsu_target,"genjutsu","neutral")),"AI estimates genjutsu from genjutsu power and resist, not ninjutsu stats")

	var impact_sim=Combat.new()
	impact_sim.registry=registry
	impact_sim.add_actor("NIN-001",0,20,2,{},0,1.0)
	impact_sim.add_actor("NIN-002",1,20,3,{},0,1.0)
	var impact_source=impact_sim.actors[0]
	var impact_target=impact_sim.actors[1]
	impact_source.patk=160.0
	impact_source.realm=3
	impact_source.stats.accuracy=80.0
	impact_source.stats.pcrit=30.0
	impact_source.stats.crit_damage=35.0
	impact_source.stats.armor_pen=45.0
	impact_source.stats.shield_break=55.0
	impact_target.realm=2
	impact_target.armor=70.0
	impact_target.stats.evasion=18.0
	impact_target.stats.crit_resist=10.0
	impact_target.stats.block_chance=28.0
	impact_target.stats.block_efficiency=28.0
	impact_target.stats.damage_reduction=22.0
	var impact_skill={"skill_id":"NIN-001-S0","kind":"basic","shape":"single","element":"neutral","damage_type":"physical","range_m":5.0,"radius_m":0.0,"line_width_m":0.0,"max_targets":1,"effects":[{"type":"damage","damage_type":"physical","coefficient":0.82}]}
	impact_target.hp=impact_target.max_hp
	impact_target.shield=45.0
	var impact_prediction=impact_sim.expected_damage_for_effect(impact_source,impact_skill,impact_target,impact_skill.effects[0],impact_target,impact_target)
	var high_shield_target=impact_target.duplicate(true)
	high_shield_target.shield=100000.0
	var high_shield_prediction=impact_sim.expected_damage_for_effect(impact_source,impact_skill,high_shield_target,impact_skill.effects[0],high_shield_target,high_shield_target)
	var unshielded_target=impact_target.duplicate(true)
	unshielded_target.shield=0.0
	var unshielded_prediction=impact_sim.expected_damage_for_effect(impact_source,impact_skill,unshielded_target,impact_skill.effects[0],unshielded_target,unshielded_target)
	var stronger_skill=impact_skill.duplicate(true)
	stronger_skill.effects[0].coefficient=1.2
	var stronger_prediction=impact_sim.expected_damage_for_effect(impact_source,stronger_skill,impact_target,stronger_skill.effects[0],impact_target,impact_target)
	var lower_realm_source=impact_source.duplicate(true)
	lower_realm_source.realm=0
	var lower_realm_prediction=impact_sim.expected_damage_for_effect(lower_realm_source,impact_skill,impact_target,impact_skill.effects[0],impact_target,impact_target)
	var tougher_target=impact_target.duplicate(true)
	tougher_target.armor=500.0
	tougher_target.stats.damage_reduction=90.0
	var tougher_score=impact_sim.expected_damage_score(impact_source,impact_skill,tougher_target)
	var ordinary_score=impact_sim.expected_damage_score(impact_source,impact_skill,impact_target)
	check(float(stronger_prediction.expected_effect)>float(impact_prediction.expected_effect) and float(lower_realm_prediction.expected_effect)<float(impact_prediction.expected_effect) and float(high_shield_prediction.expected_hp_damage)<0.01 and float(unshielded_prediction.expected_hp_damage)>float(high_shield_prediction.expected_hp_damage) and ordinary_score>tougher_score,"AI scores absolute skill output through coefficient, defense, accuracy, crit, realm, mitigation, shields and shield-break semantics")
	impact_sim.rng.seed=71027
	var simulated_mean=sample_actual_damage(impact_sim,impact_source,impact_target,impact_skill,1400,45.0)
	check(absf(simulated_mean-float(impact_prediction.expected_effect))<=maxf(2.0,float(impact_prediction.expected_effect)*0.10),"expected absolute AI effect agrees with seeded actual hit resolution across block, crit, hit, and low-shield outcomes")
	var reaction_skill=impact_skill.duplicate(true)
	reaction_skill.element="fire"
	reaction_skill.damage_type="ninjutsu"
	reaction_skill.effects=[{"type":"damage","damage_type":"ninjutsu","coefficient":0.32},{"type":"damage","damage_type":"ninjutsu","coefficient":0.32}]
	impact_source.natk=160.0
	impact_source.stats.magic_pen=25.0
	impact_source.stats.element_power=8.0
	impact_source.stats.fire_power=18.0
	impact_target.nres=55.0
	impact_target.elemental_types=["wind"]
	impact_target.stats.fire_resist=12.0
	impact_target.stats.ncrit=0.0
	impact_target.shield=12.0
	impact_target.hp=impact_target.max_hp
	impact_target.last_element="wind"
	impact_target.element_tick=impact_sim.ticks
	impact_target.reaction_tick=-1000
	var reaction_prediction=impact_sim.expected_damage_score(impact_source,reaction_skill,impact_target)
	impact_sim.rng.seed=80231
	var reaction_actual_total=0.0
	var reaction_trials=1200
	for sample in range(reaction_trials):
		impact_target.hp=impact_target.max_hp
		impact_target.shield=12.0
		impact_target.shield_sources.clear()
		impact_target.last_element="wind"
		impact_target.element_tick=impact_sim.ticks
		impact_target.reaction_tick=-1000
		impact_sim.elemental_fields.clear()
		var before_hp=float(impact_target.hp)
		impact_sim.release(impact_source,reaction_skill,impact_target)
		reaction_actual_total+=before_hp-float(impact_target.hp)+12.0-float(impact_target.shield)
	var reaction_actual_mean=reaction_actual_total/float(reaction_trials)
	check(absf(reaction_actual_mean-reaction_prediction)<=maxf(2.0,reaction_prediction*0.12),"multi-hit elemental expected damage models affinity, target reaction, hit gating and single-use reaction timing against seeded release")
	var mastery_before=int(impact_sim.mastery_counts.get("NIN-001-S0",0))
	impact_source.stats.mastery_speed=0.0
	impact_target.hp=impact_target.max_hp
	impact_target.shield=0.0
	impact_sim.release(impact_source,impact_skill,impact_target)
	var mastery_low=int(impact_sim.mastery_counts.get("NIN-001-S0",0))-mastery_before
	impact_source.stats.mastery_speed=100.0
	impact_target.hp=impact_target.max_hp
	impact_sim.release(impact_source,impact_skill,impact_target)
	var mastery_high=int(impact_sim.mastery_counts.get("NIN-001-S0",0))-mastery_before-mastery_low
	check(mastery_high>mastery_low,"mastery_speed increases skill mastery through a real combat release")
	var low_shield=impact_target.duplicate(true)
	low_shield.shield=10.0
	var no_break_source=impact_source.duplicate(true)
	no_break_source.stats.shield_break=0.0
	var low_with_break=impact_sim.expected_damage_for_effect(impact_source,impact_skill,low_shield,impact_skill.effects[0],low_shield,low_shield)
	var low_without_break=impact_sim.expected_damage_for_effect(no_break_source,impact_skill,low_shield,impact_skill.effects[0],low_shield,low_shield)
	var high_with_break=impact_sim.expected_damage_for_effect(impact_source,impact_skill,high_shield_target,impact_skill.effects[0],high_shield_target,high_shield_target)
	var high_without_break=impact_sim.expected_damage_for_effect(no_break_source,impact_skill,high_shield_target,impact_skill.effects[0],high_shield_target,high_shield_target)
	check(is_equal_approx(float(low_with_break.expected_shield_damage),float(low_without_break.expected_shield_damage)) and float(low_with_break.expected_hp_damage)>float(low_without_break.expected_hp_damage) and float(high_with_break.expected_shield_damage)>float(high_without_break.expected_shield_damage),"shield break accelerates depletion of a large shield and increases low-shield overflow into HP per the existing hit contract")

	var combat=Combat.new()
	combat.registry=registry
	combat.add_actor("NIN-001",0,1,2,{},0,1.0)
	combat.add_actor("NIN-002",1,1,3,{},0,1.0)
	var source=combat.actors[0]
	var defender=combat.actors[1]
	var reaction_cases=[["wind","fire",1.25],["lightning","water",1.2],["ice","water",1.0],["water","earth",1.0],["water","fire",1.0],["lightning","earth",1.2],["poison","wind",1.0]]
	var reactions_pass=true
	for pair in reaction_cases:
		defender.last_element=pair[0]
		defender.element_tick=combat.ticks
		defender.reaction_tick=combat.ticks-100
		if not is_equal_approx(combat.reaction(source,defender,pair[1]),float(pair[2])):reactions_pass=false
	check(reactions_pass and registry.reactions.size()==7,"all seven authored elemental reactions resolve with bounded multipliers")
	var attack_skill={"skill_id":"NIN-001-S1","kind":"basic","shape":"single","range_m":5.0,"radius_m":0.0,"line_width_m":0.0,"max_targets":1,"element":"fire","damage_type":"ninjutsu","effects":[{"type":"damage","damage_type":"ninjutsu","coefficient":1.0}]}
	defender.stats.fire_resist=0.0
	var favorable_target_score=combat.damage_score_adjustment(source,attack_skill,defender,20.0)
	defender.stats.fire_resist=1000.0
	var resistant_target_score=combat.damage_score_adjustment(source,attack_skill,defender,20.0)
	check(favorable_target_score>resistant_target_score,"combat AI values elemental resistance when ranking attacks")
	defender.stats.control_resist=0.0
	defender.stats.stun_resist=0.0
	var stun_effect={"type":"apply_status","status_id":"stun","chance":1.0,"duration_s":2.0}
	var vulnerable_status_score=combat.status_utility_score(source,defender,[stun_effect])
	defender.stats.control_resist=1000.0
	defender.stats.stun_resist=1000.0
	var resistant_status_score=combat.status_utility_score(source,defender,[stun_effect])
	check(vulnerable_status_score>resistant_status_score,"combat AI discounts control resisted by the target")
	source.stats.damage_reduction_pen=100.0
	defender.stats.damage_reduction=100.0
	defender.stats.block_chance=0.0
	defender.stats.crit_resist=100.0
	defender.shield=50.0
	var hp_before=float(defender.hp)
	combat.hit(source,defender,100.0,false)
	check(float(defender.hp)<hp_before-50.0 and is_equal_approx(float(defender.shield),0.0),"shield break sends the bypassed damage into HP")

	var shield_before=float(defender.shield)
	combat.add_shield(source,defender,100.0,5.0)
	check(float(defender.shield)>shield_before+100.0,"shield power increases created shield")
	check(Formula.healing_multiplier(registry,source,defender,0.0)>1.0,"healing received increases healing")
	var received_before=Formula.received_healing_multiplier(registry,defender,0.0)
	defender.passive_mods={"healing_received":0.1}
	check(Formula.received_healing_multiplier(registry,defender,0.0)>received_before,"passive healing received applies through shared recovery formula")
	defender.shield=0.0
	defender.shield_sources.clear()
	source.stats.lifesteal=100.0
	source.passive_mods={"healing_received":0.1}
	source.hp=float(source.max_hp)-30.0
	var leech_before=float(source.hp)
	combat.hit(source,defender,20.0,false)
	check(float(source.hp)>leech_before,"lifesteal uses healing received and antiheal handling")

	var lock_effect={"status_id":"chakra_lock","chance":1.0,"duration_s":5.0,"magnitude":0.2}
	combat.rng.seed=21
	var lock_applied=combat.apply_status(source,defender,lock_effect)
	check(lock_applied and combat.magnitude(defender,"chakra_lock")>=0.2,"seal strength changes chakra recovery state")
	var seal_rejected=combat.apply_status(source,defender,{"status_id":"chakra_lock","chance":0.0,"duration_s":3.0})
	check(not seal_rejected and combat.art_events.back().kind=="seal_resist","seal resistance emits explicit combat feedback")

	if failures>0:
		quit(1)
	else:
		print("NARU_POWER_SYSTEM_PASS ",registry.stat_rules.size()," stats")
		quit(0)
