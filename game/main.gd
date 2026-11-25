extends Control
const Registry=preload("res://game/data_registry.gd")
const SaveStore=preload("res://game/save_store.gd")
const Combat=preload("res://game/combat.gd")
var reg=Registry.new()
var store=SaveStore.new()
var sim
var battle_stage: Dictionary={}
var event_id=""
var accumulator=0.0
var root: VBoxContainer
var status: Label
var field: Control
var log_label: Label
var ult_buttons: Array[Button]=[]
var selected_stage="STG-001"
var clock_accumulator=0.0
var web_qa=false

func _ready() -> void:
	var bg=ColorRect.new()
	bg.color=Color("#1a2029")
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(bg)
	root=VBoxContainer.new()
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	root.offset_left=24
	root.offset_right=-24
	root.offset_top=18
	root.offset_bottom=-18
	root.add_theme_constant_override("separation",10)
	add_child(root)
	if not reg.load_all():
		label(root,"Lỗi dữ liệu: "+str(reg.errors))
		return
	store.load_or_new(reg)
	if "--smoke" in OS.get_cmdline_user_args():
		print("NARU_REGISTRY_OK ",reg.ninjas.size()," ",reg.skills.size()," ",reg.stages.size())
		get_tree().quit()
		return
	store.advance_clock(reg,int(Time.get_unix_time_from_system()))
	menu()
	if OS.has_feature("web"):
		web_qa=bool(JavaScriptBridge.eval("new URLSearchParams(location.search).has('qa')"))
		if web_qa:
			JavaScriptBridge.eval("window.naruReady=true")
			call_deferred("web_probe")

func clear() -> void:
	for c in root.get_children():
		root.remove_child(c)
		c.queue_free()

func label(parent: Node,value: String,size: int=22) -> Label:
	var l=Label.new()
	l.text=value
	l.add_theme_font_size_override("font_size",size)
	parent.add_child(l)
	return l

func button(parent: Node,title: String,fn: Callable) -> Button:
	var b=Button.new()
	b.text=title
	b.custom_minimum_size=Vector2(0,42)
	b.pressed.connect(fn)
	parent.add_child(b)
	return b

func menu(message: String="") -> void:
	sim=null
	clear()
	label(root,"NARU  /  TỔ CHỨC NINJA",34)
	label(root,"DEV • Gameplay Completion — mỹ thuật tạm",16)
	label(root,"Ryo: %s     Ngọc: %s     Thể lực: %s     Ninja: %s / 144" % [store.state.inventory.get("RES-001",0),store.state.inventory.get("RES-002",0),store.state.stamina,store.state.owned.size()])
	var row=HBoxContainer.new()
	root.add_child(row)
	button(row,"Chiêu mộ (100 ngọc)",recruit_one)
	button(row,"Đội hình",roster)
	button(row,"Tu luyện",growth_screen)
	button(row,"Trang bị",gear_screen)
	button(row,"Làng",village_screen)
	button(row,"Nhẫn giới",world_screen)
	button(row,"Hoạt động",activities_screen)
	var row2=HBoxContainer.new()
	root.add_child(row2)
	button(row2,"Tải lại",func(): store.load_or_new(reg); menu("Đã tải lại"))
	button(row2,"Xuất / nhập save",save_screen)
	button(row2,"Cốt truyện",campaign)
	button(row2,"Lưu game",func(): menu("Đã lưu" if store.save_now() else "Lưu thất bại"))
	label(root,"Đội hình hiện tại")
	for id in store.state.team:
		var p=store.state.owned[id]
		label(root,"%s   •   Cấp %d   •   %d sao" % [reg.ninjas[id].name_vi,int(p.level),int(p.stars)],19)
	label(root,message,19)

func recruit_one() -> void:
	var id=store.draw(reg)
	menu("Chiêu mộ: "+str(reg.ninjas[id].name_vi) if not id.is_empty() else "Không thể chiêu mộ")

func roster() -> void:
	clear()
	label(root,"BỐ TRẬN • tối đa 6 ninja",30)
	button(root,"Trở về",func():menu())
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	for id in store.state.owned:
		var p=store.state.owned[id]
		var title=("%s  |  Cấp %d  |  Mảnh %d" % [reg.ninjas[id].name_vi,int(p.level),int(p.shards)])
		button(rows,("✓ " if id in store.state.team else "+ ")+title,func():
			var team=store.state.team.duplicate()
			if id in team: team.erase(id)
			elif team.size()<6: team.append(id)
			store.set_team(team)
			roster()
		)

func growth_screen() -> void:
	clear()
	label(root,"TU LUYỆN NINJA",30)
	label(root,"Cuộn EXP nhỏ: %s | Đá đột phá: %s" % [store.state.inventory.get("RES-116",0),store.state.inventory.get("RES-128",0)],18)
	button(root,"Trở về",func():menu())
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	for id in store.state.owned:
		var p=store.state.owned[id]
		button(rows,"%s | Cấp %d | Cảnh %d | %d sao" % [reg.ninjas[id].name_vi,int(p.level),int(p.realm),int(p.stars)],func():growth_detail(id))

