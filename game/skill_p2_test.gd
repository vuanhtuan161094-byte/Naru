extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Combat=preload("res://game/combat.gd")
var fails=0
func check(ok: bool,message: String) -> void:
	if not ok:fails+=1;push_error("P2_FAIL "+message)
	else:print("P2_OK "+message)
func _initialize() -> void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	check(reg.p2_design.size()==1152 and reg.p2_skills.size()+reg.p2_fallback.size()==1152,"coverage and explicit fallback")
	var shapes={}
	var fallback={}
	for id in reg.p2_fallback:
		var reason=reg.p2_fallback[id]
		fallback[reason]=int(fallback.get(reason,0))+1
	for id in reg.p2_skills:
		var shape=reg.p2_skills[id].shape
		shapes[shape]=int(shapes.get(shape,0))+1
	print("P2_ADAPTER_COUNTS ",reg.p2_skills.size()," FALLBACK ",reg.p2_fallback.size()," SHAPES ",shapes," REASONS ",fallback)
	var sim=Combat.new()
	sim.registry=reg
	sim.qa_hold_ai=true
	sim.add_actor("NIN-001",0,20,2,{},0,1.0)
	sim.add_actor("NIN-002",1,20,2,{},0,1.0)
	var a=sim.actors[0]
	var b=sim.actors[1]
	a.pos=Vector2(5,5)
	b.pos=Vector2(6,5)
	var skill=sim.effective_skill(a,"NIN-001-S0")
	check(skill.has("p2") and sim.cast(a,skill,b),"actual P2 basic cast")
	for i in range(80):sim.tick(0.05)
	check(sim.p2_resolved>0 and sim.effect_dispatch_count>0,"actual P2 effect pipeline")
	print("NARU_SKILL_P2_PASS" if fails==0 else "NARU_SKILL_P2_FAIL")
	quit(0 if fails==0 else 1)
