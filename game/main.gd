extends Control
const Registry=preload("res://game/data_registry.gd")
const SaveStore=preload("res://game/save_store.gd")
const Combat=preload("res://game/combat.gd")
const CombatStats=preload("res://game/combat_stat_snapshot.gd")
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
const ReviewArt=preload("res://game/review_art.gd")
var art=ReviewArt.new()
const VillageMap=preload("res://game/village_map_r11.gd")
var village_map=VillageMap.new()
var art_callback: JavaScriptObject
var auto_art_callback: JavaScriptObject
var review_mode=false
var private_backdrop: TextureRect
var screen_id="home"
var shell: VBoxContainer
var header: HBoxContainer
var navigation: HBoxContainer
var resource_bar: Label
var paused=false
var battle_speed=1.0
var ult_actions: Array[Dictionary]=[]
var battle_cards: Array[Dictionary]=[]
var observation_mode=false
var battle_details=false
var battle_grid=false
var battle_actions_panel: ScrollContainer
var battle_dock: PanelContainer
var battle_dock_content: VBoxContainer
var battle_selected_portrait: TextureRect
var battle_skill_info: Label
var battle_state_info: Label
var battle_mini: HBoxContainer
var battle_observe_button: Button
var battle_detail_button: Button
var battle_grid_button: Button
var battle_speed_buttons: Dictionary={}
var battle_team_status: Label
var battle_frame:Dictionary={"zoom":1.0,"shift":Vector2.ZERO}
var battle_action_groups: Dictionary={}
const BattleCamera=preload("res://game/battle_camera.gd")
var battle_inspector: Label
var inspected_uid=0
var hud_clock=0.0
var form_actions: Array[Dictionary]=[]
var last_video_ult_tick=-1
var last_private_trace_tick=-1
var qa_clock=0.0
var roster_query=""
var roster_quality=0
var roster_element=""
var roster_era=""
var roster_job=""
var inventory_query=""
var selected_territory="TER-058"
var selected_slot=0
var last_reward: Array=[]
var last_growth: Dictionary={}
const Village=preload("res://game/village_service.gd")
const World=preload("res://game/world_service.gd")
const Stats=preload("res://game/stats_service.gd")
const Content=preload("res://game/content_service.gd")

func _ready() -> void:
	theme=make_theme()
	art.restore()
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--art-pack="):
			var path=arg.trim_prefix("--art-pack=")
			if FileAccess.file_exists(path):art.import_text(FileAccess.get_file_as_string(path),false)
	var bg=ColorRect.new()
	bg.color=Color("#101b23")
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(bg)
	private_backdrop=TextureRect.new()
	private_backdrop.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	private_backdrop.expand_mode=TextureRect.EXPAND_IGNORE_SIZE
	private_backdrop.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED
	private_backdrop.modulate=Color(0.32,0.37,0.37,0.65)
	private_backdrop.mouse_filter=Control.MOUSE_FILTER_IGNORE
	add_child(private_backdrop)
	shell=VBoxContainer.new()
	shell.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	shell.offset_left=18
	shell.offset_right=-18
	shell.offset_top=10
	shell.offset_bottom=-10
	shell.add_theme_constant_override("separation",8)
	add_child(shell)
	header=HBoxContainer.new()
	shell.add_child(header)
	var brand=label(header,"NARU",30)
	brand.modulate=Color("#f1bb69")
	resource_bar=label(header,"",17)
	resource_bar.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	label(header,"NARU • V3",15)
	navigation=HBoxContainer.new()
	shell.add_child(navigation)
	for item in [["Làng",menu],["Ninja",growth_screen],["Bố trận",roster],["Chiêu mộ",recruit_screen],["Cốt truyện",campaign],["Nhẫn giới",world_screen],["Kho",inventory_screen],["Nhiệm vụ",quest_screen],["Vĩ Thú",beast_screen],["Cài đặt",settings_screen]]:
		var nav_button=button(navigation,item[0],item[1])
		nav_button.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	root=VBoxContainer.new()
	root.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_theme_constant_override("separation",8)
	shell.add_child(root)
	# Owner-approved public build includes the exact verified pack in the PCK.
	var pack_path="res://assets/public/naru-art.json"
	if FileAccess.file_exists(pack_path) or OS.has_feature("public_art"):
		if not FileAccess.file_exists(pack_path) or not art.import_text(FileAccess.get_file_as_string(pack_path),false) or art.textures.size()!=224:
			navigation.hide()
			header.hide()
			label(root,"Lỗi nạp mỹ thuật bản Web. Hãy tải lại trang. "+art.error)
			push_error("NARU_PUBLIC_ART_FAIL "+art.error)
			return
		art.source_label="MỸ THUẬT TÍCH HỢP • "+str(art.textures.size())+" ảnh"
		print("NARU_PUBLIC_ART_READY ",art.textures.size())
		# Load only complete, validated per-character overlays when the binary is actually present.
		for overlay_id in ["NIN-001","NIN-002"]:
			var overlay_path="res://assets/production/r13/"+overlay_id+".json"
			if FileAccess.file_exists(overlay_path):
				if art.import_character_overlay(FileAccess.get_file_as_string(overlay_path),overlay_id):
					print("NARU_CHARACTER_OVERLAY_READY ",overlay_id)
				else:
					push_warning("NARU_CHARACTER_OVERLAY_HOLD "+overlay_id+": "+art.error)
		if OS.has_feature("web"):JavaScriptBridge.eval("window.naruPublicArtCount="+str(art.textures.size()))
	if not reg.load_all():
		label(root,"Lỗi dữ liệu: "+str(reg.errors))
		return
	if OS.has_feature("web"):
		web_qa=bool(JavaScriptBridge.eval("new URLSearchParams(location.search).has('qa')"))
		if web_qa:
			store.save_path="user://naru_ui_qa.json"
			store.new_game(reg)
			store.rng.seed=42
		else:store.load_or_new(reg)
	else:store.load_or_new(reg)
	if "--smoke" in OS.get_cmdline_user_args():
		print("NARU_REGISTRY_OK ",reg.ninjas.size()," ",reg.skills.size()," ",reg.stages.size())
		get_tree().quit()
		return
	store.advance_clock(reg,int(Time.get_unix_time_from_system()))
	apply_settings()
	menu(store.load_notice)
	if "--combat-video" in OS.get_cmdline_user_args():
		if "--private-capture" in OS.get_cmdline_user_args():
			if not art.enabled or art.textures.size()<224:
				push_error("NARU_PRIVATE_CAPTURE_FAIL missing P3 art pack")
				get_tree().quit(2)
				return
			for id in ["NIN-041","NIN-042","NIN-043","NIN-004","NIN-060","NIN-093","NIN-001","NIN-002","NIN-003","NIN-016","NIN-070","NIN-068"]:
				if art.texture("characters/"+id+".png")==null:
					push_error("NARU_PRIVATE_CAPTURE_FAIL missing "+id)
					get_tree().quit(2)
					return
			print("NARU_PRIVATE_CAPTURE_ART_READY ",art.textures.size()," textures, 12 character identities")
		start_art_review()
		print("NARU_VIDEO_BATTLE ",sim.actors.size()," actors")
		return
	if OS.has_feature("web") and not web_qa and art.textures.is_empty():call_deferred("try_local_art_pack")
	if web_qa:
		JavaScriptBridge.eval("window.naruReady=true")
		call_deferred("web_probe")

func clear() -> void:
	for c in root.get_children():
		root.remove_child(c)
		c.queue_free()

# Shared product header: uses private authored images when present, without changing gameplay.
func product_art_header(parent: Node,path: String,title_text: String,subtitle: String,extent: int) -> VBoxContainer:
	var frame=PanelContainer.new()
	frame.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	parent.add_child(frame)
	var row=HBoxContainer.new()
	row.add_theme_constant_override("separation",12)
	frame.add_child(row)
	var tex=art.texture(path)
	if tex!=null:
		var portrait=TextureRect.new()
		portrait.texture=tex
		portrait.expand_mode=TextureRect.EXPAND_IGNORE_SIZE
		portrait.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		portrait.custom_minimum_size=Vector2(extent,extent)
		portrait.mouse_filter=Control.MOUSE_FILTER_IGNORE
		row.add_child(portrait)
	var info=VBoxContainer.new()
	info.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	info.alignment=BoxContainer.ALIGNMENT_CENTER
	row.add_child(info)
	label(info,title_text,27).modulate=Color("#f1d398")
	label(info,subtitle,17)
	return info

func label(parent: Node,value: String,size: int=22) -> Label:
	var l=Label.new()
	l.text=value
	l.text_overrun_behavior=TextServer.OVERRUN_TRIM_ELLIPSIS
	l.tooltip_text=value
	l.add_theme_font_size_override("font_size",size)
	if parent is HBoxContainer or parent is GridContainer:
		l.custom_minimum_size.x=clampf(ThemeDB.fallback_font.get_string_size(value,HORIZONTAL_ALIGNMENT_LEFT,-1,size).x,45,320)
	parent.add_child(l)
	return l

func button(parent: Node,title: String,fn: Callable) -> Button:
	var b=Button.new()
	b.text=title
	var max_width=190.0 if parent is GridContainer else 260.0
	var measured=0.0
	for line in title.split("\n"):measured=maxf(measured,ThemeDB.fallback_font.get_string_size(line,HORIZONTAL_ALIGNMENT_LEFT,-1,17).x+24)
	b.custom_minimum_size=Vector2(clampf(measured,76,max_width),44)
	b.text_overrun_behavior=TextServer.OVERRUN_TRIM_ELLIPSIS
	b.tooltip_text=title
	b.pressed.connect(fn)
	parent.add_child(b)
	return b

func menu(message: String="") -> void:
	sim=null
	review_mode=false
	home_screen(message)

func recruit_one() -> void:
	var id=store.draw(reg)
	recruit_screen("Chiêu mộ: "+str(reg.ninjas[id].name_vi) if not id.is_empty() else "Không đủ ngọc")

func roster(message: String="") -> void:
	open_screen("formation")
	label(root,"BỐ TRẬN • 3×3 • "+str(store.state.team.size())+"/6 ninja",26)
	var tools=HBoxContainer.new()
	root.add_child(tools)
	button(tools,"Đội viễn chinh / phòng thủ",squad_menu)
	button(tools,"Vào cốt truyện",campaign)
	label(tools,"Hàng trước • giữa • sau",16)
	var options=OptionButton.new()
	tools.add_child(options)
	var ids=reg.formations.keys()
	for id in ids:
		var rule=reg.formations[id]
		options.add_item(str(rule.name_vi)+" • Lv."+str(store.state.formation_levels[id]))
	options.select(ids.find(store.state.formation_id))
	options.disabled=not store.state.travel.is_empty()
	options.item_selected.connect(func(index):store.select_formation(reg,str(ids[index]));roster())
	var active=str(store.state.formation_id)
	var current=int(store.state.formation_levels[active])
	var up=button(tools,"Nâng trận pháp • "+str(ceili(float(reg.combat_v3.upgrade.base_cost)*pow(float(current),float(reg.combat_v3.upgrade.cost_power))))+" Ryo",func():roster("Đã nâng trận pháp" if store.upgrade_formation(reg,active) else "Không đủ Ryo hoặc đang triển khai"))
	up.disabled=current>=int(reg.combat_v3.upgrade.max_level) or not store.state.travel.is_empty()
	var rule=reg.formations[active]
	var stats={"attack":"Công kích","defense":"Phòng thủ","move":"Tốc độ","chakra":"Hồi chakra"}
	var link_names={"adjacent":"ô kề","rank":"cùng hàng","lane":"cùng cột","diagonal":"chéo"}
	label(root,"%s +%.1f%% • Liên kết %s: +2,5%% thủ/đồng đội gần (tối đa 2) • %s" % [stats[rule.stat],100.0*(float(rule.base)+float(reg.combat_v3.upgrade.level_growth)*(current-1)),link_names[rule.link],message],16)
	var slots=GridContainer.new()
	slots.columns=3
	root.add_child(slots)
	for i in range(9):
		var id=""
		for ninja in store.state.formation_slots:
			if int(store.state.formation_slots[ninja])==i:id=str(ninja);break
		var b=button(slots,("▶ " if selected_slot==i else "")+str(i+1)+" • "+(reg.ninjas[id].name_vi if id!="" else "Ô trống"),func():selected_slot=i;roster())
		b.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		b.custom_minimum_size.y=44
	var controls=HBoxContainer.new()
	root.add_child(controls)
	button(controls,"Bỏ ninja khỏi ô",func():roster("Đã bỏ" if store.set_formation_slot(selected_slot,"") else "Ô trống hoặc đang triển khai"))
	var rows=scroll_rows(root)
	for id in store.state.owned:
		var p=store.state.owned[id]
		var b=button(rows,"%s | Cấp %d | Phẩm %d%s" % [reg.ninjas[id].name_vi,int(p.level),int(p.quality)," | Đang trong đội" if id in store.state.team else ""],func():
			roster("Đã bố trận" if store.set_formation_slot(selected_slot,id) else "Đã đủ 6 ninja hoặc ninja đang triển khai ở đội khác"))
		b.disabled=not store.state.travel.is_empty()

func growth_screen() -> void:
	open_screen("ninja_roster")
	label(root,"DANH SÁCH NINJA • "+str(store.state.owned.size())+"/144",26)
	var filters=HBoxContainer.new()
	root.add_child(filters)
	var search=LineEdit.new()
	search.placeholder_text="Tìm ninja"
	search.text=roster_query
	search.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	filters.add_child(search)
	var qualities=OptionButton.new()
	qualities.add_item("Mọi phẩm chất",0)
	for i in range(1,9):qualities.add_item("Phẩm "+str(i),i)
	qualities.select(roster_quality)
	filters.add_child(qualities)
	var elements=OptionButton.new()
	elements.add_item("Mọi hệ")
	for e in ["neutral","fire","water","earth","wind","lightning","wood","ice","poison"]:elements.add_item(e)
	filters.add_child(elements)
	var eras=OptionButton.new()
	eras.add_item("Mọi thời kỳ")
	var era_values=[]
	for n in reg.ninjas.values():
		if not n.era in era_values:era_values.append(n.era);eras.add_item(n.era)
	filters.add_child(eras)
	var jobs=OptionButton.new()
	jobs.add_item("Mọi nghề")
	for p in reg.professions.values():jobs.add_item(p.name_vi)
	filters.add_child(jobs)
	for pair in [[elements,roster_element],[eras,roster_era],[jobs,roster_job]]:
		for i in range(pair[0].item_count):
			if pair[0].get_item_text(i)==pair[1]:pair[0].select(i)
	button(filters,"Lọc",func():
		roster_query=search.text
		roster_quality=qualities.selected
		roster_element="" if elements.selected==0 else elements.get_item_text(elements.selected)
		roster_era="" if eras.selected==0 else eras.get_item_text(eras.selected)
		roster_job="" if jobs.selected==0 else jobs.get_item_text(jobs.selected)
		growth_screen())
	var rows=scroll_rows(root)
	var grid=GridContainer.new()
	grid.columns=3
	rows.add_child(grid)
	for id in store.state.owned:
		var n=reg.ninjas[id]
		var p=store.state.owned[id]
		if not roster_query.is_empty() and not n.name_vi.to_lower().contains(roster_query.to_lower()):continue
		if roster_quality>0 and int(p.quality)!=roster_quality:continue
		if roster_element!="" and not roster_element in n.chakra_elements:continue
		if roster_era!="" and n.era!=roster_era:continue
		if roster_job!="" and n.profession_hint!=roster_job:continue
		var b=button(grid,"%s\nCấp %d • Phẩm %d • %d sao" % [n.name_vi,int(p.level),int(p.quality),int(p.stars)],func():growth_detail(id))
		b.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		b.custom_minimum_size.y=84
		b.modulate=quality_color(int(p.quality))
		var portrait=art.texture("portraits/"+id+".png")
		if portrait!=null:
			b.icon=portrait
			b.expand_icon=true
			b.add_theme_constant_override("icon_max_width",64)
	if grid.get_child_count()==0:label(rows,"Không có ninja phù hợp.",18)

const WorldQuotes=preload("res://game/progression_quotes.gd")
const ResourceGuide=preload("res://game/resource_guide.gd")

