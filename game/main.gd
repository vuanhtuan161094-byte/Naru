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
	menu()

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
	label(root,"DEV • GP-P2 — mỹ thuật tạm",16)
	label(root,"Ryo: %s     Ngọc: %s     Thể lực: %s     Ninja: %s / 144" % [store.state.inventory.get("RES-001",0),store.state.inventory.get("RES-002",0),store.state.stamina,store.state.owned.size()])
	var row=HBoxContainer.new()
	root.add_child(row)
	button(row,"Chiêu mộ (100 ngọc)",recruit_one)
	button(row,"Đội hình",roster)
	button(row,"Tu luyện",growth_screen)
	button(row,"Trang bị",gear_screen)
	button(row,"Tải lại",func(): store.load_or_new(reg); menu("Đã tải lại"))
	button(row,"Cốt truyện",campaign)
	button(row,"Lưu game",func(): menu("Đã lưu" if store.save_now() else "Lưu thất bại"))
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
	var ok=store.finish_stage(reg,battle_stage,event_id,won,sim.counts)
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
			label(row,"Chưa mở: cần thử thách",16)
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
