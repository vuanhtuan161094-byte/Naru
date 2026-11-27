extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Stats=preload("res://game/stats_service.gd")
const Formula=preload("res://game/combat_formula_service.gd")
const Combat=preload("res://game/combat.gd")
var failures=0

func check(ok: bool,message: String) -> void:
	if not ok:
		failures+=1
		push_error("POWER_SYSTEM_FAIL "+message)
	else:print("POWER_SYSTEM_OK "+message)

func _initialize() -> void:
	var registry=Registry.new()
	if not registry.load_all():
		push_error("POWER_SYSTEM_FAIL registry: "+str(registry.errors))
		quit(1)
		return
	check(registry.stat_rules.size()==78 and registry.stat_catalog.size()==78,"78 runtime stat contracts")
	check(registry.affinity.size()==441 and registry.affinity.has("storm:fire") and registry.affinity.has("fire:storm"),"21-element affinity matrix includes Storm")
	var profiles_ready=0
	for ninja in registry.ninjas.values():
		var base_profile=ninja.get("base_stats",{})
		var growth_profile=ninja.get("level_growth",{})
		var profile_stats=Stats.derive(registry,ninja,{"level":1,"quality":int(ninja.get("initial_quality",1))})
		if base_profile.size()==6 and growth_profile.size()==6 and profile_stats.size()==78:profiles_ready+=1
	check(profiles_ready==144,"all 144 profiles produce a complete 78-stat snapshot")

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
	check(is_equal_approx(source_sum,expected_strength) and is_equal_approx(source_detail.final_value,Stats.derive(registry,fire_ninja,growth_preview,preview_gear).strength),"stat source tooltip reconciles profile, growth, investment, and gear")
	check(Stats.tooltip(registry,"strength",source_detail.final_value,source_detail).contains("Nguồn hiện tại:"),"stat UI tooltip displays current source contributions")
	check(Stats.display_value(registry,"pcrit",150.0).contains("45.0%"),"rating display shows effective crit probability")

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
	var attack_skill={"element":"fire","damage_type":"ninjutsu","effects":[{"type":"damage","damage_type":"ninjutsu","coefficient":1.0}]}
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