func growth_detail(id: String,message: String="") -> void:
	clear()
	var p=store.state.owned[id]
	store.ensure_growth(p)
	label(root,str(reg.ninjas[id].name_vi),30)
	label(root,"Cấp %d / %d | Cảnh %d | XP %d | Điểm %d | Sao %d | Mảnh %d" % [int(p.level),(int(p.realm)+1)*20,int(p.realm),int(p.xp),int(p.points),int(p.stars),int(p.shards)],18)
	label(root,"Cuộn EXP: %s | Đá đột phá: %s | Bảo hiểm: %d/5" % [store.state.inventory.get("RES-116",0),store.state.inventory.get("RES-128",0),int(p.realm_failures)],18)
	var row=HBoxContainer.new()
	root.add_child(row)
	button(row,"Dùng 1 cuộn (+200 XP)",func():growth_detail(id,"Đã tu luyện" if store.train(id) else "Thiếu cuộn hoặc đã đạt giới hạn cảnh"))
	button(row,"Đột phá",func():
		var result=store.breakthrough(id)
		var messages={"success":"Đột phá thành công","failure":"Thất bại, đã tăng bảo hiểm","locked":"Chưa đủ điều kiện","error":"Lỗi lưu"}
		growth_detail(id,messages[result]))
	button(row,"Tăng sao",func():growth_detail(id,"Đã tăng sao" if store.raise_star(reg,id) else "Thiếu mảnh/vật liệu hoặc đã đủ 15 sao"))
	var stats={"strength":"Sức mạnh","vitality":"Thể chất","spirit":"Tinh thần","agility":"Nhanh nhẹn","intellect":"Trí tuệ","potential":"Tiềm năng"}
	for key in stats:
		button(root,"%s +1 | Đã phân bổ %s" % [stats[key],p.allocated.get(key,0)],func():growth_detail(id,"Đã phân bổ" if store.allocate(id,key) else "Không còn điểm"))
	label(root,message,18)
	var nav=HBoxContainer.new()
	root.add_child(nav)
	button(nav,"Nhẫn thuật",func():skill_screen(id))
	button(nav,"Thức tỉnh",func():awakening_screen(id))
	button(nav,"Trở về",growth_screen)

func campaign() -> void:
	clear()
	label(root,"CỐT TRUYỆN • 120 ải",30)
	button(root,"Trở về",func():menu())
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	var ids=reg.stages.keys()
	ids.sort()
	for id in ids:
		var s=reg.stages[id]
		var locked=s.requires!=null and not store.state.cleared.has(str(s.requires))
		var b=button(rows,"%s  %s  • %s thể lực" % [id,s.name_vi,s.stamina_cost],func():start_battle(s))
		b.disabled=locked

func start_battle(stage: Dictionary) -> void:
	var id=store.begin_stage(stage)
	if id.is_empty():
		menu("Thiếu thể lực, đội hình hoặc điều kiện mở ải")
		return
	battle_stage=stage
	event_id=id
	sim=Combat.new()
	sim.setup(reg,store.state,stage,int(store.state.battle_seq))
	accumulator=0
	clear()
	label(root,"CHIẾN ĐẤU • "+str(stage.name_vi)+"  (DEV)",28)
	status=label(root,"",18)
	field=Control.new()
	field.custom_minimum_size=Vector2(0,360)
	field.size_flags_vertical=Control.SIZE_EXPAND_FILL
	field.draw.connect(draw_field)
	root.add_child(field)
	var row=HBoxContainer.new()
	root.add_child(row)
	ult_buttons.clear()
	for i in range(store.state.team.size()):
		var a=sim.actors[i]
		var b=button(row,str(reg.ninjas[a.id].name_vi).split(" (")[0],func(): sim.ultimate(i))
		ult_buttons.append(b)
		if a.contract!="":button(row,"Thông linh",func():sim.summon_contract(a))
		for form_id in a.forms:
			if reg.form_rules[form_id].activation!="skill_trigger":button(row,"Biến thân",func():sim.activate_form(a,form_id,true))
	log_label=label(root,"",16)
	button(root,"Rút lui",func():finish(false))

func iso(p: Vector2) -> Vector2:
	return Vector2(field.size.x*0.45+(p.x-p.y)*38,45+(p.x+p.y)*20)

