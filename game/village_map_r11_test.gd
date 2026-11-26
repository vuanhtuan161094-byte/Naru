extends SceneTree
const Adapter=preload("res://game/village_map_r11.gd")

class FakeArt:
	extends RefCounted
	var complete=false
	var image: ImageTexture
	func _init():
		var im=Image.create(16,16,false,Image.FORMAT_RGBA8)
		im.fill(Color.WHITE)
		image=ImageTexture.create_from_image(im)
	func texture(path: String) -> Texture2D:
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
	var g=FakeGame.new()
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
		quit(1)
		return
	g.art.complete=true
	if not adapter.apply(g) or adapter.markers.size()!=30:
		push_error("R11_MAP_FAIL complete pack did not activate")
		quit(1)
		return
	for id in g.reg.buildings:
		adapter.markers[id].pressed.emit()
		if g.hits.is_empty() or g.hits.back()!=id:
			push_error("R11_MAP_FAIL incorrect building callback "+id)
			quit(1)
			return
	if g.hits.size()!=30:
		push_error("R11_MAP_FAIL wrong callback count")
		quit(1)
		return
	print("NARU_R11_MAP_PASS 30 callbacks and incomplete-pack fallback (generic fixtures only)")
	g.root.free()
	quit(0)
