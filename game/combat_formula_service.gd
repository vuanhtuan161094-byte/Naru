extends RefCounted
const Stats=preload("res://game/stats_service.gd")

const SPECIFIC_STATUS_RESIST={
	"stun":"stun_resist",
	"bind":"bind_resist",
	"silence":"silence_resist",
	"poison":"poison_resist",
	"burn":"burn_resist",
	"freeze":"freeze_resist",
}
const ELEMENT_POWER={
	"fire":"fire_power",
	"water":"water_power",
	"wind":"wind_power",
	"lightning":"lightning_power",
	"earth":"earth_power",
}
const ELEMENT_RESIST={
	"fire":"fire_resist",
	"water":"water_resist",
	"wind":"wind_resist",
	"lightning":"lightning_resist",
	"earth":"earth_resist",
}

static func rating(reg,actor: Dictionary,id: String) -> float:
	return Stats.effect(reg,actor.get("stats",{}),id)

static func hit_chance(reg,attacker: Dictionary,target: Dictionary,accuracy_bonus: float=0.0,evasion_bonus: float=0.0) -> float:
	var difference=rating(reg,attacker,"accuracy")-rating(reg,target,"evasion")
	return clampf(0.85+difference/(200.0+absf(difference))+accuracy_bonus-evasion_bonus,0.15,0.99)

static func critical_chance(reg,attacker: Dictionary,target: Dictionary,physical: bool) -> float:
	var stat="pcrit" if physical else "ncrit"
	return clampf(rating(reg,attacker,stat)-rating(reg,target,"crit_resist"),0.0,0.75)

static func combined_status_resistance(reg,attacker: Dictionary,target: Dictionary,status_id: String,rule: Dictionary,ignored: Array=[]) -> float:
	var keys: Array[String]=[]
	if bool(rule.get("hard_control",false)):keys.append("control_resist")
	if SPECIFIC_STATUS_RESIST.has(status_id):keys.append(SPECIFIC_STATUS_RESIST[status_id])
	if status_id=="chakra_lock" or bool(rule.get("seal",false)):keys.append("seal_resist")
	var remaining=1.0
	for key in keys:
		if key in ignored:continue
		var resistance=rating(reg,target,key)
		if key=="seal_resist":resistance=maxf(0.0,resistance-rating(reg,attacker,"chakra_lock_pen"))
		remaining*=1.0-clampf(resistance,0.0,0.9)
	return 1.0-remaining

static func status_chance(reg,attacker: Dictionary,target: Dictionary,status_id: String,rule: Dictionary,effect: Dictionary) -> float:
	var chance=float(effect.get("chance",1.0))
	var bonus=0.0
	if bool(rule.get("hard_control",false)):bonus+=rating(reg,attacker,"control_chance")
	if status_id=="chakra_lock" or bool(rule.get("seal",false)):bonus+=rating(reg,attacker,"seal_chance")
	var ignored=effect.get("ignore_resist_stats",[])
	var resistance=combined_status_resistance(reg,attacker,target,status_id,rule,ignored)
	return clampf(chance*(1.0+minf(1.0,bonus))*(1.0-resistance),0.0,1.0)

static func status_duration(reg,attacker: Dictionary,target: Dictionary,status_id: String,rule: Dictionary,effect: Dictionary,chain_count: int=0) -> float:
	var duration=float(effect.get("duration_s",rule.get("duration_s",0.0)))
	var duration_bonus=0.0
	if bool(rule.get("hard_control",false)):duration_bonus+=rating(reg,attacker,"control_duration")
	if status_id=="chakra_lock" or bool(rule.get("seal",false)):duration_bonus+=rating(reg,attacker,"seal_duration")
	var ignored=effect.get("ignore_resist_stats",[])
	var resistance=combined_status_resistance(reg,attacker,target,status_id,rule,ignored)
	duration*=1.0+minf(1.0,duration_bonus)
	duration*=1.0-clampf(resistance*0.5,0.0,0.45)
	if bool(rule.get("hard_control",false)):duration*=pow(0.65,maxi(0,chain_count))
	return maxf(0.0,duration)

static func affinity_factor(affinity: Dictionary,element: String,defender_elements: Array) -> float:
	if element=="neutral":return 1.0
	var elements=defender_elements
	if elements.is_empty():elements=["neutral"]
	var total=0.0
	var count=0
	for defender_element in elements:
		var key=element+":"+str(defender_element)
		if not affinity.has(key):continue
		total+=float(affinity[key])
		count+=1
	return total/float(count) if count>0 else 1.0