func draw_field() -> void:
	if sim==null:return
	for x in range(12):
		for y in range(8):
			var p=iso(Vector2(x,y))
			var points=PackedVector2Array([p,p+Vector2(38,20),p+Vector2(0,40),p+Vector2(-38,20)])
			field.draw_colored_polygon(points,Color("#405b50") if (x+y)%2==0 else Color("#354e45"))
	var render_order=sim.actors.duplicate()
	render_order.sort_custom(func(a,b):return a.pos.x+a.pos.y<b.pos.x+b.pos.y)
	for a in render_order:
		if a.hp<=0:continue
		var p=iso(a.pos)
		var c=Color("#e3a33e") if a.side==0 else Color("#b65364")
		field.draw_circle(p,13,Color("#152029"))
		field.draw_rect(Rect2(p-Vector2(9,30),Vector2(18,26)),c)
		field.draw_circle(p-Vector2(0,34),9,Color("#e4bc91"))
		field.draw_rect(Rect2(p-Vector2(20,52),Vector2(40,4)),Color("#222733"))
		field.draw_rect(Rect2(p-Vector2(20,52),Vector2(40*float(a.hp)/float(a.max_hp),4)),Color("#80c484"))
		field.draw_string(ThemeDB.fallback_font,p+Vector2(-16,12),str(a.id).right(3),HORIZONTAL_ALIGNMENT_LEFT,-1,14)

func _process(delta: float) -> void:
	clock_accumulator+=delta
	if clock_accumulator>=15.0:
		clock_accumulator=0.0
		store.advance_clock(reg,int(Time.get_unix_time_from_system()))
	if sim==null:return
	accumulator+=minf(delta,0.25)
	while accumulator>=0.05:
		sim.tick(0.05)
		accumulator-=0.05
		if not sim.outcome.is_empty():
			finish(sim.outcome=="win")
			return
	status.text="Đồng đội %d • Đối thủ %d • %.1fs" % [sim.primary_alive(0).size(),sim.primary_alive(1).size(),sim.ticks*0.05]
	if sim.deadlock: status.text+=" • Bế tắc: có thể rút lui"
	for i in range(ult_buttons.size()):
		var a=sim.actors[i]
		var s=reg.skills[a.skills[5]]
		ult_buttons[i].disabled=a.hp<=0 or not sim.ready(a,s)
		ult_buttons[i].text=str(reg.ninjas[a.id].name_vi).split(" (")[0]+"\n"+str(int(a.chakra))+"/"+str(int(s.chakra))+" CP"
	log_label.text="  |  ".join(sim.log)
	field.queue_redraw()

func finish(won: bool) -> void:
	if sim==null:return
	var ok=store.finish_stage(reg,battle_stage,event_id,won,sim.counts,sim.mastery_counts)
	menu(("Chiến thắng" if won else "Thất bại / rút lui")+" • "+("Đã lưu kết quả" if ok else "Lỗi lưu kết quả"))

func skill_screen(id: String,message: String="") -> void:
	clear()
	label(root,"NHẪN THUẬT • "+str(reg.ninjas[id].name_vi),26)
	button(root,"Trở về",func():growth_detail(id))
	label(root,message,16)
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	for skill_id in reg.ninjas[id].skills+reg.ninjas[id].additional_skill_ids:
		var sk=store.skill_progress(store.state.owned[id],skill_id)
		var row=HBoxContainer.new()
		rows.add_child(row)
		var name_label=label(row,"%s | Giai %d cấp %d" % [reg.names[skill_id].name_vi,int(sk.grade),int(sk.level)],18)
		name_label.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		if not store.skill_allowed(reg,id,skill_id):
			var trial_id=str(reg.names[skill_id].unlock_require.challenge_id)
			var trial_button=button(row,"Thử thách mở khóa",func():skill_screen(id,"Đã mở" if store.run_trial(reg,id,trial_id) else "Chưa thắng hoặc chưa đủ điều kiện"))
			trial_button.disabled=not store.trial_ready(reg,id,trial_id)
		elif reg.skill_policies.has(skill_id):
			button(row,"Tăng cấp",func():skill_screen(id,"Đã tăng cấp" if store.upgrade_skill(reg,id,skill_id) else "Thiếu sách hoặc đủ cấp"))
			button(row,"Tiến giai",func():skill_screen(id,{"success":"Thành công","failure":"Thất bại, tăng bảo hiểm","locked":"Chưa đủ điều kiện","error":"Lỗi lưu"}[store.advance_skill(reg,id,skill_id)]))
			for branch in reg.skill_policies[skill_id].branches:
				if int(sk.grade)>=int(branch.unlock_grade) and str(sk.branch).is_empty():
					button(row,str(branch.name_vi),func():skill_screen(id,"Đã chọn nhánh" if store.choose_skill_branch(reg,id,skill_id,branch.id) else "Không thể chọn"))