func growth_detail(id: String,message: String="") -> void:
	open_screen("ninja_detail")
	var p=store.state.owned[id]
	store.ensure_growth(p)
	var info=product_art_header(root,"portraits/"+id+".png",str(reg.ninjas[id].name_vi),"Cấp %d/%d • Cảnh %d • Phẩm %d • Sao %d/15 • Mảnh %d • Điểm %d • XP %d" % [int(p.level),(int(p.realm)+1)*20,int(p.realm),int(p.quality),int(p.stars),int(p.shards),int(p.points),int(p.xp)],88)
	if message!="":label(info,message,16)
	var nav=HBoxContainer.new()
	root.add_child(nav)
	button(nav,"Tu luyện EXP",func():training_screen(id))
	var realm_quote=store.breakthrough_quote(id)
	var realm_cost=int(realm_quote.cost)
	var breakthrough_button=button(nav,"Đột phá • %d/%d ấn" % [int(realm_quote.stock),realm_cost],func():growth_detail(id,store.breakthrough(id)))
	breakthrough_button.disabled=not realm_quote.ready
	breakthrough_button.tooltip_text="Còn thiếu "+str(realm_quote.missing)+" ấn • XP tích lũy "+str(realm_quote.banked_xp)
	var star_button=button(nav,"Tăng sao",func():growth_detail(id,"Đã tăng sao" if store.raise_star(reg,id) else "Thiếu điều kiện"))
	var star_quote=store.star_quote(reg,id)
	star_button.disabled=not star_quote.ready
	star_button.tooltip_text=str(star_quote.reason)
	button(nav,"Nhẫn thuật",func():skill_screen(id))
	button(nav,"Thức tỉnh",func():awakening_screen(id))
	button(nav,"Trang bị ninja",func():ninja_gear_screen(id))
	button(nav,"Trở về",growth_screen)
	var rows=scroll_rows(root)
	label(rows,"Thiên phú: "+str(p.get("talent",""))+" • "+str(reg.ninjas[id].fixed_talent),17)
	label(rows,"XP lên cấp: %d/%d | Đột phá: %d %s • %.0f%% • bảo hiểm %d/5" % [int(p.xp),WorldQuotes.xp_need(int(p.level),int(p.realm)),realm_cost,reg.resources["RES-128"].name_vi,100*WorldQuotes.realm_chance(int(p.realm_failures)),int(p.realm_failures)],16)
	if int(p.stars)<15:
		var star_rule=reg.growth.stars[int(p.stars)-1]
		label(rows,"Sao kế tiếp: %d/%d mảnh • %s" % [int(p.shards),int(star_rule.shards),cost_text(star_rule.resources)],16)
	var exchange=button(rows,"DEV đổi 5 mảnh ninja • 10 mảnh sao + 1000 Ryo",func():growth_detail(id,"Đã đổi" if store.exchange_shards(id,5) else "Cần Tổng bộ 5, Điện thức tỉnh và nguyên liệu"))
	exchange.disabled=Village.level(store.state,"BLD-001")<5 or Village.level(store.state,"BLD-009")==0 or not store.has_cost(store.shard_exchange_cost(5))
	var grid=GridContainer.new()
	grid.columns=3
	rows.add_child(grid)
	var stats={"strength":"Sức mạnh","vitality":"Thể chất","spirit":"Tinh thần","agility":"Nhanh nhẹn","intellect":"Trí tuệ","potential":"Tiềm năng"}
	for key in stats:
		var b=button(grid,"%s +1 | Đã cộng %s" % [stats[key],p.allocated.get(key,0)],func():growth_detail(id,"Đã phân bổ" if store.allocate(id,key) else "Không còn điểm"))
		b.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		b.disabled=int(p.points)<1
		var bulk=button(grid,"%s +10" % stats[key],func():growth_detail(id,"Đã phân bổ" if store.allocate(id,key,10) else "Thiếu điểm"))
		bulk.disabled=int(p.points)<10
	var progress=store.state.owned[id]
	var natural=bool(store.state.get("settings",{}).get("depth_v5_dev",true))
	var stat_snapshot=CombatStats.player(reg,reg.ninjas[id],progress,store.state.gear_instances,store.state.get("beasts",{}),natural)
	var all_stats=stat_snapshot.stats
	var breakdown_n=reg.ninjas[id].duplicate(true)
	if natural:
		var star_multiplier=1.0+0.04*(int(progress.get("stars",1))-1)
		for key in breakdown_n.base_stats:
			breakdown_n.base_stats[key]=float(breakdown_n.base_stats[key])*star_multiplier
			breakdown_n.level_growth[key]=float(breakdown_n.level_growth[key])*star_multiplier
	label(rows,"78 CHỈ SỐ • snapshot ngoài trận trước biến thân / hiệu ứng trận",20)
	label(rows,"XP còn thiếu tới trần cảnh: "+str(store.xp_to_cap(id)),16)
	button(rows,"Nguồn ấn đột phá",func():resource_detail("RES-128"))
	var stat_grid=GridContainer.new()
	stat_grid.columns=4
	rows.add_child(stat_grid)
	for key in all_stats:
		var name_value=stat_title(key)
		var val=float(all_stats[key])
		var l=label(stat_grid,"%s: %s" % [name_value,Stats.display_value(reg,key,val)],16)
		l.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		var tooltip_sources=Stats.breakdown(reg,breakdown_n,progress,stat_snapshot.gear,key)
		if natural and int(progress.get("stars",1))>1:tooltip_sources.modifiers.append("Sao tự nhiên đã áp dụng cho nền/tăng trưởng: ×%.2f" % stat_snapshot.natural_star_multiplier)
		if not natural and key in ["hp","patk","natk"]:tooltip_sources.modifiers.append("Sao trong trận: ×%.2f" % stat_snapshot.natural_star_multiplier)
		l.tooltip_text=Stats.tooltip(reg,key,val,tooltip_sources)

func next_story_stage() -> String:
	for number in range(1,121):
		var id="STG-%03d"%number
		if not reg.stages.has(id) or store.state.cleared.has(id):continue
		var stage=reg.stages[id]
		if stage.requires==null or store.state.cleared.has(str(stage.requires)):return id
	return ""

func campaign() -> void:
	open_screen("campaign")
	label(root,"CỐT TRUYỆN • "+str(store.state.cleared.size())+"/120 ải",26)
	var row=HBoxContainer.new()
	root.add_child(row)
	var chapter_select=OptionButton.new()
	for id in reg.chapters:chapter_select.add_item(id+" • "+reg.chapters[id].name_vi)
	row.add_child(chapter_select)
	var suggested=next_story_stage()
	var selected=selected_stage if suggested.is_empty() else suggested
	var chapter_index=maxi(0,floori(float(selected.right(3).to_int()-1)/5.0))
	chapter_select.select(mini(23,chapter_index))
	var rows=VBoxContainer.new()
	root.add_child(rows)
	rows.size_flags_vertical=Control.SIZE_EXPAND_FILL
	var populate=func(index: int):
		for child in rows.get_children():
			rows.remove_child(child)
			child.queue_free()
		var key="CH-%03d" % (index+1)
		for id in reg.chapters[key].stage_ids:
			var s=reg.stages[id]
			var locked=s.requires!=null and not store.state.cleared.has(str(s.requires))
			var line=HBoxContainer.new()
			rows.add_child(line)
			var enemy_lv=0
			for npc_id in s.enemy_ids:enemy_lv=maxi(enemy_lv,int(reg.npcs[npc_id].level))
			var l=label(line,("%s  %s • địch cấp %d • %d thể lực" % [id,s.name_vi,enemy_lv,int(s.stamina_cost)])+(" • Đã vượt" if store.state.cleared.has(id) else ""),18)
			l.size_flags_horizontal=Control.SIZE_EXPAND_FILL
			var b=button(line,"Chưa mở" if locked else "Vào "+id,func():start_battle(s))
			b.disabled=locked or int(store.state.stamina)<int(s.stamina_cost) or store.state.team.is_empty()
			if s.boss_id!=null:label(line,"BOSS",16)
			var reason="Cần vượt "+str(s.requires) if locked else "Thiếu thể lực" if int(store.state.stamina)<int(s.stamina_cost) else "Cần bố trận ninja" if store.state.team.is_empty() else "Sẵn sàng"
			b.tooltip_text=reason+" • Thưởng: "+cost_text(s.repeat_rewards if store.state.cleared.has(id) else s.first_clear_rewards)
		label(rows,"Thắng ải để mở ải kế tiếp. Tuyệt kỹ do người chơi điều khiển.",17)
	chapter_select.item_selected.connect(populate)
	populate.call(chapter_select.selected)

func start_battle(stage: Dictionary) -> void:
	var id=store.begin_stage(stage)
	if id.is_empty():
		menu("Thiếu thể lực, đội hình hoặc điều kiện mở ải")
		return
	review_mode=false
	selected_stage=stage.id
	battle_stage=stage
	event_id=id
	last_reward=(stage.repeat_rewards if store.state.cleared.has(stage.id) else stage.first_clear_rewards).duplicate(true)
	last_growth={}
	for ninja in store.state.team:last_growth[ninja]=store.state.owned[ninja].permanent.duplicate(true)
	sim=Combat.new()
	sim.setup(reg,store.state,stage,int(store.state.battle_seq))
	battle_view()

func battle_view() -> void:
	art.reset_battle()
	accumulator=0
	paused=false
	observation_mode=false
	battle_details=false
	battle_grid=false
	battle_action_groups.clear()
	battle_speed_buttons.clear()
	inspected_uid=0
	hud_clock=1.0
	form_actions.clear()
	last_video_ult_tick=-1
	battle_speed=1.0
	battle_frame={"zoom":1.0,"shift":Vector2.ZERO}
	open_screen("battle")
	var toolbar_frame=PanelContainer.new()
	toolbar_frame.add_theme_stylebox_override("panel",combat_panel(Color("#0b2427"),Color("#69877c"),5))
	root.add_child(toolbar_frame)
	var toolbar=HBoxContainer.new()
	toolbar.add_theme_constant_override("separation",5)
	toolbar_frame.add_child(toolbar)
	status=label(toolbar,"CHIẾN ĐẤU • "+str(battle_stage.name_vi),16)
	status.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	status.add_theme_color_override("font_color",Color("#f4d39a"))
	battle_team_status=label(toolbar,"6 VS 6",14)
	battle_team_status.custom_minimum_size.x=105
	var pause_button=combat_button(toolbar,"Tạm dừng",func():pass,88)
	pause_button.pressed.connect(func():paused=not paused;pause_button.text="Tiếp tục" if paused else "Tạm dừng")
	for speed in [1.0,2.0,4.0]:
		var b=combat_button(toolbar,str(int(speed))+"x",func():battle_speed=speed;refresh_battle_toggles(),38)
		battle_speed_buttons[speed]=b
	battle_observe_button=combat_button(toolbar,"Quan sát",func():observation_mode=not observation_mode;scroll_battle_visibility(),82)
	battle_detail_button=combat_button(toolbar,"Chi tiết",func():battle_details=not battle_details;scroll_battle_visibility(),72)
	battle_grid_button=combat_button(toolbar,"Lưới",func():battle_grid=not battle_grid;refresh_battle_toggles();field.queue_redraw(),48)
	combat_button(toolbar,"Rút lui",func():finish(false),72).add_theme_color_override("font_color",Color("#ffaca0"))
	var body=HBoxContainer.new()
	body.size_flags_vertical=Control.SIZE_EXPAND_FILL
	body.add_theme_constant_override("separation",6)
	root.add_child(body)
	var left=VBoxContainer.new()
	left.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	left.add_theme_constant_override("separation",5)
	body.add_child(left)
	field=Control.new()
	field.custom_minimum_size=Vector2(280,240)
	field.size_flags_vertical=Control.SIZE_EXPAND_FILL
	field.clip_contents=true
	field.texture_filter=CanvasItem.TEXTURE_FILTER_NEAREST
	field.draw.connect(draw_field)
	field.gui_input.connect(inspect_battle_input)
	left.add_child(field)
	battle_actions_panel=ScrollContainer.new()
	battle_actions_panel.name="BattleActions"
	battle_actions_panel.custom_minimum_size.y=90
	battle_actions_panel.horizontal_scroll_mode=ScrollContainer.SCROLL_MODE_AUTO
	battle_actions_panel.vertical_scroll_mode=ScrollContainer.SCROLL_MODE_DISABLED
	left.add_child(battle_actions_panel)
	var row=HBoxContainer.new()
	row.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	row.add_theme_constant_override("separation",5)
	battle_actions_panel.add_child(row)
	battle_mini=HBoxContainer.new()
	battle_mini.alignment=BoxContainer.ALIGNMENT_CENTER
	battle_mini.custom_minimum_size.y=40
	left.add_child(battle_mini)
	battle_dock=PanelContainer.new()
	battle_dock.name="BattleDetailDock"
	battle_dock.custom_minimum_size.x=300
	battle_dock.add_theme_stylebox_override("panel",combat_panel(Color("#0d2427"),Color("#789286"),6))
	body.add_child(battle_dock)
	var dock_scroll=ScrollContainer.new()
	dock_scroll.horizontal_scroll_mode=ScrollContainer.SCROLL_MODE_DISABLED
	dock_scroll.size_flags_vertical=Control.SIZE_EXPAND_FILL
	battle_dock.add_child(dock_scroll)
	battle_dock_content=VBoxContainer.new()
	battle_dock_content.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	battle_dock_content.add_theme_constant_override("separation",8)
	dock_scroll.add_child(battle_dock_content)
	var dock_title=HBoxContainer.new()
	battle_dock_content.add_child(dock_title)
	var title=label(dock_title,"CHI TIẾT NINJA",16)
	title.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	title.add_theme_color_override("font_color",Color("#f5d39a"))
	combat_button(dock_title,"Thu gọn",func():battle_details=false;scroll_battle_visibility(),68)
	battle_selected_portrait=TextureRect.new()
	battle_selected_portrait.custom_minimum_size=Vector2(0,88)
	battle_selected_portrait.expand_mode=TextureRect.EXPAND_IGNORE_SIZE
	battle_selected_portrait.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	battle_dock_content.add_child(battle_selected_portrait)
	battle_inspector=combat_wrap(battle_dock_content,"Chạm ninja để xem chi tiết",15)
	label(battle_dock_content,"KỸ NĂNG",15).add_theme_color_override("font_color",Color("#e9c477"))
	battle_skill_info=combat_wrap(battle_dock_content,"",13)
	label(battle_dock_content,"TRẠNG THÁI",15).add_theme_color_override("font_color",Color("#e9c477"))
	battle_state_info=combat_wrap(battle_dock_content,"",13)
	ult_buttons.clear()
	ult_actions.clear()
	battle_cards.clear()
	for a in sim.primary_alive(0):
		var actor_index=sim.actors.find(a)
		var uid=int(a.uid)
		var card=PanelContainer.new()
		card.custom_minimum_size.x=150
		card.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		card.add_theme_stylebox_override("panel",combat_panel(Color("#102b2d"),Color("#59796f"),5))
		row.add_child(card)
		var group=VBoxContainer.new()
		group.add_theme_constant_override("separation",2)
		card.add_child(group)
		var top=HBoxContainer.new()
		top.add_theme_constant_override("separation",4)
		group.add_child(top)
		var portrait=art.texture("portraits/"+str(a.id)+".png")
		var mini=combat_button(battle_mini,str(a.id).right(3),func():select_battle_actor(uid),40)
		mini.custom_minimum_size=Vector2(40,40)
		if portrait!=null:
			mini.icon=portrait
			mini.expand_icon=true
			mini.text=""
			var image=TextureRect.new()
			image.texture=portrait
			image.custom_minimum_size=Vector2(52,46)
			image.expand_mode=TextureRect.EXPAND_IGNORE_SIZE
			image.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED
			image.texture_filter=CanvasItem.TEXTURE_FILTER_LINEAR
			top.add_child(image)
			art.portrait_draws+=1
		var text_col=VBoxContainer.new()
		text_col.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		text_col.add_theme_constant_override("separation",2)
		top.add_child(text_col)
		var short_name=str(reg.ninjas[a.id].name_vi).split(" (")[0]
		mini.tooltip_text=short_name
		var inspect=Button.new()
		inspect.text=short_name
		inspect.flat=true
		inspect.alignment=HORIZONTAL_ALIGNMENT_LEFT
		inspect.text_overrun_behavior=TextServer.OVERRUN_TRIM_ELLIPSIS
		inspect.tooltip_text=short_name
		inspect.custom_minimum_size=Vector2(0,18)
		inspect.add_theme_font_size_override("font_size",13)
		inspect.pressed.connect(func():select_battle_actor(uid))
		text_col.add_child(inspect)
		var hp=combat_meter(text_col,Color("#87c95c"))
		var cp=combat_meter(text_col,Color("#56b8e4"))
		var state_label=label(text_col,"",10)
		battle_cards.append({"uid":uid,"label":state_label,"hp":hp,"cp":cp,"panel":card,"mini":mini})
		var extra=VBoxContainer.new()
		battle_dock_content.add_child(extra)
		battle_action_groups[uid]=extra
		extra.visible=false
		var first=true
		for skill_id in a.skills:
			if not reg.depth_ultimates.has(skill_id) and reg.skills[skill_id].kind!="ultimate":continue
			var b=combat_button(group if first else extra,str(reg.names[skill_id].name_vi),func():sim.ultimate_skill(actor_index,skill_id),0)
			b.custom_minimum_size=Vector2(0,30)
			b.add_theme_stylebox_override("normal",combat_panel(Color("#3b3022"),Color("#b18b4c"),6))
			b.add_theme_stylebox_override("hover",combat_panel(Color("#594329"),Color("#ffd38a"),6))
			ult_actions.append({"button":b,"index":actor_index,"skill":skill_id})
			first=false
		if a.contract!="":combat_button(extra,"Thông linh",func():sim.summon_contract(a),0)
		for form_id in a.forms:
			if reg.form_rules[form_id].activation!="skill_trigger" or reg.p2_forms.get(form_id,{}).get("activation",{}).get("mode","") in ["manual_stance","hp_threshold_or_manual"]:
				var fb=combat_button(extra,"Biến thân "+str(form_id).right(2),func():sim.activate_form(a,form_id,true),0)
				form_actions.append({"button":fb,"uid":uid,"form":form_id})
	label(battle_dock_content,"NHẬT KÝ CHIẾN ĐẤU",15).add_theme_color_override("font_color",Color("#e9c477"))
	log_label=combat_wrap(battle_dock_content,"",12)
	if not battle_cards.is_empty():inspected_uid=int(battle_cards[0].uid)
	scroll_battle_visibility()

