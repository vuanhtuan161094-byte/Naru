extends SceneTree
const Registry=preload("res://game/data_registry.gd")
const Store=preload("res://game/save_store.gd")
const Guard=preload("res://game/save_guard.gd")
var failures=0
func check(ok:bool,message:String)->void:
	if not ok:
		failures+=1
		push_error("E1_FAIL "+message)
func _initialize()->void:
	var reg=Registry.new()
	if not reg.load_all():quit(1);return
	var s=Store.new()
	s.save_path="user://e1_recruit_test.json"
	for suffix in ["",".bak",".tmp"]:
		if FileAccess.file_exists(s.save_path+suffix):DirAccess.remove_absolute(s.save_path+suffix)
	s.new_game(reg)
	var rows=s.draw_batch(reg,10)
	check(rows.size()==10 and int(s.state.draws)==10 and int(s.state.inventory["RES-002"])==0,"ten pulls atomic")
	if rows.size()==10:check(int(rows[0].quality)>=3,"first pity")
	check(s.state.recruit_history.size()==10,"history persisted")
	check(s.draw_batch(reg,1).is_empty() and int(s.state.draws)==10,"insufficient funds")
	var id="NIN-001"
	var reserve=s.shard_reserve(reg,id)
	s.state.owned[id].shards=int(reserve.reserve)+10
	check(not s.recycle_surplus(reg,id,3),"protected reserve")
	check(s.recycle_surplus(reg,id,2) and int(s.state.owned[id].shards)==int(reserve.reserve),"recycle excess only")
	var target=""
	for n in reg.ninjas:
		if not s.state.owned.has(n):target=n;break
	var q=s.fragment_unlock_quote(reg,target)
	check(not s.unlock_by_fragments(reg,target),"no free unlock")
	# Explicit fixture for HQ and currency, not natural progression evidence.
	s.state.building_states["BLD-001"].level=5
	s.state.building_states["BLD-009"].level=1
	s.state.inventory["RES-134"]=100000
	s.state.inventory["RES-001"]=1000000
	while int(s.fragment_unlock_quote(reg,target).stock)<int(q.need):
		var qty=mini(20,int(q.need)-int(s.fragment_unlock_quote(reg,target).stock))
		if not s.buy_target_fragments(reg,target,qty):check(false,"fragment exchange");break
	check(s.unlock_by_fragments(reg,target) and s.state.owned.has(target),"fragment unlock")
	check(not s.unlock_by_fragments(reg,target),"no repeat unlock")
	check(Guard.valid(reg,s.state),"valid save")
	var loaded=Store.new()
	loaded.save_path=s.save_path
	loaded.load_or_new(reg)
	check(loaded.state.recruit_history.size()==10 and loaded.state.owned.has(target),"reload")
	if failures==0:print("NARU_E1_RECRUIT_PASS")
	quit(0 if failures==0 else 1)