func gear_screen(message: String="") -> void:
	clear()
	label(root,"TRANG BỊ • kho cá nhân",30)
	label(root,message,18)
	var nav=HBoxContainer.new()
	root.add_child(nav)
	button(nav,"Trở về",func():menu())
	button(nav,"Công thức chế tạo",gear_craft_screen)
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	if store.state.gear_instances.is_empty():label(rows,"Chưa có trang bị. Cần mở Xưởng chế tạo và đủ nguyên liệu.",18)
	for id in store.state.gear_instances:
		var g=store.state.gear_instances[id]
		button(rows,"%s +%d | Tinh luyện %d | %s" % [reg.gear_templates[g.template_id].name_vi,int(g.enhance),int(g.refine),reg.ninjas[g.owner].name_vi if not str(g.owner).is_empty() else "Chưa mặc"],func():gear_detail(id))

func gear_craft_screen() -> void:
	clear()
	label(root,"CÔNG THỨC TRANG BỊ",30)
	label(root,"Cần xưởng đúng loại và đủ nguyên liệu. Hệ thống xây xưởng thuộc lô làng.",16)
	button(root,"Trở về",func():gear_screen())
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	for id in reg.gear_templates:
		var def=reg.gear_templates[id]
		var b=button(rows,"%s | %s" % [def.name_vi,str(def.craft.inputs)],func():gear_screen("Đã chế tạo" if not store.craft_gear(reg,id).is_empty() else "Chưa đủ nguyên liệu"))
		b.disabled=int(store.state.building_states.get(def.craft.building_id,{}).get("level",0))<=0

func gear_detail(id: String,message: String="") -> void:
	clear()
	var g=store.state.gear_instances[id]
	var def=reg.gear_templates[g.template_id]
	label(root,"%s +%d" % [def.name_vi,int(g.enhance)],30)
	label(root,"Phẩm %d | Tinh luyện %d | Tiến hóa %d | Bảo hiểm %d/20" % [int(g.quality),int(g.refine),int(g.evolution),int(g.fails)],18)
	button(root,"Thuộc tính / bộ trang bị",func():affix_screen(id))
	label(root,message,18)
	var row=HBoxContainer.new()
	root.add_child(row)
	button(row,"Cường hóa",func():gear_detail(id,store.enhance_gear(id)))
	button(row,"Cường hóa bảo hộ",func():gear_detail(id,store.enhance_gear(id,true)))
	button(row,"Tinh luyện",func():gear_detail(id,"Đã tinh luyện" if store.refine_gear(id) else "Thiếu nguyên liệu"))
	button(row,"Tiến hóa",func():gear_detail(id,"Đã tiến hóa" if store.refine_gear(id,true) else "Thiếu nguyên liệu"))
	button(root,"Trở về",func():gear_screen())
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	for ninja in store.state.owned:
		var b=button(rows,("Tháo khỏi " if g.owner==ninja else "Mặc cho ")+str(reg.ninjas[ninja].name_vi),func():gear_detail(id,"Đã cập nhật" if store.equip_gear(reg,ninja,id) else "Hãy tháo khỏi chủ cũ"))
		b.disabled=not str(g.owner).is_empty() and g.owner!=ninja
	for gem in reg.gear_rules.socket.gems:
		var resource=str(gem.resource_id)
		var gems=HBoxContainer.new()
		rows.add_child(gems)
		button(gems,"Khảm "+resource+" ("+str(store.state.inventory.get(resource,0))+")",func():gear_detail(id,"Đã khảm" if store.socket_gear(reg,id,resource) else "Thiếu đá hoặc ô trống"))
		if resource in g.gems:button(gems,"Tháo "+resource,func():gear_detail(id,"Đã tháo" if store.socket_gear(reg,id,resource,true) else "Lỗi"))

func awakening_screen(id: String,message: String="") -> void:
	clear()
	var p=store.state.owned[id]
	label(root,"THỨC TỈNH • "+str(reg.ninjas[id].name_vi),30)
	label(root,"Phẩm %s | Thành thạo %d | Thiên phú %s" % [p.quality,store.total_mastery(p),p.get("talent","")],18)
	label(root,message,18)
	button(root,"Thử thách phẩm chất",func():awakening_screen(id,"Thắng thử thách" if store.quality_trial(reg,id) else "Chưa đủ điều kiện hoặc chưa thắng"))
	button(root,"Tiến hóa phẩm chất",func():awakening_screen(id,"Đã tiến hóa" if store.evolve_quality(reg,id) else "Chưa đủ điều kiện"))
	for form_id in reg.ninjas[id].form_ids:
		var b=button(root,str(reg.forms[form_id].name_vi)+" • mở khóa",func():awakening_screen(id,"Đã mở hình thái" if store.unlock_form(reg,id,form_id) else "Chưa đủ cảnh giới hoặc tinh hoa"))
		b.disabled=form_id in p.forms
	button(root,"Trở về",func():growth_detail(id))

