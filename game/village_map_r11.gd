extends RefCounted
# Visual adapter only. Retains the original building buttons and their gameplay callbacks.
const DISTRICTS=[
 ["Điều hành",["BLD-001","BLD-022","BLD-023","BLD-029","BLD-030"]],
 ["Huấn luyện",["BLD-002","BLD-003","BLD-004","BLD-005","BLD-006"]],
 ["Nhẫn thuật",["BLD-007","BLD-008","BLD-009","BLD-010","BLD-028"]],
 ["Sinh hoạt",["BLD-011","BLD-012","BLD-013","BLD-014","BLD-015"]],
 ["Sản xuất",["BLD-016","BLD-017","BLD-018","BLD-019","BLD-020"]],
 ["Chiến đấu & giao thương",["BLD-021","BLD-024","BLD-025","BLD-026","BLD-027"]]
]
# Physical slot order: top civic/training, middle economy, bottom defense/expeditions.
# Preserves each original BLD callback; no simulation coordinates are changed.
const PANORAMA_ORDER=[2,3,4,5,1,6,7,8,9,28,11,12,13,14,15,16,17,18,19,20,30,23,22,21,29,10,24,25,26,27]
const SHORT=["Tổng bộ","Học viện","Thể thuật","Nhẫn thuật","Ảo thuật","Chakra","Thư viện","Huyết kế","Thức tỉnh","Triệu hồi","Dân cư","Nông trại","Dược liệu","Mỏ","Bãi gỗ","Suối","Xưởng rèn","Xưởng dược","Phong ấn","Kho","Thương hội","Nhiệm vụ","Tình báo","Đấu trường","Thử luyện","Thông linh","Vĩ Thú","Nghiên cứu","Đại sứ","Tháp canh"]
var game
var buttons:Dictionary={}
var markers:Dictionary={}
func style(bg:Color,border:Color=Color("#677d83"),radius:int=8) -> StyleBoxFlat:
 var s=StyleBoxFlat.new()
 s.bg_color=bg;s.border_color=border;s.set_border_width_all(1);s.set_corner_radius_all(radius)
 s.content_margin_left=5;s.content_margin_right=5;s.content_margin_top=4;s.content_margin_bottom=4
 return s
func forward(id:String) -> void:
 if buttons.has(id) and is_instance_valid(buttons[id]) and not buttons[id].disabled:buttons[id].pressed.emit()
