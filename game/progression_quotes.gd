extends RefCounted
# D4 / existing active and passive transaction formulas; no combat effect scaling.
static func level_cost(level: int,grade: int,passive: bool=false) -> int:
	return ceili((2.0 if passive else 4.0)*pow(float(level),1.35)*(1+0.25*float(grade)))

static func advance_cost(grade: int,passive: bool=false) -> int:
	return ceili((3.0 if passive else 5.0)*pow(float(grade),1.45))

static func grade_chance(grade: int,fails: int) -> float:
	return 1.0 if fails>=4 else maxf(0.1,0.75/(1+0.15*(float(grade)-1)))

static func realm_cost(realm: int) -> int:
	return ceili(3*pow(float(realm)+1,1.4))

static func realm_chance(fails: int) -> float:
	return 1.0 if fails>=5 else minf(1.0,0.65+0.08*fails)

static func xp_need(level: int,realm: int) -> int:
	return ceili(100*pow(float(level),1.6)*(1+0.15*float(realm)))

static func enhancement_cost(level: int,protect: bool=false) -> Dictionary:
	var cost={"RES-001":ceili(20*pow(1+level,1.65)),"RES-113":ceili(1+float(level)/5)}
	if protect:cost["RES-115"]=1
	return cost

static func enhancement_chance(level: int,fails: int) -> float:
	return 1.0 if fails>=20 else minf(1.0,maxf(0.05,0.95/(1+0.055*level))+0.05*fails)

static func skill_batch(level: int,grade: int,available: int,limit: int,passive: bool=false) -> Dictionary:
	var cost=0
	var count=0
	for current in range(level,mini(20,level+maxi(0,limit))):
		var next=level_cost(current,grade,passive)
		if cost+next>available:break
		cost+=next
		count+=1
	return {"count":count,"cost":cost}