func village_screen(message: String="") -> void:
	clear()
	store.advance_clock(reg,int(Time.get_unix_time_from_system()))
	label(root,"LÀNG NINJA • 30 lô cố định",30)
	label(root,("Ryo %d | Gỗ %d | Đá %d | " % [int(store.state.inventory.get("RES-001",0)),int(store.state.inventory.get("RES-006",0)),int(store.state.inventory.get("RES-009",0))])+message,18)
	var row=HBoxContainer.new()
	root.add_child(row)
	button(row,"Trở về",func():menu())
	button(row,"Làm mới",func():village_screen())
	button(row,"Kho tài nguyên",inventory_screen)
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	for id in reg.buildings:
		var b=store.state.building_states[id]
		var def=reg.buildings[id]
		var detail="Chưa xây" if int(b.level)==0 else "Cấp %d" % int(b.level)
		if not b.upgrade.is_empty():detail+=" | Đang xây %ds" % int(b.upgrade.remaining)
		button(rows,"%s • %s • %s" % [def.fixed_slot,def.name_vi,detail],func():building_screen(id))

func inventory_screen() -> void:
	clear()
	label(root,"KHO TÀI NGUYÊN",30)
	button(root,"Trở về",func():village_screen())
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	for id in reg.resources:label(rows,"%s  •  %s" % [reg.resources[id].name_vi,store.state.inventory.get(id,0)],18)

func building_screen(id: String,message: String="") -> void:
	clear()
	store.advance_clock(reg,int(Time.get_unix_time_from_system()))
	var b=store.state.building_states[id]
	var def=reg.buildings[id]
	label(root,"%s • Cấp %d/100" % [def.name_vi,int(b.level)],28)
	label(root,("Yêu cầu Tổng bộ %d | " % int(def.unlock_hq))+message,18)
	var cost=preload("res://game/village_service.gd").upgrade_cost(reg,store.state,id)
	var nav=HBoxContainer.new()
	root.add_child(nav)
	var upgrade=button(nav,"Xây/nâng cấp: %d Ryo, %d gỗ, %d đá" % [cost["RES-001"],cost["RES-006"],cost["RES-009"]],func():building_screen(id,"Đã đặt lịch" if store.construct(reg,id) else "Chưa đủ điều kiện"))
	upgrade.disabled=not b.upgrade.is_empty() or int(b.level)>=100
	if not b.upgrade.is_empty():label(root,"Còn %d giây" % int(b.upgrade.remaining),18)
	button(nav,"Làm mới",func():building_screen(id))
	if float(b.condition)<1:button(nav,"Sửa chữa",func():building_screen(id,"Đã sửa" if store.repair_building(reg,id) else "Thiếu Ryo"))
	button(nav,"Trở về",func():village_screen())
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	if int(b.level)==0:return
	label(rows,"Nhân lực (không ảnh hưởng đội chiến đấu)",20)
	for ninja in store.state.owned:
		var job=store.state.jobs.get(ninja,{})
		var row=HBoxContainer.new()
		rows.add_child(row)
		label(row,str(reg.ninjas[ninja].name_vi),16)
		var options=OptionButton.new()
		for profession in reg.professions:
			options.add_item(str(reg.professions[profession].name_vi))
			options.set_item_metadata(options.item_count-1,profession)
		row.add_child(options)
		button(row,"Phân công",func():building_screen(id,"Đã phân công" if store.assign_job(reg,ninja,id,str(options.get_selected_metadata())) else "Hết chỗ"))
		if job.get("building","")==id:
			button(row,"Thiên phú nghề",func():profession_screen(ninja,id))
			button(row,"Rút",func():building_screen(id,"Đã rút" if store.assign_job(reg,ninja,"","") else "Lỗi"))
	if not b.production.is_empty():
		label(rows,"Đang sản xuất %s • còn %ds" % [b.production.recipe,int(b.production.remaining)],18)
		button(rows,"Dừng và hoàn nguyên liệu",func():building_screen(id,"Đã dừng" if store.cancel_production(id) else "Kho đầy"))
	else:
		for recipe_id in def.recipe_ids:
			var recipe=reg.recipes[recipe_id]
			var row=HBoxContainer.new()
			rows.add_child(row)
			var output=str(reg.resources[recipe.output.resource_id].name_vi)
			label(row,"%s ×%d (cấp %d)" % [output,int(recipe.output.qty),int(recipe.min_building_level)],16)
			button(row,"Sản xuất",func():building_screen(id,"Đã đặt" if store.production(reg,id,recipe_id,false) else "Thiếu nguyên liệu hoặc nhân lực"))
			button(row,"Tự động",func():building_screen(id,"Đã bật" if store.production(reg,id,recipe_id,true) else "Chưa đủ điều kiện"))