func combat_panel(bg:Color,edge:Color,rounding:int=5) -> StyleBoxFlat:
	var s=StyleBoxFlat.new()
	s.bg_color=bg
	s.border_color=edge
	s.set_border_width_all(1)
	s.shadow_color=Color(0.03,0.04,0.06,0.3)
	s.shadow_size=2
	s.set_corner_radius_all(rounding)
	s.content_margin_left=5
	s.content_margin_right=5
	s.content_margin_top=4
	s.content_margin_bottom=4
	return s

func combat_button(parent:Node,caption:String,action:Callable,w:float) -> Button:
	var b=button(parent,caption,action)
	b.custom_minimum_size=Vector2(w,32)
	b.add_theme_font_size_override("font_size",13)
	b.add_theme_stylebox_override("normal",combat_panel(Color("#242c37"),Color("#56616b")))
	b.add_theme_stylebox_override("hover",combat_panel(Color("#3a3c43"),Color("#e7bf76")))
	b.add_theme_stylebox_override("pressed",combat_panel(Color("#685031"),Color("#e7bf76")))
	return b

func combat_meter(parent:Node,col:Color) -> ProgressBar:
	var bar=ProgressBar.new()
	bar.max_value=100
	bar.show_percentage=false
	bar.custom_minimum_size.y=6
	bar.add_theme_stylebox_override("background",combat_panel(Color("#08171a"),Color("#405650"),2))
	var fill=StyleBoxFlat.new()
	fill.bg_color=col
	fill.set_corner_radius_all(2)
	bar.add_theme_stylebox_override("fill",fill)
	parent.add_child(bar)
	return bar

func combat_wrap(parent:Node,caption:String,font_size:int) -> Label:
	var l=label(parent,caption,font_size)
	l.text_overrun_behavior=TextServer.OVERRUN_NO_TRIMMING
	l.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	return l

func refresh_battle_toggles() -> void:
	for speed in battle_speed_buttons:
		battle_speed_buttons[speed].self_modulate=Color("#f4cc82") if float(speed)==battle_speed else Color.WHITE
	if is_instance_valid(battle_observe_button):battle_observe_button.self_modulate=Color("#f4cc82") if observation_mode else Color.WHITE
	if is_instance_valid(battle_detail_button):battle_detail_button.self_modulate=Color("#f4cc82") if battle_details and not observation_mode else Color.WHITE
	if is_instance_valid(battle_grid_button):battle_grid_button.self_modulate=Color("#f4cc82") if battle_grid else Color.WHITE

func arena_scale() -> float:
	return minf(1.25,BattleCamera.sprite_scale(field.size,Vector2(sim.map_width,sim.map_height))*float(battle_frame.get("zoom",1.0))*1.08)

func iso(p: Vector2) -> Vector2:
	return BattleCamera.project_framed(p,field.size,Vector2(sim.map_width,sim.map_height),battle_frame)

func draw_field() -> void:
	if sim==null:return
	var active_points:Array[Vector2]=[]
	for a in sim.actors:
		if a.hp>0 and not a.get("summon",false):active_points.append(Vector2(a.pos))
	var desired=BattleCamera.framing(field.size,Vector2(sim.map_width,sim.map_height),active_points)
	# Camera smoothing only; no sprite tween or rig.
	battle_frame.zoom=lerpf(float(battle_frame.zoom),float(desired.zoom),0.08)
	battle_frame.shift=Vector2(battle_frame.shift).lerp(Vector2(desired.shift),0.08)
	var plate=art.background(field,sim.environment)
	var q=arena_scale()
	var edges=PackedVector2Array([iso(Vector2.ZERO),iso(Vector2(sim.map_width,0)),iso(Vector2(sim.map_width,sim.map_height)),iso(Vector2(0,sim.map_height))])
	if not plate:
		field.draw_colored_polygon(edges,Color("#344b43"))
		# Soft lane shading, no checkerboard.
		for y in range(sim.map_height):
			var lane=PackedVector2Array([iso(Vector2(0,y)),iso(Vector2(sim.map_width,y)),iso(Vector2(sim.map_width,y+1)),iso(Vector2(0,y+1))])
			if y%2==0:field.draw_colored_polygon(lane,Color(0.8,0.9,0.7,0.025))
	if battle_grid:
		for x in range(sim.map_width+1):field.draw_line(iso(Vector2(x,0)),iso(Vector2(x,sim.map_height)),Color(0.65,0.8,0.7,0.18),1,true)
		for y in range(sim.map_height+1):field.draw_line(iso(Vector2(0,y)),iso(Vector2(sim.map_width,y)),Color(0.65,0.8,0.7,0.18),1,true)
	for job in sim.p2_jobs:
		if job.dynamic:
			var radius=float(job.skill.radius_m)
			var outline=PackedVector2Array()
			for i in range(33):outline.append(iso(Vector2(job.point)+Vector2.RIGHT.rotated(i*TAU/32.0)*radius))
			field.draw_polyline(outline,Color(0.92,0.65,0.27,0.75),2,true)
	for item in sim.terrain:
		var rect: Rect2=item.rect
		var points=PackedVector2Array([iso(rect.position),iso(Vector2(rect.end.x,rect.position.y)),iso(rect.end),iso(Vector2(rect.position.x,rect.end.y))])
		if item.kind=="obstacle":
			var prop=art.texture("environment/props/stone.png") if not item.has("owner") else null
			if prop!=null:
				var foot=iso(Vector2(rect.get_center().x,rect.end.y))
				var extent=maxf(24.0,absf(points[1].x-points[0].x))
				var height_value=extent*float(prop.get_height())/maxf(1.0,float(prop.get_width()))
				field.draw_texture_rect(prop,Rect2(foot-Vector2(extent*0.5,height_value),Vector2(extent,height_value)),false)
			else:field.draw_colored_polygon(points,Color(0.30,0.37,0.35,0.55))
		else:field.draw_colored_polygon(points,Color(0.65,0.52,0.27,0.15))
		if battle_grid:field.draw_polyline(PackedVector2Array([points[0],points[1],points[2],points[3],points[0]]),Color("#a7b8b7"),1.5,true)
	for pair in sim.formation_pairs(0) if battle_grid else []:
		field.draw_line(iso(pair[0]),iso(pair[1]),Color(0.4,0.85,1.0,0.35),1.5,true)
	for a in sim.primary_alive(0):
		if battle_grid and sim.link_count(a)>0:field.draw_arc(iso(a.pos),14*q,0,TAU,24,Color(0.4,0.85,1.0,0.7),2)
	var render_order=sim.actors.duplicate()
	render_order.sort_custom(func(a,b):return iso(a.pos).y<iso(b.pos).y)
	for a in render_order:
		if a.hp<=0 and sim.ticks-int(a.get("fall_started",a.get("hit_until",0)))>24:continue
		var p=iso(a.pos)
		var c=Color("#e3a33e") if a.side==0 else Color("#b65364")
		field.draw_set_transform(p,0,Vector2(1,0.48))
		var radius=clampf(19*q,10,22)
		field.draw_circle(Vector2.ZERO,radius,Color(0.02,0.04,0.05,0.55))
		field.draw_arc(Vector2.ZERO,radius+1,0,TAU,24,c,1.4)
		if a.uid==inspected_uid:field.draw_arc(Vector2.ZERO,radius+5,0,TAU,24,Color("#e9f5ff"),2)
		field.draw_set_transform(Vector2.ZERO)
		var depth_scale=lerpf(0.88,1.05,clampf(float(a.pos.y)/maxf(1.0,float(sim.map_height)),0,1))
		var visual_scale=q*depth_scale*(0.76 if a.get("summon",false) else 1.0)
		# Stable scale: no frame-by-frame shrinking when actors pass each other.
		var presentation_state=sim.animation_state(a)
		var face=Vector2(a.get("facing",Vector2.RIGHT if a.side==0 else Vector2.LEFT))
		# V3: four move directions, two authored combat-facing directions. Simulation facing is unchanged.
		presentation_state.direction=BattleCamera.sprite_direction(face,int(a.side),str(presentation_state.get("action","Idle")))
		presentation_state.render_id=art.presentation_id(a,sim.actor_by_uid(int(a.get("owner",0))))
		var sprite_top=art.draw_actor(field,a,p,sim.ticks,visual_scale,presentation_state)
		var missing_sprite=sprite_top<=0
		if missing_sprite:
			# Original generic geometric DEV actor, not an approved ninja sprite.
			field.draw_set_transform(p,0,Vector2.ONE*visual_scale)
			field.draw_colored_polygon(PackedVector2Array([Vector2(-12,-3),Vector2(-11,-28),Vector2(11,-28),Vector2(12,-3)]),c.darkened(0.3))
			field.draw_rect(Rect2(-Vector2(7,10),Vector2(5,10)),Color("#15242e"))
			field.draw_rect(Rect2(-Vector2(-2,10),Vector2(5,10)),Color("#15242e"))
			field.draw_circle(-Vector2(0,34),11,Color("#ddbc9a"))
			field.draw_rect(Rect2(-Vector2(12,46),Vector2(24,8)),Color("#26333c"))
			field.draw_rect(Rect2(-Vector2(5,42),Vector2(10,4)),c)
			field.draw_set_transform(Vector2.ZERO)
			sprite_top=48*visual_scale
		if a.hp<=0 or (a.get("summon",false) and a.uid!=inspected_uid and not battle_details):continue
		var bar_width=clampf(62*visual_scale,30,66)
		var bar=p-Vector2(bar_width*0.5,sprite_top+8)
		field.draw_rect(Rect2(bar-Vector2.ONE,Vector2(bar_width+2,7)),Color("#0b1719"))
		field.draw_line(bar+Vector2(0,-1),bar+Vector2(bar_width,-1),Color(1,1,1,0.22),1)
		field.draw_rect(Rect2(bar,Vector2(bar_width*clampf(float(a.hp)/maxf(1.0,float(a.max_hp)),0,1),5)),Color("#8bd663") if a.side==0 else Color("#f18070"))
		if a.side==0 or battle_details or a.uid==inspected_uid:
			field.draw_rect(Rect2(bar+Vector2(0,6),Vector2(bar_width,3)),Color("#182028"))
			field.draw_rect(Rect2(bar+Vector2(0,6),Vector2(bar_width*float(a.chakra)/maxf(1.0,float(a.max_chakra)),3)),Color("#76bce8"))
		var badge_index=0
		for st in a.statuses.values() if battle_details or a.uid==inspected_uid else []:
			if badge_index>=4:break
			var negative=st.id in ["stun","bind","silence","slow","blind","burn","poison","wet","freeze","shock","mark","chakra_lock","taunt","antiheal","fear","mud","steam","sleep","attack_down","beguile_tactical"]
			field.draw_circle(bar+Vector2(4+8*badge_index,-5),3.5,Color("#ed827b") if negative else Color("#82d5a4"))
			badge_index+=1
		if not a.active_form.is_empty():field.draw_arc(p,22,0,TAU,24,Color("#e1ce72"),2)
		for mod in a.get("passive_mods",{}) if battle_details or a.uid==inspected_uid else {}:
			var v=float(a.passive_mods[mod])
			if absf(v)<0.00001 or badge_index>=6:continue
			field.draw_circle(bar+Vector2(4+8*badge_index,-5),3,Color("#82d5a4") if v>0 else Color("#ed827b"))
			badge_index+=1
		if missing_sprite:
			var missing_name=str(reg.ninjas.get(a.id,{}).get("name_vi",a.id))
			field.draw_string_outline(ThemeDB.fallback_font,p+Vector2(-38,14),missing_name,HORIZONTAL_ALIGNMENT_LEFT,-1,11,3,Color("#161b23"))
			field.draw_string(ThemeDB.fallback_font,p+Vector2(-38,14),missing_name,HORIZONTAL_ALIGNMENT_LEFT,-1,11,Color("#f1d398"))
	for projectile in sim.projectiles if bool(store.state.get("settings",{}).get("projectiles",true)) else []:
		var source=sim.actor_by_uid(int(projectile.source))
		var target=sim.actor_by_uid(int(projectile.target))
		if not source.is_empty() and not target.is_empty():
			var total=maxf(0.01,source.pos.distance_to(target.pos)/maxf(0.01,float(projectile.skill.projectile_speed_m_s)))
			var progress=clampf(1-float(projectile.remaining)/total,0,1)
			var at=Vector2(projectile.get("pos",source.pos.lerp(target.pos,progress)))
			var point=iso(at)-Vector2(0,24)
			if not art.sheet(field,"vfx/VFX-"+str(projectile.skill.skill_id)+"/travel.png",point,progress,70):
				field.draw_circle(point,5,Color("#ffcf84"))
	if bool(store.state.get("settings",{}).get("cutin",true)):art.effects(field,sim,iso)
	if battle_details:field.draw_string(ThemeDB.fallback_font,Vector2(12,19),art.source_label,HORIZONTAL_ALIGNMENT_LEFT,-1,13,Color("#c7d5d5"))

func _process(delta: float) -> void:
	if not reg.ninjas.is_empty() and not store.state.is_empty():
		clock_accumulator+=delta
		if clock_accumulator>=5.0:
			clock_accumulator=0.0
			store.advance_clock(reg,int(Time.get_unix_time_from_system()))
		update_resources()
	if web_qa:
		qa_clock+=delta
		if qa_clock>=0.25:
			qa_clock=0
			publish_ui_probe()
	if sim==null:return
	if "--private-capture" in OS.get_cmdline_user_args() and review_mode and sim.ticks>=120 and sim.ticks%120==0 and last_private_trace_tick!=sim.ticks:
		last_private_trace_tick=sim.ticks
		print("NARU_PRIVATE_TRACE tick=",sim.ticks," actors=",sim.primary_alive(0).size()+sim.primary_alive(1).size()," draws=",art.actor_draws," fallback=",art.fallback_draws," clone=",art.clone_draws," summon=",art.summon_draws," directional_pose=",art.directional_pose_draws)
	if "--combat-video" in OS.get_cmdline_user_args() and review_mode and sim.ticks>=60 and sim.ticks%40==0 and last_video_ult_tick!=sim.ticks:
		last_video_ult_tick=sim.ticks
		# Stagger actual manual requests so the sample does not queue every ultimate simultaneously.
		var index=posmod(floori(float(sim.ticks)/40.0),6)
		if index<sim.actors.size():sim.ultimate(index)
	if not paused:
		accumulator+=minf(delta,0.25)*battle_speed
		while accumulator>=0.05:
			sim.tick(0.05)
			accumulator-=0.05
			if not sim.outcome.is_empty():
				finish(sim.outcome=="win")
				return
	hud_clock+=delta
	field.queue_redraw()
	if hud_clock<0.12:return
	hud_clock=0.0
	status.text="CHIẾN ĐẤU • "+str(battle_stage.name_vi)+" • %.1fs" % (sim.ticks*0.05)
	battle_team_status.text="%d VS %d" % [sim.primary_alive(0).size(),sim.primary_alive(1).size()]
	if sim.deadlock:status.text+=" • Giằng co"
	elif sim.pressure_mode:status.text+=" • Đổi chiến thuật"
	if battle_details:status.tooltip_text=str(sim.side_formations.get(0,"FRM-01"))
	for card in battle_cards:
		var unit=sim.actor_by_uid(int(card.uid))
		if unit.is_empty():continue
		var marks=[]
		for st in unit.statuses.values():
			if not st.id in marks:marks.append(st.id)
		if not unit.active_form.is_empty():marks.append(unit.active_form.id)
		if unit.shield>0:marks.append("Khiên")
		card.hp.value=100.0*float(unit.hp)/maxf(1.0,float(unit.max_hp))
		card.cp.value=100.0*float(unit.chakra)/maxf(1.0,float(unit.max_chakra))
		card.label.text="HP %d%% • CP %.0f" % [roundi(100.0*float(unit.hp)/maxf(1.0,float(unit.max_hp))),float(unit.chakra)]
		card.label.tooltip_text=card.label.text+" • "+",".join(marks)
	for action in ult_actions:
		var a=sim.actors[action.index]
		var s=sim.effective_skill(a,action.skill)
		action.button.disabled=paused or a.hp<=0 or (not sim.use_depth and not sim.ready(a,s))
		var requested=sim.ultimate_requests.get(a.uid,"")==action.skill
		var reason=sim.ultimate_reason(a,action.skill)
		action.button.text=("Hủy • " if requested else "")+str(reg.names[action.skill].name_vi)+"\n"+("%.0f CP" % float(s.chakra))
		action.button.tooltip_text=str(reg.names[action.skill].name_vi)+" • "+reason
	for action in form_actions:
		var a=sim.actor_by_uid(int(action.uid))
		action.button.disabled=paused or not sim.form_ready(a,action.form,true)
		var cd=float(a.form_cooldowns.get(action.form,0))
		action.button.text="Biến thân "+str(action.form).right(2)+(" • %.1fs" % cd if cd>0 else "")
	update_battle_inspector()
	if battle_details and not observation_mode:log_label.text="\n".join(sim.log.slice(maxi(0,sim.log.size()-8)))