func apply(g) -> bool:
 game=g;buttons.clear();markers.clear()
 var old:GridContainer=null
 for child in game.root.get_children():
  if child is GridContainer and child.get_child_count()==30:old=child;break
 if old==null:return false
 for b in old.get_children():
  if not b is Button:continue
  for id in game.reg.buildings:
   if b.text.begins_with(str(game.reg.buildings[id].name_vi)+"\n"):buttons[id]=b;break
 if buttons.size()!=30:return false
 # Validate all marker textures before mutating the existing UI.
 for id in buttons:
  if game.art.texture("environment/buildings/"+id+".png")==null:return false
 var at=old.get_index()
 for id in buttons:old.remove_child(buttons[id])
 game.root.remove_child(old);old.queue_free()
 if game.art.texture("environment/village_ground_p3.png")!=null:
  return apply_panorama(at)
 var map=Control.new();map.name="R11VillageMap";map.size_flags_vertical=Control.SIZE_EXPAND_FILL;map.custom_minimum_size.y=360;game.root.add_child(map);game.root.move_child(map,at)
 var background=TextureRect.new();background.texture=game.art.texture("environment/village_plate.png");background.expand_mode=TextureRect.EXPAND_IGNORE_SIZE;background.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED;background.mouse_filter=Control.MOUSE_FILTER_IGNORE;background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT);map.add_child(background)
 var outer=VBoxContainer.new();outer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT);outer.offset_left=10;outer.offset_right=-10;outer.offset_top=10;outer.offset_bottom=-10;outer.add_theme_constant_override("separation",10);map.add_child(outer)
 for r in range(2):
  var line=HBoxContainer.new();line.size_flags_vertical=Control.SIZE_EXPAND_FILL;line.add_theme_constant_override("separation",10);outer.add_child(line)
  for c in range(3):
   var d=DISTRICTS[r*3+c]
   var district=PanelContainer.new();district.size_flags_horizontal=Control.SIZE_EXPAND_FILL;district.add_theme_stylebox_override("panel",style(Color(0.07,0.12,0.15,0.82),Color("#b29460")));line.add_child(district)
   var col=VBoxContainer.new();col.add_theme_constant_override("separation",4);district.add_child(col)
   var title=Label.new();title.text=d[0];title.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER;title.add_theme_font_size_override("font_size",19);title.add_theme_color_override("font_color",Color("#f2d79c"));col.add_child(title)
   var tiles=HBoxContainer.new();tiles.size_flags_vertical=Control.SIZE_EXPAND_FILL;tiles.add_theme_constant_override("separation",3);col.add_child(tiles)
   for id in d[1]:
    var cell=VBoxContainer.new();cell.size_flags_horizontal=Control.SIZE_EXPAND_FILL;cell.add_theme_constant_override("separation",2);tiles.add_child(cell)
    var marker=TextureButton.new();marker.texture_normal=game.art.texture("environment/buildings/"+id+".png");marker.ignore_texture_size=true;marker.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED;marker.size_flags_vertical=Control.SIZE_EXPAND_FILL;marker.custom_minimum_size=Vector2(0,56);marker.tooltip_text=buttons[id].text;marker.disabled=buttons[id].disabled;marker.pressed.connect(forward.bind(id));cell.add_child(marker);markers[id]=marker
    var b:Button=buttons[id];b.icon=null;var original=b.text;var num=int(str(id).get_slice("-",1));b.text=SHORT[num-1]+"\n"+original.get_slice("\n",1);b.tooltip_text=original;b.custom_minimum_size=Vector2(0,42);b.size_flags_horizontal=Control.SIZE_EXPAND_FILL;b.size_flags_vertical=Control.SIZE_SHRINK_END;b.text_overrun_behavior=TextServer.OVERRUN_TRIM_ELLIPSIS;b.add_theme_font_size_override("font_size",12);b.add_theme_stylebox_override("normal",style(Color("#243947")));b.add_theme_stylebox_override("hover",style(Color("#35505a"),Color("#e8bf75")));b.add_theme_stylebox_override("pressed",style(Color("#395764"),Color("#e8bf75")));cell.add_child(b)
 return markers.size()==30