static func elemental_factor(reg,attacker: Dictionary,target: Dictionary,element: String,affinity: Dictionary,environment_factor: float,reaction_factor: float) -> float:
	if element=="neutral":return environment_factor*reaction_factor
	var attacker_stats=attacker.get("stats",{})
	var target_stats=target.get("stats",{})
	var offense=rating(reg,attacker,"element_power")
	if ELEMENT_POWER.has(element):offense+=rating(reg,attacker,ELEMENT_POWER[element])
	offense=clampf(offense,0.0,0.75)
	var resistance=rating(reg,target,ELEMENT_RESIST.get(element,"")) if ELEMENT_RESIST.has(element) else 0.0
	var defender_elements=target.get("elemental_types",[str(target.get("element","neutral"))])
	var affinity_value=affinity_factor(affinity,element,defender_elements)
	if attacker_stats.is_empty() or target_stats.is_empty():return affinity_value*environment_factor*reaction_factor
	return affinity_value*environment_factor*reaction_factor*(1.0+offense)*(1.0-clampf(resistance,0.0,0.65))

static func direct_damage(reg,attacker: Dictionary,target: Dictionary,payload: Dictionary) -> Dictionary:
	var physical=bool(payload.get("physical",false))
	var damage_type=str(payload.get("damage_type","ninjutsu"))
	var penetration_key="armor_pen" if physical else "magic_pen"
	var penetration=0.0 if damage_type=="genjutsu" else rating(reg,attacker,penetration_key)
	var defense=maxf(0.0,float(payload.get("defense",0.0))-penetration)
	var raw=float(payload.get("attack",0.0))*float(payload.get("coefficient",1.0))*100.0/(100.0+defense)
	var factor=elemental_factor(reg,attacker,target,str(payload.get("element","neutral")),reg.affinity,float(payload.get("environment_factor",1.0)),float(payload.get("reaction_factor",1.0)))
	factor*=float(payload.get("realm_factor",1.0))*float(payload.get("critical_multiplier",1.0))
	return {"amount":maxf(1.0,round(raw*factor)),"defense":defense,"element_factor":factor}

static func expected_damage_factor(reg,attacker: Dictionary,target: Dictionary,damage_type: String,element: String,realm_factor: float=1.0,environment_factor: float=1.0,accuracy_bonus: float=0.0,evasion_bonus: float=0.0) -> float:
	var physical=damage_type=="physical"
	var stats=attacker.get("stats",{})
	var attack=float(stats.get("genjutsu_power",0.0)) if damage_type=="genjutsu" else float(attacker.get("patk" if physical else "natk",stats.get("patk" if physical else "natk",0.0)))
	var target_stats=target.get("stats",{})
	var defense=float(target_stats.get("genjutsu_resist",0.0)) if damage_type=="genjutsu" else float(target.get("armor" if physical else "nres",target_stats.get("armor" if physical else "nres",0.0)))
	var penetration=0.0 if damage_type=="genjutsu" else rating(reg,attacker,"armor_pen" if physical else "magic_pen")
	var baseline=attack*100.0/(100.0+maxf(0.0,defense-penetration))
	if baseline<=0.0:return 0.0
	var critical=0.0 if damage_type=="genjutsu" else critical_chance(reg,attacker,target,physical)
	var critical_multiplier=1.0+critical*(1.5+rating(reg,attacker,"crit_damage")-1.0)
	var payload={"attack":attack,"coefficient":1.0,"defense":defense,"physical":physical,"damage_type":damage_type,"element":element,"realm_factor":realm_factor,"environment_factor":environment_factor,"critical_multiplier":critical_multiplier}
	var packet=direct_damage(reg,attacker,target,payload)
	var expected=float(packet.amount)*hit_chance(reg,attacker,target,accuracy_bonus,evasion_bonus)
	expected*=1.0-block_chance(reg,attacker,target)*block_reduction(reg,target)
	expected*=1.0-damage_reduction(reg,attacker,target)
	return expected/baseline

static func damage_reduction(reg,attacker: Dictionary,target: Dictionary) -> float:
	return clampf(maxf(0.0,rating(reg,target,"damage_reduction")-rating(reg,attacker,"damage_reduction_pen")),0.0,0.65)

static func block_chance(reg,attacker: Dictionary,target: Dictionary) -> float:
	return clampf(rating(reg,target,"block_chance")*(1.0-rating(reg,attacker,"block_pen")),0.0,0.35)

static func block_reduction(reg,target: Dictionary) -> float:
	return clampf(0.25+rating(reg,target,"block_efficiency"),0.0,0.75)

static func shield_break(reg,attacker: Dictionary) -> float:
	return clampf(rating(reg,attacker,"shield_break"),0.0,0.65)

static func dot_multiplier(reg,attacker: Dictionary,target: Dictionary) -> float:
	return (1.0+rating(reg,attacker,"dot_power"))*(1.0-rating(reg,target,"dot_resist"))

static func healing_multiplier(reg,healer: Dictionary,target: Dictionary,antiheal: float) -> float:
	return (1.0+rating(reg,healer,"healing"))*received_healing_multiplier(reg,target,antiheal)

static func received_healing_multiplier(reg,target: Dictionary,antiheal: float) -> float:
	return (1.0+rating(reg,target,"healing_received"))*(1.0-clampf(antiheal,0.0,0.9))

static func shield_multiplier(reg,source: Dictionary) -> float:
	return 1.0+rating(reg,source,"shield_power")