func finish(won: bool) -> void:
	if sim==null:return
	if review_mode:
		sim=null
		review_mode=false
		settings_screen("Kết thúc trận review mỹ thuật • không lưu thưởng")
		return
	var ok=store.finish_stage(reg,battle_stage,event_id,won,sim.counts,sim.mastery_counts,sim.action_stats,sim.passive_mastery)
	var elapsed=sim.ticks*0.05
	var contribution_rows=sim.contribution.duplicate(true)
	var outcome_reason="Địch bị hạ toàn bộ" if won else ("Đội bị hạ toàn bộ" if sim.outcome=="loss" else "Người chơi rút lui")
	var combos=sim.combo_receipts.duplicate()
	var forms=sim.form_receipts.duplicate()
	for a in sim.actors:
		if not a.summon and a.side==0 and not contribution_rows.has(a.uid):contribution_rows[a.uid]={"id":a.id,"side":a.side,"damage":0,"heal":0,"taken":0,"absorbed":0,"control_applied_s":0}
	sim=null
	open_screen("results")
	label(root,"CHIẾN THẮNG" if won else "THẤT BẠI / RÚT LUI",34)
	label(root,"%s • %.1f giây • %s" % [battle_stage.name_vi,elapsed,"Đã lưu kết quả" if ok else "Lỗi lưu kết quả"],18)
	var rows=scroll_rows(root)
	label(rows,outcome_reason+" • Combo: "+str(combos.size())+" • Hình thái: "+str(forms.size()),18)
	label(rows,"Đóng góp chiến đấu • HP thực tế / thời lượng khống chế áp dụng",20)
	for entry in contribution_rows.values():
		if int(entry.side)!=0:continue
		label(rows,"%s | ST %.0f • Hồi %.0f • Nhận %.0f • Chặn %.0f • CC %.1fs" % [reg.ninjas.get(entry.id,{}).get("name_vi",entry.id),entry.damage,entry.heal,entry.taken,entry.absorbed,entry.control_applied_s],16)
	if won and ok:
		label(rows,"Phần thưởng đã nhận",22)
		for reward in last_reward:label(rows,"%s +%d" % [reg.resources[reward.resource_id].name_vi,int(reward.qty)],18)
		if not store.state.reward_inbox.is_empty():label(rows,"Tài nguyên vượt sức chứa được giữ trong Kho → Thưởng chờ nhận.",16)
		label(rows,"Tăng trưởng ninja",22)
		for id in last_growth:
			var gains=[]
			for stat in store.state.owned[id].permanent:
				var delta=float(store.state.owned[id].permanent[stat])-float(last_growth[id].get(stat,0))
				if delta>0.00001:gains.append("%s +%.3f" % [stat_title(stat),delta])
			label(rows,str(reg.ninjas[id].name_vi)+" • "+(" · ".join(gains) if not gains.is_empty() else "Không tăng chỉ số vĩnh viễn"),17)
	var row=HBoxContainer.new()
	root.add_child(row)
	button(row,"Về làng",menu)
	button(row,"Cốt truyện",campaign)
	button(row,"Đánh lại",func():start_battle(battle_stage))
	var next_id="STG-%03d" % (int(battle_stage.id.right(3))+1)
	if won and ok and reg.stages.has(next_id):button(row,"Ải tiếp theo",func():start_battle(reg.stages[next_id]))

func skill_screen(id: String,message: String="") -> void:
	open_screen("skill_tree")
	label(root,"NHẪN THUẬT • "+str(reg.ninjas[id].name_vi),26)
	var skill_nav=HBoxContainer.new()
	root.add_child(skill_nav)
	button(skill_nav,"Trở về",func():growth_detail(id))
	button(skill_nav,"Nội tại P1–P6 (DEV)",func():passive_screen(id))
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
		var overlay=reg.p2_skills.get(skill_id,{})
		var shown=str(reg.p2_design[skill_id].name_vi) if not overlay.is_empty() else str(reg.names[skill_id].name_vi)
		var name_label=label(row,"%s | %s | Giai %d cấp %d | Thành thạo %d" % [shown,"P2 "+str(overlay.shape) if not overlay.is_empty() else "D4 fallback",int(sk.grade),int(sk.level),int(store.state.owned[id].skill_mastery.get(skill_id,0))],16)
		name_label.tooltip_text=shown+" • "+str(overlay.get("shape",reg.p2_fallback.get(skill_id,"D4")))
		name_label.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		if not store.skill_allowed(reg,id,skill_id):
			var trial_id=str(reg.names[skill_id].unlock_require.challenge_id)
			var trial_button=button(row,"Thử thách mở khóa",func():skill_screen(id,"Đã mở" if store.run_trial(reg,id,trial_id) else "Chưa thắng hoặc chưa đủ điều kiện"))
			trial_button.disabled=not store.trial_ready(reg,id,trial_id)
		elif reg.skill_policies.has(skill_id):
			var book=store.skill_book(reg,skill_id)
			var quote=WorldQuotes.skill_batch(int(sk.level),int(sk.grade),int(store.state.inventory.get(book,0)),20)
			var single=button(row,"+1 (%d)" % WorldQuotes.level_cost(int(sk.level),int(sk.grade)),func():skill_screen(id,"Đã tăng cấp" if store.upgrade_skill(reg,id,skill_id) else "Thiếu sách hoặc đủ cấp"))
			single.disabled=int(quote.count)==0
			single.tooltip_text=reg.resources[book].name_vi
			var bulk=button(row,"+%d (%d)" % [int(quote.count),int(quote.cost)],func():skill_screen(id,"Đã tăng cấp" if store.upgrade_skill(reg,id,skill_id,20) else "Thiếu sách"))
			bulk.disabled=int(quote.count)<2
			bulk.tooltip_text=reg.resources[book].name_vi
			var grade_cost=WorldQuotes.advance_cost(int(sk.grade))
			var grade=button(row,"Giai %d • %.0f%%" % [grade_cost,100*WorldQuotes.grade_chance(int(sk.grade),int(sk.fails))],func():skill_screen(id,{"success":"Thành công","failure":"Thất bại, tăng bảo hiểm","locked":"Chưa đủ điều kiện","error":"Lỗi lưu"}[store.advance_skill(reg,id,skill_id)]))
			grade.disabled=int(sk.level)<20 or int(store.state.inventory.get("RES-130",0))<grade_cost
			grade.tooltip_text=reg.resources["RES-130"].name_vi+" • bảo hiểm "+str(sk.fails)+"/4"
			for branch in reg.skill_policies[skill_id].branches:
				if int(sk.grade)>=int(branch.unlock_grade) and str(sk.branch).is_empty():
					button(row,str(branch.name_vi),func():skill_screen(id,"Đã chọn nhánh" if store.choose_skill_branch(reg,id,skill_id,branch.id) else "Không thể chọn"))

func gear_screen(message: String="") -> void:
	open_screen("inventory")
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
	open_screen("craft")
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
		var row=HBoxContainer.new()
		rows.add_child(row)
		var b=button(row,"%s | %s" % [def.name_vi,cost_text(def.craft.inputs)],func():gear_screen("Đã chế tạo" if not store.craft_gear(reg,id).is_empty() else "Chưa đủ nguyên liệu"))
		b.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		var material_cost={}
		for item in def.craft.inputs:material_cost[item.resource_id]=int(material_cost.get(item.resource_id,0))+int(item.qty)
		b.disabled=int(store.state.building_states.get(def.craft.building_id,{}).get("level",0))<=0 or not store.has_cost(material_cost)
		button(row,"Nguồn nguyên liệu",func():gear_material_screen(id))
		if int(def.quality)==1:
			var q=store.starter_gear_cost(reg,id)
			var early=button(row,"DEV nhập môn • 180 Ryo",func():gear_screen("Đã chế Q1 nhập môn" if not store.craft_gear(reg,id,true).is_empty() else "Chưa đủ điều kiện"))
			early.tooltip_text="HQ2, Học viện; "+("3 gỗ + 2 quặng sắt" if def.craft.building_id=="BLD-017" else "3 gỗ + 2 chakra")
			early.disabled=Village.level(store.state,"BLD-001")<2 or Village.level(store.state,"BLD-002")==0 or not store.has_cost(q)

func gear_detail(id: String,message: String="") -> void:
	open_screen("inventory")
	var g=store.state.gear_instances[id]
	var def=reg.gear_templates[g.template_id]
	label(root,"%s +%d" % [def.name_vi,int(g.enhance)],30)
	label(root,"Phẩm %d | Tinh luyện %d | Tiến hóa %d | Bảo hiểm %d/20" % [int(g.quality),int(g.refine),int(g.evolution),int(g.fails)],18)
	button(root,"Thuộc tính / bộ trang bị",func():affix_screen(id))
	label(root,message,18)
	var row=HBoxContainer.new()
	root.add_child(row)
	var quote=WorldQuotes.enhancement_cost(int(g.enhance))
	label(root,"Cường hóa: %d Ryo + %d đá • %.1f%% thành công" % [int(quote["RES-001"]),int(quote["RES-113"]),100*WorldQuotes.enhancement_chance(int(g.enhance),int(g.fails))],16)
	var enhance=button(row,"Cường hóa",func():gear_detail(id,store.enhance_gear(id)))
	enhance.disabled=not store.has_cost(quote)
	var protected_button=button(row,"Bảo hộ +1 bùa",func():gear_detail(id,store.enhance_gear(id,true)))
	protected_button.disabled=not store.has_cost(WorldQuotes.enhancement_cost(int(g.enhance),true))
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
	open_screen("ninja_detail")
	var p=store.state.owned[id]
	label(root,"THỨC TỈNH • "+str(reg.ninjas[id].name_vi),30)
	label(root,"Phẩm %s | Thành thạo %d | Thiên phú %s" % [p.quality,store.total_mastery(p),p.get("talent","")],18)
	label(root,message,18)
	if int(p.quality)<8:
		var rule=reg.growth.quality_upgrade_steps[int(p.quality)-1]
		label(root,"Phẩm kế: cảnh %d • thành thạo %d • mảnh %d/%d • %s" % [int(rule.min_realm),int(rule.min_mastery),int(p.shards),int(rule.shards),cost_text(rule.resources)],16)
	button(root,"Thử thách phẩm chất",func():awakening_screen(id,"Thắng thử thách" if store.quality_trial(reg,id) else "Chưa đủ điều kiện hoặc chưa thắng"))
	button(root,"Tiến hóa phẩm chất",func():awakening_screen(id,"Đã tiến hóa" if store.evolve_quality(reg,id) else "Chưa đủ điều kiện"))
	for form_id in reg.ninjas[id].form_ids:
		var b=button(root,str(reg.forms[form_id].name_vi)+" • mở khóa",func():awakening_screen(id,"Đã mở hình thái" if store.unlock_form(reg,id,form_id) else "Chưa đủ cảnh giới hoặc tinh hoa"))
		b.disabled=form_id in p.forms
	button(root,"Trở về",func():growth_detail(id))

func village_screen(message: String="") -> void:
	home_screen(message)

func inventory_screen() -> void:
	open_screen("inventory")
	label(root,"KHO TÀI NGUYÊN & TRANG BỊ",26)
	var row=HBoxContainer.new()
	root.add_child(row)
	var search=LineEdit.new()
	search.placeholder_text="Tìm tên tài nguyên hoặc mã"
	search.text=inventory_query
	search.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	row.add_child(search)
	button(row,"Lọc",func():inventory_query=search.text;inventory_screen())
	button(row,"Trang bị sở hữu",gear_screen)
	button(row,"Chế tạo",craft_screen)
	button(row,"Thưởng chờ nhận ("+str(store.state.reward_inbox.size())+")",reward_inbox_screen)
	var rows=scroll_rows(root)
	for id in reg.resources:
		var r=reg.resources[id]
		if inventory_query!="" and not (str(r.name_vi)+" "+id).to_lower().contains(inventory_query.to_lower()):continue
		var line=HBoxContainer.new()
		rows.add_child(line)
		var l=label(line,"%s • %s" % [id,r.name_vi],17)
		l.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		label(line,str(store.state.inventory.get(id,0))+" / "+str(Village.capacity(store.state,id)),16)
		button(line,"Nguồn / công dụng",func():resource_detail(id))

func building_screen(id: String,message: String="") -> void:
	open_screen("building")
	store.advance_clock(reg,int(Time.get_unix_time_from_system()))
	var b=store.state.building_states[id]
	var def=reg.buildings[id]
	var info=product_art_header(root,"environment/buildings/"+id+".png","%s • Cấp %d/100" % [def.name_vi,int(b.level)],"Yêu cầu Tổng bộ %d | %s" % [int(def.unlock_hq),message],80)
	var status_text="Đang xây / nâng cấp" if not b.upgrade.is_empty() else "Đã xây" if int(b.level)>0 else "Chưa xây"
	label(info,status_text+" • Tình trạng %.0f%%" % (float(b.condition)*100),15)
	var cost=preload("res://game/village_service.gd").upgrade_cost(reg,store.state,id)
	var nav=HBoxContainer.new()
	root.add_child(nav)
	var upgrade=button(nav,"Xây/nâng cấp: %d Ryo, %d gỗ, %d đá" % [cost["RES-001"],cost["RES-006"],cost["RES-009"]],func():building_screen(id,"Đã đặt lịch" if store.construct(reg,id) else "Chưa đủ điều kiện"))
	var construction=Village.construction_quote(reg,store.state,id)
	upgrade.disabled=not construction.ready
	upgrade.tooltip_text=str(construction.reason)
	label(info,str(construction.reason),15)
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
		label(rows,"Đang sản xuất %s • còn %ds • %s" % [b.production.recipe,int(b.production.remaining),"Tự lặp" if b.production.repeat else str(b.production.get("batches_left",1))+" mẻ"],18)
		if b.production.reserved.is_empty():label(rows,"Đang chờ nguyên liệu",16)
		elif int(b.production.remaining)==0:label(rows,"Đang chờ chỗ trống trong kho",16)
		button(rows,"Dừng và hoàn nguyên liệu",func():building_screen(id,"Đã dừng; phần vượt kho ở Hộp thưởng" if store.cancel_production(id) else "Không thể dừng"))
	else:
		for recipe_id in def.recipe_ids:
			var recipe=reg.recipes[recipe_id]
			var row=HBoxContainer.new()
			rows.add_child(row)
			var output=str(reg.resources[recipe.output.resource_id].name_vi)
			label(row,"%s ×%d (cấp %d)" % [output,int(recipe.output.qty),int(recipe.min_building_level)],16)
			var q=Village.recipe_quote(store.state,recipe)
			var quote_text=[]
			for key in q.cost:quote_text.append("%s %d/%d" % [reg.resources[key].name_vi,int(store.state.inventory.get(key,0)),int(q.cost[key])])
			label(row,", ".join(PackedStringArray(quote_text)),15)
			var single=button(row,"Sản xuất",func():building_screen(id,"Đã đặt" if store.production(reg,id,recipe_id,false) else "Thiếu nguyên liệu hoặc nhân lực"))
			single.disabled=not q.ready
			button(row,"Nguồn",func():resource_detail(str(recipe.output.resource_id)))
			var batch=button(row,"5 mẻ",func():building_screen(id,"Đã đặt 5 mẻ" if store.production(reg,id,recipe_id,false,5) else "Chưa đủ điều kiện"))
			batch.disabled=not q.ready
			batch.tooltip_text="Đủ nguyên liệu ngay: "+str(q.affordable)+" mẻ. Mỗi mẻ trừ riêng; thiếu sẽ chờ."
			button(row,"Tự động",func():building_screen(id,"Đã bật" if store.production(reg,id,recipe_id,true) else "Chưa đủ điều kiện"))