func world_screen(message: String="") -> void:
	clear()
	store.advance_clock(reg,int(Time.get_unix_time_from_system()))
	label(root,"NHẪN GIỚI • 60 lãnh địa",28)
	label(root,"Hiện tại: "+str(reg.territories[store.state.world_location].name_vi)+" | "+message,18)
	var nav=HBoxContainer.new()
	root.add_child(nav)
	button(nav,"Trở về",func():menu())
	button(nav,"Làm mới",func():world_screen())
	button(nav,"Ngoại giao",diplomacy_screen)
	if not store.state.travel.is_empty():label(root,"Đang di chuyển • còn %ds" % int(store.state.travel.remaining),18)
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	for id in reg.territories:
		var t=store.state.territory_states[id]
		var route=preload("res://game/world_service.gd").path(reg,store.state,store.state.world_location,id)
		var row=HBoxContainer.new()
		rows.add_child(row)
		label(row,"%s • %s • %s" % [id,reg.territories[id].name_vi if t.discovered or not route.is_empty() else "Chưa khám phá",str(t.owner) if t.discovered else "?"],16)
		if id!=store.state.world_location and not route.is_empty() and store.state.travel.is_empty():
			button(row,"Đi (%ds)" % int(route.seconds),func():world_screen("Đã xuất phát" if store.travel_to(reg,id) else "Không thể đi"))
		if id==store.state.world_location and t.owner!="FAC-009":
			button(row,"Chiếm lĩnh",func():world_screen("Đã xử lý giao tranh" if store.capture_territory(reg,id) else "Chưa đủ điều kiện hoặc không thể chiếm"))
	if not store.state.world_log.is_empty():label(root,str(store.state.world_log.back()),16)

func diplomacy_screen(message: String="") -> void:
	clear()
	label(root,"NGOẠI GIAO",28)
	label(root,message,18)
	button(root,"Trở về",func():world_screen())
	for id in reg.factions:
		if id=="FAC-009":continue
		var r=preload("res://game/world_service.gd").relation(store.state,"FAC-009",id)
		button(root,"%s | %s | %d" % [reg.factions[id].name_vi,r.state,int(r.score)],func():faction_screen(id))

func faction_screen(id: String,message: String="") -> void:
	clear()
	var r=preload("res://game/world_service.gd").relation(store.state,"FAC-009",id)
	label(root,"%s | Quan hệ %d | %s" % [reg.factions[id].name_vi,int(r.score),r.state],28)
	label(root,message,18)
	var row=HBoxContainer.new()
	root.add_child(row)
	var actions={"gift":"Tặng 200 Ryo","trade":"Hiệp định thương mại","ally":"Đồng minh","war":"Tuyên chiến","peace":"Đình chiến","break":"Hủy hiệp định"}
	for action in actions:button(row,actions[action],func():faction_screen(id,"Đã xử lý" if store.diplomatic_action(reg,id,action) else "Không đủ điều kiện"))
	button(root,"Trở về",func():diplomacy_screen())
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	for resource in reg.resources:
		if not reg.resources[resource].tradable or resource in ["RES-001","RES-002","RES-003","RES-004","RES-005"]:continue
		var stock=int(store.state.faction_states[id].stock.get(resource,0))
		if stock==0 and int(store.state.inventory.get(resource,0))==0:continue
		var line=HBoxContainer.new()
		rows.add_child(line)
		label(line,"%s | NPC %d | Bạn %d" % [reg.resources[resource].name_vi,stock,int(store.state.inventory.get(resource,0))],16)
		var buy=preload("res://game/world_service.gd").price(reg,store.state,id,resource,true)
		var sell=preload("res://game/world_service.gd").price(reg,store.state,id,resource,false)
		button(line,"Mua 1 (%d)" % buy,func():faction_screen(id,"Đã mua" if store.trade_resource(reg,id,resource,1,true) else "Thiếu điều kiện giao thương"))
		button(line,"Bán 1 (%d)" % sell,func():faction_screen(id,"Đã bán" if store.trade_resource(reg,id,resource,1,false) else "Thiếu điều kiện giao thương"))

func activity_rows(title: String,message: String,back: Callable) -> VBoxContainer:
	clear()
	label(root,title,28)
	label(root,message,18)
	button(root,"Trở về",back)
	var scroll=ScrollContainer.new()
	scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	scroll.add_child(rows)
	return rows

func activities_screen() -> void:
	clear()
	label(root,"HOẠT ĐỘNG NINJA",30)
	button(root,"Nhiệm vụ",quest_screen)
	button(root,"Phái ninja làm nhiệm vụ / thử thách tài nguyên",mission_screen)
	button(root,"Vĩ thú và phong ấn",beast_screen)
	button(root,"Thông linh thú",contract_screen)
	button(root,"Huyết kế và đồng thuật",bloodline_screen)
	button(root,"Trở về",func():menu())

