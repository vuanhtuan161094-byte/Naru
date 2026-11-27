extends SceneTree
const Adapter=preload("res://game/village_map_r11.gd")

class FakeArt:
	extends RefCounted
	var complete=false
	var panorama=false
	var image: ImageTexture
	func _init():
		var im=Image.create(16,16,false,Image.FORMAT_RGBA8)
		im.fill(Color.WHITE)
		image=ImageTexture.create_from_image(im)
	func texture(path: String) -> Texture2D:
		if path in ["environment/village_ground_p3.png","environment/village_ground_r15.png"] and not panorama:return null
		if not complete and path.ends_with("BLD-030.png"):return null
		return image

class FakeRegistry:
	extends RefCounted
	var buildings={}

class FakeGame:
	extends RefCounted
	var root=VBoxContainer.new()
	var reg=FakeRegistry.new()
	var art=FakeArt.new()
	var hits: Array[String]=[]
	func record(id: String) -> void:
		hits.append(id)

func _initialize() -> void:
	if not check_mode(false) or not check_mode(true):quit(1);return
	print("NARU_R11_MAP_PASS 30 callbacks in R11 and P3, incomplete-pack fallback (generic fixtures only)")
	quit(0)

func check_mode(panorama: bool) -> bool:
	var g=FakeGame.new()
	g.art.panorama=panorama
	var grid=GridContainer.new()
	g.root.add_child(grid)
	for i in range(1,31):
		var id="BLD-%03d"%i
		var label="Building %02d"%i
		g.reg.buildings[id]={"name_vi":label}
		var b=Button.new()
		b.text=label+"\nCấp 1"
		b.pressed.connect(g.record.bind(id))
		grid.add_child(b)
	var adapter=Adapter.new()
	if adapter.apply(g) or grid.get_child_count()!=30 or grid.get_parent()!=g.root:
		push_error("R11_MAP_FAIL incomplete pack mutated fallback")
		g.root.free()
		return false
	g.art.complete=true
	if not adapter.apply(g) or adapter.markers.size()!=30:
		push_error("R11_MAP_FAIL complete pack did not activate")
		g.root.free()
		return false
	for id in g.reg.buildings:
		adapter.markers[id].pressed.emit()
		if g.hits.is_empty() or g.hits.back()!=id:
			push_error("R11_MAP_FAIL incorrect building callback "+id)
			g.root.free()
			return false
	if g.hits.size()!=30:
		push_error("R11_MAP_FAIL wrong callback count")
		g.root.free()
		return false
	var expected="P3VillageMap" if panorama else "R11VillageMap"
	if panorama:
		var map=g.root.get_node_or_null(expected)
		if map==null or map.get_node_or_null("BLD-001")==null or not is_equal_approx(map.get_node("BLD-001").anchor_left,(18.0+2.0*88.8)/1400.0):
			push_error("R11_MAP_FAIL civic layout");g.root.free();return false
	if panorama:
		var map=g.root.get_node(expected)
		var cells=0
		for child in map.get_children():
			if str(child.name).begins_with("BLD-"):cells+=1
		if cells!=30:
			push_error("R15_MAP_FAIL expected 30 unique spatial cells");g.root.free();return false
	if not g.root.has_node(expected):
		push_error("R11_MAP_FAIL wrong view "+expected)
		g.root.free()
		return false
	g.root.free()
	return true