func world_screen(message: String="") -> void:
	open_screen("world")
	label(root,"NHẪN GIỚI • 60 lãnh địa / 71 đường",26)
	var row=HBoxContainer.new()
	root.add_child(row)
	button(row,"Ngoại giao",diplomacy_screen)
	button(row,"Đội viễn chinh / phòng thủ",squad_menu)
	button(row,"Biên giới",frontier_screen)
	button(row,"Làm mới",func():world_screen())
	label(row,"Hiện tại: "+str(reg.territories[store.state.world_location].name_vi)+" • "+message,16)
	var content=HBoxContainer.new()
	content.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(content)
	var map=Control.new()
	map.custom_minimum_size.x=730
	map.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	map.clip_contents=true
	content.add_child(map)
	var side=VBoxContainer.new()
	side.custom_minimum_size.x=400
	content.add_child(side)
	var draw_map=func():
		map.draw_rect(Rect2(Vector2.ZERO,map.size),Color("#20353d"))
		for route in reg.routes:
			var a=world_point(map,route.from)
			var b=world_point(map,route.to)
			map.draw_line(a,b,Color("#687981"),1.5,true)
		for id in reg.territories:
			var point=world_point(map,id)
			var t=store.state.territory_states[id]
			var color=Color("#62717a") if not t.discovered else Color("#e6b36b") if t.owner=="FAC-009" else Color("#7ba8a3")
			map.draw_circle(point,8 if id==selected_territory else 5,color)
			if id==store.state.world_location:map.draw_arc(point,12,0,TAU,32,Color.WHITE,2)
			if id==selected_territory:map.draw_arc(point,15,0,TAU,32,Color("#f6ca77"),2)
			map.draw_string(ThemeDB.fallback_font,point+Vector2(8,-6),str(id).right(3),HORIZONTAL_ALIGNMENT_LEFT,-1,11)
	map.draw.connect(draw_map)
	map.gui_input.connect(func(event):
		if event is InputEventMouseButton and event.pressed and event.button_index==MOUSE_BUTTON_LEFT:
			var best=""
			var distance=22.0
			for id in reg.territories:
				var dist=event.position.distance_to(world_point(map,id))
				if dist<distance:distance=dist;best=id
			if best!="":selected_territory=best;world_screen())
	var t=store.state.territory_states[selected_territory]
	var d=reg.territories[selected_territory]
	var route=World.path(reg,store.state,store.state.world_location,selected_territory)
	label(side,str(d.name_vi) if t.discovered or not route.is_empty() else "Lãnh địa chưa khám phá",23)
	label(side,"Sở hữu: "+str(t.owner)+" • Phòng thủ "+str(d.defense_rating) if t.discovered else "Chưa khám phá",17)
	if not store.state.travel.is_empty():label(side,"Đang đi • "+str(store.state.travel.remaining)+" giây",16)
	elif selected_territory!=store.state.world_location and not route.is_empty():button(side,"Đi "+str(route.seconds)+" giây",func():world_screen("Đã xuất phát" if store.travel_to(reg,selected_territory) else "Không thể đi"))
	if selected_territory==store.state.world_location and t.owner!="FAC-009":
		var reason=World.capture_reason(reg,store.state,selected_territory,store.state.team,store.state.world_location,store.state.travel)
		var capture=button(side,"Chiếm lĩnh" if reason=="" else reason,func():world_screen(("Đã chiếm" if store.state.territory_states[selected_territory].owner=="FAC-009" else "Thất bại") if store.capture_territory(reg,selected_territory) else "Chưa đủ điều kiện"))
		capture.disabled=reason!=""
	label(side,"Bảo hộ làng: %d giây" % int(store.state.raid_protection),16)
	if t.discovered:
		for resource in d.resources:
			var key=str(resource.resource_id)
			label(side,str(reg.resources[key].name_vi)+" • sản lượng bản đồ "+str(resource.yield_per_tick),16)
			var q=World.harvest_quote(reg,store.state,selected_territory,key)
			if not q.is_empty():
				var b=button(side,"DEV thu 1 • "+str(q.remaining)+"s",func():world_screen("Đã thu" if store.harvest_territory(reg,selected_territory,key) else "Thiếu điều kiện"))
				b.disabled=not q.ready
				b.tooltip_text=str(reg.buildings[q.building].name_vi)+" cấp "+str(q.level)+" và nhân lực"
	var list_rows=scroll_rows(side)
	for id in reg.territories:
		var path=World.path(reg,store.state,store.state.world_location,id)
		if store.state.territory_states[id].discovered or not path.is_empty():
			button(list_rows,str(reg.territories[id].name_vi)+" • "+id,func():selected_territory=id;world_screen())

func diplomacy_screen(message: String="") -> void:
	var rows=activity_rows("NGOẠI GIAO • 9 thế lực",message,func():world_screen())
	screen_id="diplomacy"
	for id in reg.factions:
		if id=="FAC-009":continue
		var r=World.relation(store.state,"FAC-009",id)
		button(rows,"%s | %s | %d" % [reg.factions[id].name_vi,r.state,int(r.score)],func():faction_screen(id))

func faction_screen(id: String,message: String="") -> void:
	open_screen("diplomacy")
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
		var bulk_buy_cost=World.quote_trade(reg,store.state,id,resource,10,true)
		var bulk_sell_value=World.quote_trade(reg,store.state,id,resource,10,false)
		var buy_bulk=button(line,"Mua 10 (%d)" % bulk_buy_cost,func():faction_screen(id,"Đã mua" if store.trade_resource(reg,id,resource,10,true) else "Thiếu điều kiện giao thương"))
		buy_bulk.disabled=stock<10 or int(store.state.inventory.get("RES-001",0))<bulk_buy_cost
		var sell_bulk=button(line,"Bán 10 (%d)" % bulk_sell_value,func():faction_screen(id,"Đã bán" if store.trade_resource(reg,id,resource,10,false) else "Thiếu điều kiện giao thương"))
		sell_bulk.disabled=int(store.state.inventory.get(resource,0))<10

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
	screen_id="quest"
	button(rows,"Phái ninja / tài nguyên",mission_screen)
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
	if not job.is_empty():
		label(rows,"Đang làm nhiệm vụ "+str(job.resource)+" • còn "+str(job.remaining)+"s",18)
		button(rows,"Dừng nhiệm vụ",func():mission_detail(ninja,"Đã dừng" if store.stop_mission(ninja) else "Lỗi"))
	for source in reg.supply:
		if not source.source_type in ["mission","mission_or_library","trial","bloodline_trial"]:continue
		var resource=str(source.resource_id)
		var text_value="%s ×%d | Tổng bộ %d" % [reg.resources[resource].name_vi,int(source.base_yield),int(source.source_min_hq)]
		if source.source_type in ["mission","mission_or_library"]:
			button(rows,text_value,func():mission_detail(ninja,"Đã phái đi" if store.start_mission(reg,ninja,resource) else "Chưa đủ điều kiện"))
			button(rows,"Tự lặp: "+str(reg.resources[resource].name_vi),func():mission_detail(ninja,"Đã bật" if store.start_mission(reg,ninja,resource,true) else "Chưa đủ điều kiện"))
		else:
			var cooldown=maxi(0,int(store.state.source_cooldowns.get(ninja+":"+resource,0))-int(store.state.simulation_seconds))
			var trial=button(rows,text_value+" • đấu thử thách • hồi "+str(cooldown)+"s",func():mission_detail(ninja,"Đã thắng" if store.resource_trial(reg,ninja,resource) else "Chưa thắng / chưa đủ điều kiện"))
			trial.disabled=not store.resource_trial_ready(reg,ninja,resource)

func beast_screen(message: String="") -> void:
	var rows=activity_rows("VĨ THÚ • 9",message,activities_screen)
	screen_id="beasts"
	button(rows,"Thông linh thú",contract_screen)
	button(rows,"Huyết kế",bloodline_screen)
	for id in reg.beasts:
		var b=store.state.beasts.get(id,{})
		button(rows,"%s | %s" % [reg.beasts[id].name,"Chưa thu phục" if b.is_empty() else "Cấp "+str(b.level)+" | "+str(b.host)],func():beast_detail(id))

func beast_detail(id: String,message: String="") -> void:
	var rows=activity_rows("VĨ THÚ • "+str(reg.beasts[id].name),message,func():beast_screen())
	var def=reg.beasts[id]
	var req=def.capture_requires
	label(rows,"Thu phục: cảnh %d • %d %s • công trình %s" % [int(req.realm),int(req.seal_qty),reg.resources[req.seal_resource].name_vi,reg.buildings["BLD-027"].name_vi],17)
	label(rows,"Thử thu phục tiêu ấn kể cả khi thất bại. Chỉ phong ấn vào chủ thể tương thích đã duyệt.",15)
	button(rows,"Nguồn ấn thu phục",func():resource_detail(str(req.seal_resource)))
	button(rows,"Điện Vĩ Thú",func():building_screen("BLD-027"))
	if store.state.beasts.has(id):
		var beast=store.state.beasts[id]
		label(rows,"Cấp %d • XP %d/%d • Chủ thể %s" % [int(beast.level),int(beast.xp),ceili(100*pow(float(beast.level),1.6)),str(beast.host)],17)
		button(rows,"Tu luyện • 1 "+str(reg.resources[def.training_resource].name_vi),func():beast_detail(id,"Đã tu luyện" if store.train_beast(reg,id) else "Thiếu tài nguyên"))
		var qty=mini(100,int(store.state.inventory.get(def.training_resource,0)))
		var bulk=button(rows,"Tu luyện ×"+str(qty),func():beast_detail(id,"Đã tu luyện" if store.train_beast(reg,id,qty) else "Thiếu tài nguyên"))
		bulk.disabled=qty<=0
		button(rows,"Nguồn tinh hoa",func():resource_detail(str(def.training_resource)))
		for host in def.compatibility.preferred_host_ids:
			var reason=store.beast_bind_reason(reg,str(host),id)
			label(rows,"Chủ thể tương thích: "+str(reg.ninjas[host].name_vi)+" • "+("Sẵn sàng" if reason=="" else reason),16)
			if not store.state.owned.has(host):button(rows,"Mở chiêu mộ",recruit_screen)
	for ninja in store.state.owned:
		if store.state.beasts.has(id):
			if not ninja in def.compatibility.preferred_host_ids:continue
			var bind=button(rows,"Phong ấn vào "+str(reg.ninjas[ninja].name_vi),func():beast_detail(id,"Đã phong ấn" if store.bind_beast(reg,ninja,id) else "Không tương thích / thiếu ấn"))
			bind.disabled=not store.beast_bind_ready(reg,ninja,id)
			bind.tooltip_text=store.beast_bind_reason(reg,ninja,id)
		else:
			var capture=button(rows,"Thử thu phục với "+str(reg.ninjas[ninja].name_vi)+" • cảnh "+str(store.state.owned[ninja].realm),func():beast_detail(id,"Đã thu phục" if store.capture_beast(reg,ninja,id) else "Không thắng / thiếu điều kiện"))
			capture.disabled=not store.beast_capture_ready(reg,ninja,id)
			capture.tooltip_text=store.beast_capture_reason(reg,ninja,id)

func contract_screen(message: String="") -> void:
	var rows=activity_rows("THÔNG LINH THÚ • 11",message,activities_screen)
	for id in reg.contracts:
		var c=store.state.summon_contracts.get(id,{})
		button(rows,"%s | %s" % [reg.contracts[id].name,"Chưa ký" if c.is_empty() else "Cấp "+str(c.level)],func():contract_detail(id))

func contract_detail(id: String,message: String="") -> void:
	var rows=activity_rows(str(reg.contracts[id].name),message,func():contract_screen())
	var def=reg.contracts[id]
	if not store.state.summon_contracts.has(id):
		label(rows,"Cần %d %s • %s" % [int(def.contract_qty),reg.resources[def.contract_resource].name_vi,reg.buildings["BLD-026"].name_vi],17)
		button(rows,"Ký khế ước",func():contract_detail(id,"Đã ký" if store.make_contract(reg,id) else "Thiếu vật liệu / công trình"))
		return
	var contract=store.state.summon_contracts[id]
	label(rows,"Cấp %d • Chủ: %s" % [int(contract.level),str(contract.owner)],17)
	if str(contract.owner)!="":button(rows,"Thu hồi khế ước",func():contract_detail(id,"Đã thu hồi" if store.unassign_contract(id) else "Không thể thu hồi"))
	button(rows,"Tăng cấp • %d Ryo" % store.contract_training_cost(id),func():contract_detail(id,"Đã tăng cấp" if store.train_contract(id) else "Thiếu Ryo"))
	button(rows,"+5 cấp • %d Ryo" % store.contract_training_cost(id,5),func():contract_detail(id,"Đã tăng cấp" if store.train_contract(id,5) else "Thiếu Ryo"))
	for ninja in store.state.owned:
		var assign_button=button(rows,"Gán "+str(reg.ninjas[ninja].name_vi),func():contract_detail(id,"Đã gán" if store.assign_contract(id,ninja) else "Đã có chủ / đã có khế ước"))
		assign_button.disabled=str(contract.owner)!="" or str(store.state.owned[ninja].summon_contract)!=""

func bloodline_screen(message: String="") -> void:
	var rows=activity_rows("HUYẾT KẾ VÀ ĐỒNG THUẬT",message,activities_screen)
	for ninja in store.state.owned:
		for id in reg.bloodlines:
			var def=reg.bloodlines[id]
			var q=store.native_bloodline_quote(reg,ninja,id)
			if q.is_empty():continue
			var row=HBoxContainer.new()
			rows.add_child(row)
			var b=button(row,"%s | %s | Bậc %d/%d • cảnh %d • %d %s" % [reg.ninjas[ninja].name_vi,def.name_vi,int(q.current),int(q.max),int(q.realm),int(q.qty),reg.resources[q.resource].name_vi],func():bloodline_screen("Đã thức tỉnh / nâng cấp" if store.native_bloodline(reg,ninja,id) else "Thiếu điều kiện"))
			b.disabled=not q.ready
			b.size_flags_horizontal=Control.SIZE_EXPAND_FILL
			button(row,"Nguồn",func():resource_detail(str(q.resource)))

func save_screen(message: String="") -> void:
	open_screen("settings")
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
	ok=ok and battle.outcome=="win" and test.finish_stage(reg,stage,event,true,battle.counts,battle.mastery_counts,battle.action_stats)
	ok=ok and test.train("NIN-001")
	var reloaded=SaveStore.new()
	reloaded.save_path=test.save_path
	reloaded.load_or_new(reg)
	ok=ok and reloaded.state.cleared.has("STG-001") and not reloaded.finish_stage(reg,stage,event,true,{})
	ok=ok and reloaded.assign_job(reg,"NIN-001","BLD-015","JOB-10") and reloaded.choose_job_talent("NIN-001","JOB-10","yield")
	ok=ok and reloaded.start_mission(reg,"NIN-001","RES-001",true)
	var before_wood=int(reloaded.state.inventory["RES-006"])
	ok=ok and reloaded.advance_clock(reg,int(reloaded.state.high_water_timestamp)+600) and int(reloaded.state.inventory["RES-006"])>before_wood
	ok=ok and reloaded.stop_mission("NIN-001")
	ok=ok and reloaded.set_team(["NIN-001","NIN-003"]) and reloaded.set_world_squad("SQUAD-2",["NIN-005"]) and reloaded.squad_travel(reg,"SQUAD-2","TER-059")
	ok=ok and reloaded.advance_clock(reg,int(reloaded.state.high_water_timestamp)+200) and reloaded.state.world_squads["SQUAD-2"].location=="TER-059"
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

func squad_menu(message: String="") -> void:
	var rows=activity_rows("ĐỘI VIỄN CHINH / PHÒNG THỦ",message,func():world_screen())
	label(rows,"Mỗi đội tối đa 6 ninja, không dùng chung thành viên.",17)
	button(rows,"Tạo đội mới",func():
		var id=store.create_world_squad()
		squad_menu("Đã tạo "+id if id!="" else "Hãy sử dụng ô đội trống hoặc tuyển thêm ninja"))
	button(rows,"Đội phòng thủ • "+str(store.state.home_defense.size())+"/6",func():squad_detail("defense"))
	for key in store.state.world_squads:
		var squad=store.state.world_squads[key]
		button(rows,"%s • %s • %d/6" % [key,reg.territories[squad.location].name_vi,squad.team.size()],func():squad_detail(key))
	for id in store.state.faction_states:
		if id=="FAC-009":continue
		var npc=store.state.faction_states[id]
		label(rows,"%s • Sản xuất %d | Phòng thủ %d | Huấn luyện %d" % [reg.factions[id].name_vi,int(npc.infrastructure.production),int(npc.infrastructure.defense),int(npc.infrastructure.training)],17)