func quest_screen(message: String="") -> void:
	var rows=activity_rows("NHIỆM VỤ • 81",message,activities_screen)
	preload("res://game/content_service.gd").sync_day(store.state)
	for id in reg.quests:
		var q=reg.quests[id]
		var count=preload("res://game/content_service.gd").objective(reg,store.state,q)
		var done=store.state.quest_claimed.has(preload("res://game/content_service.gd").claim_key(store.state,q))
		var b=button(rows,"%s | %d/%d | %s" % [q.name_vi,count,int(q.objective.count),"Đã nhận" if done else "Nhận thưởng"],func():quest_screen("Đã nhận" if store.claim_quest(reg,id) else "Chưa hoàn thành"))
		b.disabled=done or count<int(q.objective.count)

func mission_screen(message: String="") -> void:
	var rows=activity_rows("NHIỆM VỤ VÀ THỬ THÁCH TÀI NGUYÊN",message,activities_screen)
	for ninja in store.state.owned:
		button(rows,str(reg.ninjas[ninja].name_vi),func():mission_detail(ninja))

func mission_detail(ninja: String,message: String="") -> void:
	var rows=activity_rows("PHÁI ĐI • "+str(reg.ninjas[ninja].name_vi),message,func():mission_screen())
	var job=store.state.missions.get(ninja,{})
	if not job.is_empty():label(rows,"Đang làm nhiệm vụ "+str(job.resource)+" • còn "+str(job.remaining)+"s",18)
	for source in reg.supply:
		if not source.source_type in ["mission","mission_or_library","trial","bloodline_trial"]:continue
		var resource=str(source.resource_id)
		var text_value="%s ×%d | Tổng bộ %d" % [reg.resources[resource].name_vi,int(source.base_yield),int(source.source_min_hq)]
		if source.source_type in ["mission","mission_or_library"]:
			button(rows,text_value,func():mission_detail(ninja,"Đã phái đi" if store.start_mission(reg,ninja,resource) else "Chưa đủ điều kiện"))
		else:button(rows,text_value+" • đấu thử thách",func():mission_detail(ninja,"Đã thắng" if store.resource_trial(reg,ninja,resource) else "Chưa thắng / chưa đủ điều kiện"))

func beast_screen(message: String="") -> void:
	var rows=activity_rows("VĨ THÚ • 9",message,activities_screen)
	for id in reg.beasts:
		var b=store.state.beasts.get(id,{})
		button(rows,"%s | %s" % [reg.beasts[id].name,"Chưa thu phục" if b.is_empty() else "Cấp "+str(b.level)+" | "+str(b.host)],func():beast_detail(id))

func beast_detail(id: String,message: String="") -> void:
	var rows=activity_rows("VĨ THÚ • "+str(reg.beasts[id].name),message,func():beast_screen())
	if store.state.beasts.has(id):button(rows,"Tu luyện vĩ thú",func():beast_detail(id,"Đã tu luyện" if store.train_beast(reg,id) else "Thiếu tài nguyên"))
	for ninja in store.state.owned:
		if store.state.beasts.has(id):
			button(rows,"Phong ấn vào "+str(reg.ninjas[ninja].name_vi),func():beast_detail(id,"Đã phong ấn" if store.bind_beast(reg,ninja,id) else "Không tương thích / thiếu ấn"))
		else:button(rows,"Thử thu phục với "+str(reg.ninjas[ninja].name_vi),func():beast_detail(id,"Đã thu phục" if store.capture_beast(reg,ninja,id) else "Không thắng / thiếu điều kiện"))

func contract_screen(message: String="") -> void:
	var rows=activity_rows("THÔNG LINH THÚ • 11",message,activities_screen)
	for id in reg.contracts:
		var c=store.state.summon_contracts.get(id,{})
		button(rows,"%s | %s" % [reg.contracts[id].name,"Chưa ký" if c.is_empty() else "Cấp "+str(c.level)],func():contract_detail(id))

func contract_detail(id: String,message: String="") -> void:
	var rows=activity_rows(str(reg.contracts[id].name),message,func():contract_screen())
	if not store.state.summon_contracts.has(id):
		button(rows,"Ký khế ước",func():contract_detail(id,"Đã ký" if store.make_contract(reg,id) else "Thiếu vật liệu / công trình"))
		return
	button(rows,"Tăng cấp",func():contract_detail(id,"Đã tăng cấp" if store.train_contract(id) else "Thiếu Ryo"))
	for ninja in store.state.owned:
		button(rows,"Gán "+str(reg.ninjas[ninja].name_vi),func():contract_detail(id,"Đã gán" if store.assign_contract(id,ninja) else "Đã có chủ / đã có khế ước"))

func bloodline_screen(message: String="") -> void:
	var rows=activity_rows("HUYẾT KẾ VÀ ĐỒNG THUẬT",message,activities_screen)
	for ninja in store.state.owned:
		for id in reg.bloodlines:
			var def=reg.bloodlines[id]
			if def.required_family_for_native==null or def.required_family_for_native!=reg.ninjas[ninja].family_hint or id=="BL-139":continue
			button(rows,"%s | %s | Bậc %s" % [reg.ninjas[ninja].name_vi,def.name_vi,store.state.owned[ninja].bloodline_levels.get(id,0)],func():bloodline_screen("Đã thức tỉnh / nâng cấp" if store.native_bloodline(reg,ninja,id) else "Thiếu điều kiện"))

