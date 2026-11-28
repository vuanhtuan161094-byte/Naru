extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Journey=preload("res://game/player_journey.gd")
var failures=0
func check(ok:bool,desc:String)->void:
	if not ok:failures+=1;push_error("E2_FAIL "+desc)
func _initialize()->void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	var s=Store.new()
	s.save_path="user://e2_journey_test.json"
	s.new_game(reg)
	var before=JSON.stringify(s.state)
	var j=Journey.snapshot(reg,s)
	check(JSON.stringify(s.state)==before,"read only")
	check(j.story.id=="STG-001" and j.story.route=="battle","fresh first story")
	check(j.team==3 and j.owned==3 and not j.steps.is_empty(),"starter journey")
	s.state.stamina=0
	j=Journey.snapshot(reg,s)
	check(j.story.route=="food" and int(j.story.missing_stamina)==6 and int(j.story.wait_s)==2160,"stamina shortage")
	s.state.stamina=120
	s.state.team=[]
	check(Journey.snapshot(reg,s).story.route=="formation","empty team")
	s.state.team=["NIN-001","NIN-003","NIN-005"]
	s.state.cleared["STG-001"]=true
	check(Journey.snapshot(reg,s).story.id=="STG-002","next stage")
	s.state.inventory["RES-128"]=0
	s.state.owned["NIN-001"].level=20
	j=Journey.snapshot(reg,s)
	check(j.growth.any(func(x):return x.target=="NIN-001" and x.missing.has("RES-128")),"exact breakthrough resource")
	s.state.daily_counts["recruit"]=1
	s.state.quest_day=preload("res://game/content_service.gd").day(s.state)
	j=Journey.snapshot(reg,s)
	check(j.claimable.any(func(x):return x.id=="QST-079"),"claimable actual quest")
	check(s.claim_quest(reg,"QST-079"),"claim actual reward")
	check(not Journey.snapshot(reg,s).claimable.any(func(x):return x.id=="QST-079"),"no repeat reward")
	if failures==0:print("NARU_E2_JOURNEY_PASS")
	quit(0 if failures==0 else 1)