func squad_detail(key: String,message: String="") -> void:
	var rows=activity_rows("ĐỘI "+key,message,func():squad_menu())
	var roster=store.state.home_defense if key=="defense" else store.state.world_squads[key].team
	button(rows,"Bố trận 3×3 • "+key,func():squad_formation_screen(key))
	for id in store.state.owned:
		button(rows,("✓ " if id in roster else "+ ")+str(reg.ninjas[id].name_vi),func():
			var next=roster.duplicate()
			if id in next:next.erase(id)
			elif next.size()<6:next.append(id)
			squad_detail(key,"Đã lưu đội" if store.set_world_squad(key,next) else "Ninja đã ở đội khác hoặc đội đang triển khai"))
	if key=="defense":return
	var squad=store.state.world_squads[key]
	if not squad.travel.is_empty():
		label(rows,"Đang đi • "+str(squad.travel.remaining)+"s",18)
		button(rows,"Làm mới",func():squad_detail(key))
		return
	if store.state.territory_states[squad.location].owner!="FAC-009":button(rows,"Chiếm lĩnh",func():squad_detail(key,("Đã chiếm" if store.state.territory_states[squad.location].owner=="FAC-009" else "Thất bại") if store.squad_capture(reg,key) else "Chưa đủ điều kiện"))
	for id in reg.territories:
		if id==squad.location:continue
		var route=preload("res://game/world_service.gd").path(reg,store.state,squad.location,id)
		if not route.is_empty():button(rows,"Đi "+str(reg.territories[id].name_vi)+" • "+str(route.seconds)+"s",func():squad_detail(key,"Đã phái đi" if store.squad_travel(reg,key,id) else "Chưa đủ điều kiện"))

func make_theme() -> Theme:
	var t=Theme.new()
	t.default_font_size=17
	t.set_color("font_color","Label",Color("#eee9df"))
	t.set_constant("separation","VBoxContainer",7)
	t.set_constant("separation","HBoxContainer",7)
	t.set_constant("h_separation","GridContainer",8)
	t.set_constant("v_separation","GridContainer",8)
	t.set_color("font_color","LineEdit",Color("#f0eee8"))
	t.set_color("font_placeholder_color","LineEdit",Color("#9ca7aa"))
	for control_type in ["LineEdit","PanelContainer"]:
		var panel=StyleBoxFlat.new()
		panel.bg_color=Color("#202832")
		panel.border_color=Color("#535966")
		panel.set_border_width_all(1)
		panel.set_corner_radius_all(7)
		panel.content_margin_left=8
		panel.content_margin_right=8
		panel.content_margin_top=6
		panel.content_margin_bottom=6
		t.set_stylebox("normal" if control_type=="LineEdit" else "panel",control_type,panel)
	for state_key in ["normal","hover","pressed","disabled","focus"]:
		var style=StyleBoxFlat.new()
		style.bg_color=Color("#252d39") if state_key=="normal" else Color("#3b414d") if state_key=="hover" else Color("#745a35") if state_key=="pressed" else Color("#20252e") if state_key=="disabled" else Color("#3b414d")
		style.border_color=Color("#4d5867") if state_key!="focus" else Color("#f1bb69")
		style.set_border_width_all(1)
		style.set_corner_radius_all(7)
		style.content_margin_left=10
		style.content_margin_right=10
		style.content_margin_top=6
		style.content_margin_bottom=6
		t.set_stylebox(state_key,"Button",style)
	t.set_color("font_color","Button",Color("#ecf1f1"))
	t.set_color("font_disabled_color","Button",Color("#7b8991"))
	return t

func open_screen(id: String) -> void:
	screen_id=id
	if private_backdrop!=null:
		private_backdrop.texture=art.texture("environment/village_plate.png") if id=="home" else null
	header.visible=id!="battle"
	navigation.visible=id!="battle"
	var section={"home":"Làng","building":"Làng","craft":"Làng","ninja_roster":"Ninja","ninja_detail":"Ninja","skill_tree":"Ninja","formation":"Bố trận","recruit":"Chiêu mộ","campaign":"Cốt truyện","world":"Nhẫn giới","diplomacy":"Nhẫn giới","inventory":"Kho","quest":"Nhiệm vụ","beasts":"Vĩ Thú","settings":"Cài đặt"}
	for item in navigation.get_children():
		if item is Button:
			item.self_modulate=Color("#f8d493") if item.text==section.get(id,"") else Color.WHITE
	clear()
	update_resources()

func update_resources() -> void:
	if resource_bar==null or store.state.is_empty():return
	resource_bar.text="   Ryo %s   •   Ngọc %s   •   Gỗ %s   •   Đá %s   •   Thể lực %d/120" % [store.state.inventory.get("RES-001",0),store.state.inventory.get("RES-002",0),store.state.inventory.get("RES-006",0),store.state.inventory.get("RES-009",0),int(store.state.stamina)]

func scroll_rows(parent: Node) -> VBoxContainer:
	var sc=ScrollContainer.new()
	sc.size_flags_vertical=Control.SIZE_EXPAND_FILL
	sc.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	sc.horizontal_scroll_mode=ScrollContainer.SCROLL_MODE_DISABLED
	parent.add_child(sc)
	var rows=VBoxContainer.new()
	rows.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	rows.add_theme_constant_override("separation",5)
	sc.add_child(rows)
	return rows

func home_screen(message: String="") -> void:
	open_screen("home")
	label(root,"LÀNG LÁ  /  Tổng bộ cấp "+str(Village.level(store.state,"BLD-001")),26)
	var row=HBoxContainer.new()
	root.add_child(row)
	label(row,"Ninja %d/144 • Ải %d/120 • %s" % [store.state.owned.size(),store.state.cleared.size(),message],17)
	button(row,"Chế tạo",craft_screen)
	button(row,"Hoạt động",activities_screen)
	if art.enabled:button(row,"Thử 6v6 • R12",start_art_review)
	button(row,"Làm mới",func():home_screen())
	if store.state.jobs.is_empty():button(row,"Phân công khởi đầu",func():home_screen("Đã phân công" if store.setup_starter_jobs(reg) else "Lỗi lưu"))
	var guidance=HBoxContainer.new()
	root.add_child(guidance)
	var next_id=next_story_stage()
	var prompt_text="Bắt đầu phân công sản xuất để có nguyên liệu" if store.state.jobs.is_empty() else "Cốt truyện tiếp theo: "+next_id if not next_id.is_empty() else "Đã vượt toàn bộ cốt truyện • phát triển nhẫn giới"
	var guide=label(guidance,prompt_text,16)
	guide.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	if not next_id.is_empty():
		var next_stage=reg.stages[next_id]
		var play=button(guidance,"Chơi tiếp",func():start_battle(next_stage))
		play.disabled=store.state.team.is_empty() or int(store.state.stamina)<int(next_stage.stamina_cost)
		play.tooltip_text="Vào "+next_id+" • "+str(next_stage.stamina_cost)+" thể lực"
	button(guidance,"Đội hình",roster)
	button(guidance,"Nhận thưởng chờ",reward_inbox_screen)
	var grid=GridContainer.new()
	grid.columns=6
	grid.size_flags_vertical=Control.SIZE_EXPAND_FILL
	root.add_child(grid)
	for id in reg.buildings:
		var b=store.state.building_states[id]
		var detail="Cấp "+str(int(b.level)) if int(b.level)>0 else "Chưa xây • HQ "+str(int(reg.buildings[id].unlock_hq))
		if not b.upgrade.is_empty():detail="Xây: "+str(int(b.upgrade.remaining))+"s"
		var tile=button(grid,str(reg.buildings[id].name_vi)+"\n"+detail,func():building_screen(id))
		tile.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		tile.size_flags_vertical=Control.SIZE_EXPAND_FILL
		tile.custom_minimum_size.y=56
		if int(b.level)==0:tile.modulate=Color("#a4b2ba")
	# R11 review pack is optional; original grid remains if a marker is unavailable.
	var mapped=village_map.apply(self)
	var footer=HBoxContainer.new()
	root.add_child(footer)
	var hint=label(footer,"Bắt đầu: phân công khai thác → Nhiệm vụ Ryo → nâng Tổng bộ → Cốt truyện.",15)
	hint.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	var map_status=label(footer,("30 công trình • Bản đồ R12" if art.texture("environment/village_ground_p3.png")!=null else "30 công trình • Review R11") if mapped else "30 công trình • Giao diện chuẩn",14)
	map_status.modulate=Color("#ebc77e") if mapped else Color("#a5b4b6")

func quality_color(q: int) -> Color:
	return [Color("#c9d1d2"),Color("#99d7ae"),Color("#9fc9ef"),Color("#d0afea"),Color("#efc479"),Color("#eaa495"),Color("#f2dc8e"),Color("#ffdbb5")][clampi(q,1,8)-1]

func stat_title(key: String) -> String:
	if reg.stat_catalog.has(key):return str(reg.stat_catalog[key].name_vi).capitalize()
	var titles={"vitality":"Thể chất","strength":"Sức mạnh","spirit":"Tinh thần","agility":"Nhanh nhẹn","intellect":"Trí tuệ","potential":"Tiềm năng","hp":"Sinh lực","armor":"Giáp","nres":"Kháng nhẫn","hp_regen":"Hồi máu","damage_reduction":"Giảm sát thương","crit_resist":"Kháng chí mạng","patk":"Công thể","armor_pen":"Xuyên giáp","attack_speed":"Tốc đánh","accuracy":"Chính xác","evasion":"Né tránh","counter":"Phản kích","natk":"Công nhẫn","magic_pen":"Xuyên kháng","ncrit":"Chí mạng nhẫn","element_power":"Công nguyên tố","area":"Phạm vi","cast_speed":"Tốc niệm","genjutsu_power":"Công ảo","control_chance":"Khống chế","control_duration":"Thời gian CC","control_resist":"Kháng CC","genjutsu_resist":"Kháng ảo","cleanse":"Giải hiệu ứng","chakra_max":"Chakra tối đa","chakra_regen":"Hồi chakra","chakra_efficiency":"Tiết kiệm chakra","chakra_drain":"Hút chakra","chakra_drain_resist":"Kháng hút","chakra_conversion":"Chuyển chakra","move_speed":"Tốc chạy","pcrit":"Chí mạng thể","crit_damage":"Sát thương chí mạng","lifesteal":"Hút máu","healing":"Trị liệu","cdr":"Giảm hồi chiêu","insight":"Lĩnh ngộ","training_speed":"Tốc tu luyện","comprehension":"Thông hiểu","xp_efficiency":"Hiệu suất EXP","mastery_speed":"Thành thạo","absorption":"Hấp thu"}
	return str(titles.get(key,key))

func ninja_gear_screen(id: String) -> void:
	var rows=activity_rows("TRANG BỊ • "+str(reg.ninjas[id].name_vi),"",func():growth_detail(id))
	screen_id="ninja_detail"
	for i in range(1,17):
		var slot="EQ-%03d" % i
		var equipped=store.state.owned[id].gear.get(slot,"")
		if equipped!="":button(rows,"%s • %s" % [slot,reg.gear_templates[store.state.gear_instances[equipped].template_id].name_vi],func():gear_detail(equipped))
		else:
			label(rows,slot+" • "+str(reg.gear_templates.get(slot+"-Q1",{}).get("name_vi","Trang bị"))+" • Trống",17)
		for gear_id in store.state.gear_instances:
			var g=store.state.gear_instances[gear_id]
			if g.owner=="" and reg.gear_templates[g.template_id].slot_id==slot:
				button(rows,("Thay bằng " if equipped!="" else "Mặc ")+str(reg.gear_templates[g.template_id].name_vi),func():store.equip_gear(reg,id,gear_id);ninja_gear_screen(id))
	button(rows,"Chế tạo trang bị",gear_craft_screen)

func recruit_screen(message: String="") -> void:
	open_screen("recruit")
	label(root,"CHIÊU MỘ NINJA",28)
	label(root,"Ngọc: %s • Lượt: %d • SSR %d/20 • UR %d/80" % [store.state.inventory.get("RES-002",0),int(store.state.draws),int(store.state.pity4),int(store.state.pity5)],18)
	label(root,message,18)
	var row=HBoxContainer.new()
	root.add_child(row)
	var draw_button=button(row,"Chiêu mộ 1 • 100 ngọc",recruit_one)
	draw_button.disabled=int(store.state.inventory.get("RES-002",0))<100
	button(row,"Chiêu mộ 10 • 1000 ngọc",func():
		if int(store.state.inventory.get("RES-002",0))<1000:recruit_screen("Không đủ ngọc");return
		var results=[]
		for i in range(10):
			var id=store.draw(reg)
			if id=="":break
			results.append(reg.ninjas[id].name_vi)
		recruit_screen("Nhận: "+", ".join(results)))
	var rows=scroll_rows(root)
	for tier in reg.recruit.pool:
		label(rows,"%s • Phẩm %d • Tỷ lệ %s%% • %d ninja" % [tier.label,int(tier.quality),tier.weight,tier.ninja_ids.size()],18).modulate=quality_color(int(tier.quality))
	label(rows,"Trùng mẫu ninja nhận mảnh; không có thanh toán tiền thật.",16)
	for id in store.state.owned:
		label(rows,"%s • %d mảnh" % [reg.ninjas[id].name_vi,int(store.state.owned[id].shards)],16)

func cost_text(inputs: Array) -> String:
	var parts=[]
	for r in inputs:
		parts.append("%s %s/%s" % [reg.resources[r.resource_id].name_vi,store.state.inventory.get(r.resource_id,0),r.qty])
	return " · ".join(parts)

func craft_screen(message: String="") -> void:
	var rows=activity_rows("CHẾ TẠO • 63 công thức",message,func():home_screen())
	screen_id="craft"
	button(rows,"128 mẫu trang bị",gear_craft_screen)
	for id in reg.recipes:
		var recipe=reg.recipes[id]
		var line=HBoxContainer.new()
		rows.add_child(line)
		var l=label(line,"%s ×%d • %s • %s" % [reg.resources[recipe.output.resource_id].name_vi,int(recipe.output.qty),reg.buildings[recipe.building_id].name_vi,cost_text(recipe.inputs)],15)
		l.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		l.text_overrun_behavior=TextServer.OVERRUN_TRIM_ELLIPSIS
		l.tooltip_text=l.text
		button(line,"Mở xưởng",func():building_screen(recipe.building_id))
		var b=button(line,"Đặt",func():craft_screen("Đã đặt" if store.production(reg,recipe.building_id,id,false) else "Thiếu nguyên liệu / công nhân / cấp xưởng"))
		var quote=Village.recipe_quote(store.state,recipe)
		b.disabled=not quote.ready
		b.tooltip_text="Mẻ đủ nguyên liệu: "+str(quote.affordable)+" • Xưởng "+str(quote.level)+"/"+str(quote.required_level)+(" • Chưa có nhân lực" if not quote.staffed else "")
		button(line,"Nguồn",func():resource_detail(str(recipe.output.resource_id)))