func save_screen(message: String="") -> void:
	clear()
	label(root,"LƯU / KHÔI PHỤC GAME",28)
	label(root,message,18)
	var edit=TextEdit.new()
	edit.size_flags_vertical=Control.SIZE_EXPAND_FILL
	edit.text=store.export_save()
	root.add_child(edit)
	var row=HBoxContainer.new()
	root.add_child(row)
	button(row,"Sao chép",func():DisplayServer.clipboard_set(edit.text))
	if OS.has_feature("web"):button(row,"Tải JSON",func():JavaScriptBridge.download_buffer(edit.text.to_utf8_buffer(),"naru-save.json","application/json"))
	button(row,"Nhập JSON trong ô",func():save_screen("Đã nhập" if store.import_save(reg,edit.text) else "Save không hợp lệ hoặc cũ hơn mốc thời gian hiện tại"))
	button(row,"Trở về",func():menu())

func affix_screen(id: String,message: String="") -> void:
	var rows=activity_rows("THUỘC TÍNH TRANG BỊ",message,func():gear_detail(id))
	var item=store.state.gear_instances[id]
	var pending=item.get("pending_affix",{})
	if not pending.is_empty():
		label(rows,"Đề xuất mới: %s +%s" % [pending.stat,pending.value],18)
		button(rows,"Chấp nhận",func():affix_screen(id,"Đã nhận" if store.settle_affix(id,true) else "Lỗi"))
		button(rows,"Giữ cũ",func():affix_screen(id,"Đã giữ" if store.settle_affix(id,false) else "Lỗi"))
	var affixes=item.get("affixes",[])
	for i in range(affixes.size()):
		var a=affixes[i]
		button(rows,"%s +%s • Tẩy luyện (5 vật liệu)" % [a.stat,a.value],func():affix_screen(id,"Đã tạo đề xuất" if store.reroll_affix(reg,id,i) else "Thiếu nguyên liệu / cần xử lý đề xuất"))
	label(rows,"Bộ: "+str(item.get("set_id","")),18)
	if str(item.get("set_id",""))=="":
		for rule in reg.gear_rules.sets:
			if reg.gear_templates[item.template_id].slot_id in rule.eligible_slots:button(rows,"Gắn bộ "+str(rule.name_vi)+" (5 vật liệu)",func():affix_screen(id,"Đã gắn bộ" if store.set_gear_set(reg,id,rule.id) else "Thiếu điều kiện"))

func web_probe() -> void:
	# Browser integration uses a separate temporary save, never the normal player save.
	var test=SaveStore.new()
	test.save_path="user://naru_browser_qa.json"
	test.new_game(reg)
	test.rng.seed=42
	var recruited=test.draw(reg)
	var team=test.state.owned.keys()
	var ok=not recruited.is_empty() and test.set_team(team)
	var stage=reg.stages["STG-001"]
	var event=test.begin_stage(stage)
	var battle=Combat.new()
	battle.setup(reg,test.state,stage,42)
	for i in range(24000):
		battle.tick(0.05)
		if not battle.outcome.is_empty():break
	ok=ok and battle.outcome=="win" and test.finish_stage(reg,stage,event,true,battle.counts,battle.mastery_counts)
	ok=ok and test.train("NIN-001")
	var reloaded=SaveStore.new()
	reloaded.save_path=test.save_path
	reloaded.load_or_new(reg)
	ok=ok and reloaded.state.cleared.has("STG-001") and not reloaded.finish_stage(reg,stage,event,true,{})
	JavaScriptBridge.eval("window.naruProbe="+("true" if ok else "false"))
	print("NARU_WEB_PROBE_"+("PASS" if ok else "FAIL"))

func profession_screen(ninja: String,building_id: String,message: String="") -> void:
	var rows=activity_rows("THIÊN PHÚ NGHỀ • "+str(reg.ninjas[ninja].name_vi),message,func():building_screen(building_id))
	var job=store.state.jobs[ninja]
	for profession in job.careers:
		var career=job.careers[profession]
		label(rows,"%s • Cấp %d • XP %d" % [reg.professions[profession].name_vi,int(career.level),int(career.xp)],18)
		var titles={"yield":"Năng suất","economy":"Tiết kiệm nguyên liệu","quality":"Chất lượng","speed":"Tốc độ"}
		for talent in titles:
			button(rows,"%s (+%d điểm)" % [titles[talent],int(career.get("talents",{}).get(talent,0))],func():profession_screen(ninja,building_id,"Đã nâng" if store.choose_job_talent(ninja,profession,talent) else "Chưa có điểm"))
