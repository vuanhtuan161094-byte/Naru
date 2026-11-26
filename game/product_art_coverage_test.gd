extends SceneTree
const ReviewArt=preload("res://game/review_art.gd")
func _initialize() -> void:
	var art=ReviewArt.new()
	var blank=Image.create(96,112,false,Image.FORMAT_RGBA8)
	blank.fill(Color.WHITE)
	var texture=ImageTexture.create_from_image(blank)
	art.textures["characters/NIN-001.png"]=texture
	art.textures["portraits/NIN-001.png"]=texture
	for i in range(1,31):art.textures["environment/buildings/BLD-%03d.png"%i]=texture
	for action in ["idle","move","attack","cast","hit","fall"]:
		for direction in ["se","sw","ne","nw"]:
			var path="animation/NIN-001/"+action+"_"+direction+".png"
			art.textures[path]=texture
			art.clip_metadata[path]={"fixture":true}
	var c=art.product_coverage()
	if c.characters!=1 or c.portraits!=1 or c.buildings!=30 or c.complete_kits!=1 or c.clips!=24:
		push_error("P2_ART_COVERAGE_FAIL full fixture")
		quit(1)
		return
	art.clip_metadata.erase("animation/NIN-001/fall_nw.png")
	c=art.product_coverage()
	if c.complete_kits!=0 or c.clips!=23:
		push_error("P2_ART_COVERAGE_FAIL missing metadata")
		quit(1)
		return
	print("NARU_P2_ART_COVERAGE_PASS full and incomplete fixture; not art acceptance")
	quit(0)