func resource_detail(id: String,message: String="") -> void:
	var rows=activity_rows(str(reg.resources[id].name_vi),"Trong kho: "+str(store.state.inventory.get(id,0))+((" • "+message) if message!="" else ""),inventory_screen)
	screen_id="inventory"
	if reg.resources[id].tradable and not id in ["RES-001","RES-002","RES-003","RES-004","RES-005"]:
		var unit=maxi(1,floori(float(reg.resources[id].base_price_ryo)*0.35))
		var qty=mini(100,int(store.state.inventory.get(id,0)))
		var sell=button(rows,"Bán %d • %d Ryo" % [qty,unit*qty],func():resource_trade_result(id,store.sell_surplus(reg,id,qty)))
		sell.disabled=qty<=0
	var order=store.merchant_quote(reg,id)
	if not order.is_empty():
		var order_button=button(rows,"Đơn thương hội DEV: %d vật phẩm → %d Ryo (%d/3 hôm nay)" % [int(order.qty),int(order.total),int(order.used)],func():resource_trade_result(id,store.fulfill_merchant_order(reg,id)))
		order_button.disabled=not order.ready
		order_button.tooltip_text="Chỉ bán phần vượt 80% kho; tối đa 10% sức chứa mỗi đơn."
	for source in reg.supply:
		if source.resource_id==id:
			label(rows,"Nguồn: "+str(source.source_type)+" • HQ "+str(source.source_min_hq)+" • "+str(source.base_yield)+" / "+str(source.period_seconds)+"s",17)
			button(rows,"Mở "+str(reg.buildings[source.building_id].name_vi),func():building_screen(source.building_id))
			if source.source_type in ["mission","mission_or_library","trial","bloodline_trial"]:
				button(rows,"Chọn ninja thực hiện",mission_screen)
			if source.source_type in ["trial","bloodline_trial"]:
				var ready=store.trial_roster(reg,id)
				var roster=ready.slice(0,6)
				var names=[]
				for ninja in roster:names.append(reg.ninjas[ninja].name_vi)
				label(rows,"Sẵn sàng: "+str(ready.size())+" ninja • mỗi ninja đấu riêng và có hồi chiêu",16)
				var batch=button(rows,"Đấu thử thách với "+str(roster.size())+" ninja",func():
					var result=store.resource_trial_batch(reg,id,roster)
					resource_detail(id,"Đã đấu %d, thắng %d, nhận %d" % [int(result.attempts),int(result.wins),int(result.earned)]))
				batch.disabled=roster.is_empty()
				batch.tooltip_text=", ".join(PackedStringArray(names))
			if source.source_type=="territory":
				for territory in reg.territories.values():
					for item in territory.resources:
						if item.resource_id==id:
							var own=store.state.territory_states[territory.id].owner=="FAC-009"
							var territory_id=str(territory.id)
							button(rows,str(territory.name_vi)+(" • Đang kiểm soát" if own else " • Chưa kiểm soát"),func():selected_territory=territory_id;world_screen())
				button(rows,"Mở nhẫn giới",func():world_screen())
			if source.source_type=="boss_or_contract":
				if id=="RES-148":label(rows,"DEV: thưởng boss khi có Khu thông linh hoặc Điện Vĩ Thú.",16)
				button(rows,"Mở chiến dịch",campaign)
				for stage_id in reg.stages:
					if reg.stages[stage_id].boss_id!=null and store.state.cleared.has(stage_id):
						var stage=reg.stages[stage_id]
						var replay=button(rows,"Đánh lại "+str(stage.name_vi)+" • "+str(stage.stamina_cost)+" thể lực",func():start_battle(stage))
						replay.disabled=int(store.state.stamina)<int(stage.stamina_cost) or store.state.team.is_empty()
	for territory in reg.territories.values():
		var q=World.harvest_quote(reg,store.state,str(territory.id),id)
		if q.is_empty():continue
		var target=str(territory.id)
		button(rows,"DEV khai thác "+str(territory.name_vi)+" • "+("Sẵn sàng" if q.ready else "Cần xưởng / nhân lực / hồi"),func():selected_territory=target;world_screen())
	for seller in ResourceGuide.sellers(reg,store.state,id):
		var faction=str(seller.faction)
		button(rows,"%s • kho %d • %d Ryo • %s" % [reg.factions[faction].name_vi,int(seller.stock),int(seller.price),"Có thể mua" if seller.accessible else "Cần giao thương"],func():faction_screen(faction))
	var stage_ids=ResourceGuide.stage_sources(reg,id)
	if not stage_ids.is_empty():
		label(rows,"Phần thưởng ải: "+", ".join(PackedStringArray(stage_ids.slice(0,8)))+(" …" if stage_ids.size()>8 else ""),16)
		button(rows,"Mở chiến dịch",campaign)
	for quest in reg.quests.values():
		for reward in quest.reward:
			if reward.resource_id==id:
				label(rows,"Nhiệm vụ: "+str(quest.name_vi),16)
				break
	for recipe in reg.recipes.values():
		if recipe.output.resource_id==id:
			label(rows,"Công thức: "+cost_text(recipe.inputs)+" • Cấp xưởng "+str(recipe.min_building_level)+" • "+str(recipe.duration_s)+" giây",17)
			for item in recipe.inputs:
				var key=str(item.resource_id)
				button(rows,"Nguồn "+str(reg.resources[key].name_vi),func():resource_detail(key))
			button(rows,"Mở xưởng",func():building_screen(recipe.building_id))
		for item in recipe.inputs:
			if item.resource_id==id:label(rows,"Dùng để chế: "+str(reg.resources[recipe.output.resource_id].name_vi),16)

func world_point(map: Control,id: String) -> Vector2:
	var c=reg.territories[id].coords
	var max_x=1.0
	var max_y=1.0
	for d in reg.territories.values():
		max_x=maxf(max_x,float(d.coords[0]))
		max_y=maxf(max_y,float(d.coords[1]))
	return Vector2(25+float(c[0])/max_x*(map.size.x-55),25+float(c[1])/max_y*(map.size.y-55))

func settings_screen(message: String="") -> void:
	open_screen("settings")
	label(root,"CÀI ĐẶT",28)
	label(root,message,18)
	var sound=CheckButton.new()
	sound.text="Âm thanh"
	sound.button_pressed=bool(store.state.get("settings",{}).get("sound",true))
	root.add_child(sound)
	sound.toggled.connect(func(on):change_setting("sound",on))
	var cutin=CheckButton.new()
	cutin.text="Hiệu ứng chiêu / cut-in (chuẩn bị tích hợp mỹ thuật)"
	cutin.button_pressed=bool(store.state.get("settings",{}).get("cutin",true))
	root.add_child(cutin)
	cutin.toggled.connect(func(on):change_setting("cutin",on))
	var effect=CheckButton.new()
	effect.text="Hiển thị đường đạn DEV"
	effect.button_pressed=bool(store.state.get("settings",{}).get("projectiles",true))
	root.add_child(effect)
	effect.toggled.connect(func(on):change_setting("projectiles",on))
	var passive_toggle=CheckButton.new()
	passive_toggle.text="Thử nghiệm nội tại P1–P6 (DEV, mặc định tắt)"
	passive_toggle.button_pressed=bool(store.state.get("settings",{}).get("passives_dev",false))
	root.add_child(passive_toggle)
	passive_toggle.toggled.connect(func(on):change_setting("passives_dev",on))
	var pilot_toggle=CheckButton.new()
	pilot_toggle.text="P2 pilot (12 ninja; cần bật P1)"
	pilot_toggle.button_pressed=bool(store.state.get("settings",{}).get("passive_pilot_dev",false))
	root.add_child(pilot_toggle)
	pilot_toggle.toggled.connect(func(on):change_setting("passive_pilot_dev",on))
	var mixed_toggle=CheckButton.new()
	mixed_toggle.text="P2 hỗn hợp DEV (mặc định): giữ P1 cho ninja ngoài pilot"
	mixed_toggle.button_pressed=bool(store.state.get("settings",{}).get("passive_mixed_dev",true))
	root.add_child(mixed_toggle)
	mixed_toggle.toggled.connect(func(on):change_setting("passive_mixed_dev",on))
	var depth_toggle=CheckButton.new()
	depth_toggle.text="Tăng trưởng V5 và hàng đợi tuyệt kỹ DEV"
	depth_toggle.button_pressed=bool(store.state.get("settings",{}).get("depth_v5_dev",true))
	root.add_child(depth_toggle)
	depth_toggle.toggled.connect(func(on):change_setting("depth_v5_dev",on))
	button(root,"Lưu game",func():settings_screen("Đã lưu" if store.save_now() else "Lỗi lưu"))
	button(root,"Tải lại save",func():store.load_or_new(reg);apply_settings();settings_screen(store.load_notice if store.load_notice!="" else "Đã tải"))
	button(root,"Xuất / nhập save",save_screen)
	var art_row=HBoxContainer.new()
	root.add_child(art_row)
	button(art_row,"Nạp gói mỹ thuật riêng",choose_review_art)
	button(art_row,"Trận thử mỹ thuật 6v6",start_art_review)
	button(art_row,"Bật / tắt review",func():
		art.enabled=not art.enabled and not art.textures.is_empty()
		art.source_label="REVIEW RIÊNG • "+str(art.textures.size())+" ảnh" if art.enabled else "DEV • tắt gói review"
		settings_screen(art.source_label))
	var coverage=art.product_coverage()
	label(root,art.source_label+" • %d sprite / %d chân dung • %d/30 công trình" % [coverage.characters,coverage.portraits,coverage.buildings],15)
	label(root,"Animation metadata: %d • Bộ đủ 14 clip: %d • VFX review: %d sheet (HOLD)" % [coverage.clips,coverage.complete_kits,coverage.vfx_sheets],15)
	label(root,"Game offline; bản Web dùng dữ liệu trình duyệt. Hãy sao lưu JSON trước khi đổi bản.",17)

func change_setting(key: String,value: bool) -> void:
	if not store.state.has("settings"):store.state.settings={}
	store.state.settings[key]=value
	apply_settings()
	store.save_now()

func apply_settings() -> void:
	AudioServer.set_bus_mute(0,not bool(store.state.get("settings",{}).get("sound",true)))

func probe_buttons(node: Node,out: Array) -> void:
	if node is Button and node.is_visible_in_tree():
		var r=node.get_global_rect()
		var clip_rect=get_viewport_rect()
		var parent=node.get_parent()
		while parent!=null:
			if parent is ScrollContainer:clip_rect=clip_rect.intersection(parent.get_global_rect())
			parent=parent.get_parent()
		var clipped=r.intersection(clip_rect)
		if clipped.size.x>=12 and clipped.size.y>=12:
			out.append({"text":node.text,"x":clipped.get_center().x,"y":clipped.get_center().y,"w":clipped.size.x,"h":clipped.size.y,"disabled":node.disabled})
	for child in node.get_children():probe_buttons(child,out)

func publish_ui_probe() -> void:
	var controls=[]
	probe_buttons(shell,controls)
	JavaScriptBridge.eval("window.naruUI="+JSON.stringify({"screen":screen_id,"buttons":controls,"width":get_viewport_rect().size.x,"height":get_viewport_rect().size.y,"owned":store.state.owned.size(),"draws":store.state.draws,"stamina":store.state.stamina,"cleared":store.state.cleared.size(),"paused":paused,"speed":battle_speed,"art_count":art.textures.size(),"character_overlays":art.character_overlays.keys(),"art_draws":art.actor_draws,"r12_actor_draws":art.r12_actor_draws,"missing_actor_ids":art.missing_actor_ids.keys(),"authored_actor_draws":art.authored_actor_draws,"art_fx":art.effect_draws,"review":review_mode,"formation_id":store.state.formation_id,"formation_slots":store.state.formation_slots,"formation_levels":store.state.formation_levels,"arena_width":sim.map_width if sim!=null else 0,"arena_height":sim.map_height if sim!=null else 0,"battle_field_width":field.size.x if sim!=null and is_instance_valid(field) else 0,"battle_field_height":field.size.y if sim!=null and is_instance_valid(field) else 0,"battle_details":battle_details,"observation":observation_mode,"detail_dock_visible":is_instance_valid(battle_dock) and battle_dock.is_visible_in_tree(),"mini_hud_visible":is_instance_valid(battle_mini) and battle_mini.is_visible_in_tree()}))

func training_screen(id: String,message: String="") -> void:
	var rows=activity_rows("TU LUYỆN • "+str(reg.ninjas[id].name_vi),message,func():growth_detail(id))
	screen_id="ninja_detail"
	var p=store.state.owned[id]
	label(rows,"Cấp %d/%d | XP %d" % [int(p.level),(int(p.realm)+1)*20,int(p.xp)],18)
	for resource in ["RES-116","RES-117"]:
		var line=HBoxContainer.new()
		rows.add_child(line)
		label(line,"%s • Có %d" % [reg.resources[resource].name_vi,int(store.state.inventory.get(resource,0))],17)
		for qty in [1,5,10,50,100]:
			var use=button(line,"Dùng "+str(qty),func():training_screen(id,"Đã tu luyện" if store.train_batch(reg,id,resource,qty) else "Thiếu cuộn hoặc đạt trần cảnh"))
			use.disabled=int(store.state.inventory.get(resource,0))<qty or int(p.level)>=(int(p.realm)+1)*20
		var qcap=store.training_scroll_quote(reg,id,resource)
		var until=button(line,"Tối đa "+str(qcap.qty),func():training_screen(id,"Đã tu luyện" if store.train_to_cap(reg,id,resource) else "Đã đạt trần / thiếu cuộn"))
		until.disabled=int(qcap.qty)<=0
		until.tooltip_text="XP nhận: "+str(qcap.xp)+" • Còn thiếu tới trần: "+str(qcap.remaining)
		var price=120 if resource=="RES-116" else 600
		var b=button(line,"Mua 5 • "+str(price*5)+" Ryo",func():training_screen(id,"Đã mua" if store.buy_training_scrolls(resource,5) else "Cần HQ2 / đủ Ryo / chỗ kho"))
		b.disabled=Village.level(store.state,"BLD-001")<2
		var bulk=button(line,"Mua 100",func():training_screen(id,"Đã mua" if store.buy_training_scrolls(resource,100) else "Thiếu Ryo hoặc chỗ kho"))
		bulk.disabled=Village.level(store.state,"BLD-001")<5 or int(store.state.inventory.get("RES-001",0))<price*100
		bulk.tooltip_text=str(price*100)+" Ryo"
	label(rows,"Tu luyện chuyên biệt • tăng chỉ số nền",20)
	for stat in ["strength","vitality","spirit","agility","intellect","potential"]:
		var q=store.training_quote(id,stat)
		var line=HBoxContainer.new()
		rows.add_child(line)
		var l=label(line,"%s +%.2f | %d Ryo + %d %s" % [stat_title(stat),float(p.get("training",{}).get(stat,0)),int(q.ryo),int(q.qty),reg.resources[q.resource].name_vi],16)
		l.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		button(line,"Mở "+str(reg.buildings[q.building].name_vi),func():building_screen(q.building))
		var b=button(line,"Tu luyện",func():training_screen(id,"Đã tăng" if store.train_stat(reg,id,stat) else "Thiếu công trình / nguyên liệu"))
		b.disabled=Village.level(store.state,q.building)<=0
		var bulk=button(line,"Tối đa 10 lần",func():training_screen(id,"Đã tu luyện" if store.train_stat(reg,id,stat,10) else "Thiếu nguyên liệu"))
		bulk.disabled=b.disabled or not store.has_cost({"RES-001":q.ryo,str(q.resource):q.qty})

func choose_review_art() -> void:
	if OS.has_feature("web"):
		art_callback=JavaScriptBridge.create_callback(_receive_art_web)
		JavaScriptBridge.get_interface("window").naruReviewArtCallback=art_callback
		JavaScriptBridge.eval("(function(){const input=document.createElement('input');input.type='file';input.accept='.json,application/json';input.id='naru-review-file';input.style.position='fixed';input.style.left='-9999px';document.body.appendChild(input);input.onchange=async()=>{const f=input.files[0];if(f && f.size<=16000000){window.naruReviewArtCallback(await f.text());}input.remove();};input.click();})()")
	else:
		var dialog=FileDialog.new()
		dialog.file_mode=FileDialog.FILE_MODE_OPEN_FILE
		dialog.access=FileDialog.ACCESS_FILESYSTEM
		dialog.add_filter("*.json","Gói mỹ thuật review")
		add_child(dialog)
		dialog.file_selected.connect(func(path):receive_art(FileAccess.get_file_as_string(path));dialog.queue_free())
		dialog.canceled.connect(dialog.queue_free)
		dialog.popup_centered_ratio(0.8)

# Private offline distribution: only the explicit loopback-host sibling file, never remote.
func try_local_art_pack() -> void:
	if not OS.has_feature("web"):return
	auto_art_callback=JavaScriptBridge.create_callback(_receive_local_art)
	JavaScriptBridge.get_interface("window").naruLocalArtCallback=auto_art_callback
	JavaScriptBridge.eval("(async()=>{if(!['localhost','127.0.0.1','[::1]'].includes(location.hostname))return;try{const r=await fetch(new URL('naru-art.json',location.href),{cache:'no-store',credentials:'same-origin',redirect:'error'});if(!r.ok)return;const b=await r.blob();if(b.size<=16000000)window.naruLocalArtCallback(await b.text());}catch(e){}})()")

func _receive_local_art(args: Array) -> void:
	if args.size()!=1:return
	if art.import_text(str(args[0]),false):
		if screen_id=="home":home_screen("Đã nạp mỹ thuật riêng P3")
		print("NARU_LOCAL_ART_LOADED ",art.textures.size())

func _receive_art_web(args: Array) -> void:
	if args.size()==1:receive_art(str(args[0]))

func receive_art(raw: String) -> void:
	var parsed=JSON.parse_string(raw)
	var is_overlay=parsed is Dictionary and parsed.has("character_id")
	var ok=false
	if is_overlay:
		ok=art.import_character_overlay(raw,str(parsed.character_id))
	else:
		ok=art.import_text(raw)
	settings_screen(("Đã nạp bộ nhân vật cho phiên chơi; không ghi đè gói nền." if is_overlay else "Đã nạp review cục bộ; không tải lên mạng.") if ok else art.error)