# Continuous ground plus individually interactive building textures. Review art, no gameplay rules.
# District map: native clickable building sprites with independent labels and original actions.
func apply_panorama(at: int) -> bool:
 var map=Control.new()
 map.name="P3VillageMap"
 map.size_flags_vertical=Control.SIZE_EXPAND_FILL
 map.custom_minimum_size.y=360
 map.clip_contents=true
 game.root.add_child(map)
 game.root.move_child(map,at)
 var bg=TextureRect.new()
 bg.texture=game.art.texture("environment/village_ground_p3.png")
 if bg.texture==null:bg.texture=game.art.texture("environment/village_plate.png")
 bg.expand_mode=TextureRect.EXPAND_IGNORE_SIZE
 bg.stretch_mode=TextureRect.STRETCH_SCALE
 bg.mouse_filter=Control.MOUSE_FILTER_IGNORE
 bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
 map.add_child(bg)
 # Use the same normalized geometry as the authored ground. Keep HQ central in its own district.
 var zones=[
  ["ĐIỀU HÀNH",[22,23,1,29,30],Rect2(12,45,456,210),Color("#f4d39e")],
  ["HUẤN LUYỆN",[2,3,4,5,6],Rect2(484,45,456,210),Color("#d1e2ed")],
  ["NHẪN THUẬT",[7,8,9,10,28],Rect2(956,45,432,210),Color("#dfd0ec")],
  ["SINH HOẠT & TÀI NGUYÊN",[11,12,13,14,15],Rect2(12,267,456,210),Color("#d6e9b8")],
  ["SẢN XUẤT",[16,17,18,19,20],Rect2(484,267,456,210),Color("#f0deae")],
  ["CHIẾN ĐẤU & GIAO THƯƠNG",[21,24,25,26,27],Rect2(956,267,432,210),Color("#f1d1bb")]
 ]
 for district in zones:
  var zone:Rect2=district[2]
  var title=Label.new()
  title.text=district[0]
  title.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER
  title.add_theme_font_size_override("font_size",14)
  title.add_theme_color_override("font_color",district[3])
  title.add_theme_color_override("font_outline_color",Color("#28352e"))
  title.add_theme_constant_override("outline_size",3)
  title.mouse_filter=Control.MOUSE_FILTER_IGNORE
  map.add_child(title)
  title.anchor_left=zone.position.x/1400.0
  title.anchor_right=zone.end.x/1400.0
  title.anchor_top=(zone.position.y+0)/490.0
  title.anchor_bottom=(zone.position.y+21)/490.0
  for slot in range(5):
   var n:int=district[1][slot]
   var id="BLD-%03d"%n
   var cell=Control.new()
   cell.name=id
   cell.mouse_filter=Control.MOUSE_FILTER_IGNORE
   map.add_child(cell)
   var width=(zone.size.x-12.0)/5.0
   cell.anchor_left=(zone.position.x+6.0+slot*width)/1400.0
   cell.anchor_right=(zone.position.x+6.0+(slot+1)*width)/1400.0
   cell.anchor_top=(zone.position.y+20)/490.0
   cell.anchor_bottom=(zone.end.y-8)/490.0
   cell.offset_left=2
   cell.offset_right=-2
   var b:Button=buttons[id]
   b.icon=null
   var original=b.text
   var detail=original.get_slice("\n",1)
   var locked=detail.begins_with("Chưa xây")
   var upgrading=detail.begins_with("Xây:")
   var marker=TextureButton.new()
   marker.texture_normal=game.art.texture("environment/buildings/"+id+".png")
   marker.ignore_texture_size=true
   marker.stretch_mode=TextureButton.STRETCH_KEEP_ASPECT_CENTERED
   marker.texture_filter=CanvasItem.TEXTURE_FILTER_LINEAR
   marker.anchor_left=0.0
   marker.anchor_right=1.0
   marker.anchor_top=0.0
   marker.anchor_bottom=0.74
   marker.tooltip_text=original
   marker.disabled=b.disabled
   var tint=Color(0.74,0.77,0.72,0.86) if locked else Color.WHITE
   marker.self_modulate=tint
   marker.mouse_entered.connect(func():marker.self_modulate=Color(1.15,1.10,0.93,1.0))
   marker.mouse_exited.connect(func():marker.self_modulate=tint)
   marker.pressed.connect(forward.bind(id))
   cell.add_child(marker)
   markers[id]=marker
   b.text=SHORT[n-1]+"\n"+("HQ "+detail.get_slice("HQ ",1) if locked else detail)
   b.tooltip_text=original
   b.modulate=Color.WHITE
   b.custom_minimum_size=Vector2(0,29)
   b.text_overrun_behavior=TextServer.OVERRUN_TRIM_ELLIPSIS
   b.add_theme_font_size_override("font_size",12)
   var border=Color("#e9bd70") if upgrading or n==1 else Color("#69776b") if locked else Color("#a8b68a")
   b.add_theme_stylebox_override("normal",style(Color(0.10,0.14,0.13,0.88),border,5))
   b.add_theme_stylebox_override("hover",style(Color("#41574b"),Color("#f1cb85"),5))
   b.add_theme_stylebox_override("pressed",style(Color("#52634c"),Color("#f1cb85"),5))
   b.add_theme_color_override("font_color",Color("#bdc9bc") if locked else Color("#f7dcab") if upgrading or n==1 else Color("#f0ead9"))
   b.anchor_left=0.0
   b.anchor_right=1.0
   b.anchor_top=0.75
   b.anchor_bottom=1.0
   cell.add_child(b)
 return markers.size()==30