func start_art_review() -> void:
	review_mode=true
	battle_stage={"name_vi":"6v6 • Benchmark sprite chi tiết • không thưởng"}
	sim=Combat.new()
	sim.registry=reg
	sim.use_depth=true
	sim.use_tactical=true
	sim.use_passives=true
	sim.use_contract_v10=true
	sim.load_combat_contracts()
	sim.rng.seed=42
	sim.environment="forest"
	sim.side_formations={0:"FRM-01",1:"FRM-02"}
	sim.side_levels={0:1,1:1}
	sim.configure_terrain()
	var left=["NIN-041","NIN-042","NIN-093","NIN-043","NIN-060","NIN-004"]
	var right=["NIN-001","NIN-016","NIN-002","NIN-003","NIN-070","NIN-068"]
	var level=20
	if art.enabled:
		# Match the prior detailed six-ninja benchmark on the left, not the starter-era chibi roster.
		battle_stage.name_vi="6v6 • R11 sprite chuẩn bên trái • không thưởng"
	if "--combat-video" in OS.get_cmdline_user_args():
		if art.enabled:
			left=["NIN-041","NIN-042","NIN-093","NIN-043","NIN-060","NIN-004"]
			right=["NIN-001","NIN-016","NIN-002","NIN-003","NIN-070","NIN-068"]
		else:
			left=["NIN-055","NIN-041","NIN-042","NIN-043","NIN-007","NIN-004"]
			right=["NIN-070","NIN-060","NIN-093","NIN-021","NIN-008","NIN-022"]
		level=140
		if "--style-benchmark" in OS.get_cmdline_user_args() and art.enabled:
			# Nine higher-detail identities in twelve real actor slots; this is a mirror-match review, not twelve new kits.
			left=["NIN-041","NIN-042","NIN-093","NIN-043","NIN-060","NIN-004"]
			right=["NIN-016","NIN-041","NIN-042","NIN-070","NIN-068","NIN-043"]
			battle_stage.name_vi="Benchmark mỹ thuật • 9 danh tính / 12 ninja"
	var review_slots=[0,1,2,6,7,8] if "--style-benchmark" in OS.get_cmdline_user_args() else [0,1,2,3,4,5]
	for i in range(6):
		var id=left[i]
		sim.add_actor(id,0,level,int(reg.ninjas[id].initial_quality),{},review_slots[i],1.0,{"realm":6,"stars":5,"forms":reg.ninjas[id].form_ids,"unlocked_skills":reg.ninjas[id].additional_skill_ids} if level>20 else {})
	for i in range(6):
		var id=right[i]
		sim.add_actor(id,1,level,int(reg.ninjas[id].initial_quality),{},review_slots[i],1.0,{"realm":6,"stars":5,"forms":reg.ninjas[id].form_ids,"unlocked_skills":reg.ninjas[id].additional_skill_ids} if level>20 else {})
	battle_view()

func resource_trade_result(id: String,ok: bool) -> void:
	resource_detail(id)
	label(root,"Đã bán" if ok else "Cần HQ2 và ít nhất 100 tài nguyên",16)

func reward_inbox_screen(message: String="") -> void:
	var rows=activity_rows("THƯỞNG CHỜ NHẬN",message,inventory_screen)
	screen_id="inventory"
	if store.state.reward_inbox.is_empty():label(rows,"Không có thưởng chờ.",18)
	for id in store.state.reward_inbox:
		var qty=int(store.state.reward_inbox[id])
		button(rows,"%s ×%d • Nhận phần còn chỗ" % [reg.resources[id].name_vi,qty],func():reward_inbox_screen("Đã nhận" if store.collect_reward_inbox(id) else "Kho đầy"))

func squad_formation_screen(key: String,message: String="") -> void:
	var rows=activity_rows("TRẬN PHÁP • "+key,message,func():squad_detail(key))
	var roster=store.state.home_defense if key=="defense" else store.state.world_squads[key].team
	var config=store.state.get("squad_formations",{}).get(key,{"formation_id":"FRM-01","slots":{}})
	var slots=preload("res://game/formation_service.gd").normalize_slots(roster,config.slots)
	var row=HBoxContainer.new()
	rows.add_child(row)
	var options=OptionButton.new()
	row.add_child(options)
	var ids=reg.formations.keys()
	for id in ids:options.add_item(str(reg.formations[id].name_vi)+" Lv."+str(store.state.formation_levels[id]))
	options.select(ids.find(config.formation_id))
	options.item_selected.connect(func(index):squad_formation_screen(key,"Đã chọn" if store.set_squad_formation(reg,key,ids[index]) else "Đội đang triển khai"))
	var grid=GridContainer.new()
	grid.columns=3
	rows.add_child(grid)
	for i in range(9):
		var id=""
		for ninja in slots:
			if int(slots[ninja])==i:id=ninja;break
		var b=button(grid,("▶ " if selected_slot==i else "")+str(i+1)+" • "+(str(reg.ninjas[id].name_vi) if id!="" else "Ô trống"),func():selected_slot=i;squad_formation_screen(key))
		b.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	for id in roster:
		button(rows,str(reg.ninjas[id].name_vi)+" → ô "+str(selected_slot+1),func():squad_formation_screen(key,"Đã đổi ô" if store.set_squad_formation(reg,key,config.formation_id,selected_slot,id) else "Đội đang triển khai"))
	label(rows,"Cấp trận pháp dùng chung toàn tài khoản; bố trí từng đội độc lập.",16)

func passive_screen(id: String,message: String="") -> void:
	open_screen("skill_tree")
	var p=store.state.owned[id]
	var svc=preload("res://game/passive_service.gd")
	label(root,"NỘI TẠI P1–P6 • "+str(reg.ninjas[id].name_vi),24)
	button(root,"Trở về nhẫn thuật",func():skill_screen(id))
	label(root,"DEV • Sao %d • Cảnh %d • %s" % [int(p.stars),int(p.realm),"Bật thử trong Cài đặt" if not store.state.get("settings",{}).get("passives_dev",false) else "Đang bật"],17)
	label(root,message,15)
	var rows=scroll_rows(root)
	var pilot_on=store.state.get("settings",{}).get("passive_pilot_dev",false) and store.state.get("settings",{}).get("passives_dev",false)
	var pilot_rows=reg.passive_pilot_rows.get(id,[]) if reg.passive_pilot_ninjas.has(id) else []
	var mixed_on=pilot_on and bool(store.state.get("settings",{}).get("passive_mixed_dev",true))
	var pilot_isolated=pilot_on and pilot_rows.is_empty() and not mixed_on
	if mixed_on and pilot_rows.is_empty():label(rows,"P2 hỗn hợp DEV • nội tại P1 đang hoạt động cho ninja ngoài pilot.",15)
	if pilot_isolated:label(rows,"Ninja chưa thuộc 12 mẫu pilot P2. Nội tại P1 bên dưới chỉ xem; tắt pilot để sử dụng cấu hình P1.",15)
	for data in (pilot_rows if pilot_on and not pilot_rows.is_empty() else reg.passives_by_ninja.get(id,[])):
		var key=str(data.id)
		var sk=svc.progress(p,key)
		var box=VBoxContainer.new()
		rows.add_child(box)
		var value=svc.potency(data,p,int(p.stars))
		var heading=label(box,"P%d • %s | G%d L%d • %.2f%%" % [int(data.slot),str(data.name_vi),int(sk.grade),int(sk.level),value*100],18)
		heading.tooltip_text=str(data.trigger.condition)+" | "+str(data.counterplay)+" | "+str(reg.passive_ledger[key])
		var link=reg.synergy_links.get(key,{})
		if not link.is_empty():
			var explicit_ids=PackedStringArray(link.explicit_skill_ids)
			var predicted_ids=PackedStringArray(link.event_candidates)
			if not explicit_ids.is_empty():heading.tooltip_text+=" | Liên kết thiết kế: "+", ".join(explicit_ids)
			if not predicted_ids.is_empty():heading.tooltip_text+=" | Ứng viên sự kiện: "+", ".join(predicted_ids)
		if reg.passive_pilot.has(key):heading.tooltip_text+=" | P2 pilot DEV "+("đang thử" if pilot_on else "chưa bật")
		if reg.synergy_gaps.has(key):heading.tooltip_text+=" | REVIEW: "+str(reg.synergy_gaps[key])
		label(box,"%s • %s • %s • Cảnh %d • Thành thạo %d • %s" % [str(data.trigger.event),str(data.target.scope),str(data.effect.key),int(data.unlock.realm),int(sk.mastery),str(reg.passive_ledger[key])],14)
		if pilot_isolated:
			label(box,"P1 tham khảo • không chạy trong pilot P2",15)
			continue
		if not store.passive_allowed(reg,id,key):
			label(box,"Chưa mở khóa",15)
			continue
		if reg.passive_ledger[key]!="DEV_CANDIDATE" or reg.synergy_gaps.get(key,"")=="FORM_ZERO_PAYLOAD_REVIEW":
			label(box,"HOLD • chưa cho tiêu sách/tiến giai",15)
			continue
		var nav=HBoxContainer.new()
		box.add_child(nav)
		var book=str(data.progression.book)
		var quote=WorldQuotes.skill_batch(int(sk.level),int(sk.grade),int(store.state.inventory.get(book,0)),20,true)
		label(box,"%s: %d • Tiến giai %d %s • %.0f%% • bảo hiểm %d/4" % [reg.resources[book].name_vi,int(store.state.inventory.get(book,0)),WorldQuotes.advance_cost(int(sk.grade),true),reg.resources["RES-130"].name_vi,100*WorldQuotes.grade_chance(int(sk.grade),int(sk.fails)),int(sk.fails)],14)
		var level_button=button(nav,"+1 (%d)" % WorldQuotes.level_cost(int(sk.level),int(sk.grade),true),func():passive_screen(id,"Đã tăng cấp" if store.upgrade_passive(reg,id,key) else "Thiếu sách hoặc đủ cấp"))
		level_button.disabled=int(quote.count)==0
		var bulk=button(nav,"+%d (%d)" % [int(quote.count),int(quote.cost)],func():passive_screen(id,"Đã tăng cấp" if store.upgrade_passive(reg,id,key,20) else "Thiếu sách"))
		bulk.disabled=int(quote.count)<2
		var grade_button=button(nav,"Tiến giai (%d/4)" % int(sk.fails),func():passive_screen(id,store.advance_passive(reg,id,key)))
		grade_button.disabled=int(sk.level)<20 or int(store.state.inventory.get("RES-130",0))<WorldQuotes.advance_cost(int(sk.grade),true)
		for br in data.progression.branches:
			if int(sk.grade)>=int(br.grade) and str(sk.branch).is_empty():
				var branch_id=str(br.id)
				button(nav,str(br.name),func():passive_screen(id,"Đã chọn nhánh" if store.branch_passive(reg,id,key,branch_id) else "Không thể chọn"))
		if not str(sk.branch).is_empty():label(box,"Nhánh: "+str(sk.branch),14)

func scroll_battle_visibility() -> void:
	if is_instance_valid(battle_actions_panel):battle_actions_panel.visible=not observation_mode
	if is_instance_valid(battle_mini):battle_mini.visible=observation_mode
	if is_instance_valid(battle_dock):battle_dock.visible=battle_details and not observation_mode
	for uid in battle_action_groups:
		var group=battle_action_groups[uid]
		if is_instance_valid(group):group.visible=battle_details and not observation_mode and int(uid)==inspected_uid
	for card in battle_cards:
		var selected=int(card.uid)==inspected_uid
		card.panel.add_theme_stylebox_override("panel",combat_panel(Color("#2f2b26") if selected else Color("#1b232c"),Color("#e8bd73") if selected else Color("#485360")))
		card.mini.self_modulate=Color("#f4cc82") if selected else Color.WHITE
	refresh_battle_toggles()
	update_battle_inspector()

func select_battle_actor(uid: int) -> void:
	inspected_uid=uid
	observation_mode=false
	battle_details=true
	hud_clock=1.0
	scroll_battle_visibility()

func inspect_battle_input(event: InputEvent) -> void:
	if sim==null:return
	var point=Vector2.ZERO
	if event is InputEventMouseButton and event.pressed and event.button_index==MOUSE_BUTTON_LEFT:point=event.position
	elif event is InputEventScreenTouch and event.pressed:point=event.position
	else:return
	var best={}
	var distance=55.0
	for a in sim.actors:
		if a.hp<=0:continue
		var d=point.distance_to(iso(a.pos)-Vector2(0,40*arena_scale()))
		if d<distance:best=a;distance=d
	if not best.is_empty():
		select_battle_actor(int(best.uid))

func update_battle_inspector() -> void:
	if not is_instance_valid(battle_inspector) or not battle_details or observation_mode or inspected_uid==0 or sim==null:return
	var a=sim.actor_by_uid(inspected_uid)
	if a.is_empty():return
	var labels=[]
	for id in a.skills:
		var s=sim.effective_skill(a,id)
		var cd=float(a.cooldowns.get(id,0))
		labels.append(sim.skill_name(id)+"  •  "+("CD %.1fs" % cd if cd>0 else "%.1f CP" % float(s.chakra)))
	var states=[]
	for st in a.statuses.values():states.append(str(st.id)+" %.1fs" % float(st.remaining))
	for key in a.get("passive_mods",{}):
		var value=float(a.passive_mods[key])
		if absf(value)>0.00001:states.append(str(key)+" %+.1f%%" % (value*100.0))
	if not a.active_form.is_empty():
		states.append(str(a.active_form.id)+" %.1fs" % float(a.active_form.remaining))
		for stat in reg.p2_forms.get(a.active_form.id,{}).get("effect",{}).get("stat",{}):
			states.append(str(stat)+" ×%.2f" % sim.form_multiplier(a,stat))
	if sim.ultimate_requests.has(a.uid):states.append("Chờ tuyệt kỹ: "+sim.skill_name(str(sim.ultimate_requests[a.uid])))
	var head=str(reg.ninjas.get(a.id,{}).get("name_vi",a.id))+" • "+str(reg.ninjas.get(a.id,{}).get("role_hint","Triệu hồi"))
	battle_selected_portrait.texture=art.texture("portraits/"+str(a.id)+".png")
	battle_selected_portrait.visible=battle_selected_portrait.texture!=null
	battle_inspector.text=head+"\nHP %d/%d\nCP %.1f/%.1f" % [int(a.hp),int(a.max_hp),a.chakra,a.max_chakra]
	battle_skill_info.text="\n".join(labels)
	battle_state_info.text="Không có hiệu ứng" if states.is_empty() else "\n".join(states)
	battle_inspector.tooltip_text=battle_inspector.text
func frontier_screen() -> void:
	var rows=activity_rows("BIÊN GIỚI NHẪN GIỚI","Lãnh địa giáp vùng sở hữu, có đường đi hiện tại.",func():world_screen())
	for entry in World.frontier(reg,store.state,store.state.world_location):
		var id=str(entry.id)
		var owner="Trung lập" if entry.owner==null else str(reg.factions[entry.owner].name_vi)
		var materials=[]
		for item in reg.territories[id].resources:materials.append(str(reg.resources[item.resource_id].name_vi))
		button(rows,"%s • %s • %ds • %s" % [reg.territories[id].name_vi,owner,int(entry.seconds),", ".join(PackedStringArray(materials))],func():selected_territory=id;world_screen())

func gear_material_screen(id: String) -> void:
	var def=reg.gear_templates[id]
	var rows=activity_rows("NGUYÊN LIỆU • "+str(def.name_vi),"Chuỗi tham khảo theo công thức; không tự tiêu tài nguyên.",gear_craft_screen)
	button(rows,"Mở "+str(reg.buildings[def.craft.building_id].name_vi),func():building_screen(def.craft.building_id))
	var needs={}
	for item in def.craft.inputs:
		var resource=str(item.resource_id)
		needs[resource]=int(needs.get(resource,0))+int(item.qty)
		label(rows,"%s • %d/%d" % [reg.resources[resource].name_vi,int(store.state.inventory.get(resource,0)),int(item.qty)],17)
	var plan=ResourceGuide.plan(reg,needs,store.state.inventory)
	for recipe_id in plan.orders:
		var recipe=reg.recipes[recipe_id]
		button(rows,"Sản xuất "+str(reg.resources[recipe.output.resource_id].name_vi)+" • "+str(plan.orders[recipe_id])+" mẻ • xưởng cấp "+str(recipe.min_building_level),func():building_screen(str(recipe.building_id)))
	for key in plan.raw:button(rows,"Nguồn còn thiếu: "+str(reg.resources[key].name_vi)+" ×"+str(plan.raw[key]),func():resource_detail(key))
