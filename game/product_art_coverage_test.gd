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
		var directions=["se","sw","ne","nw"] if action=="move" else ["se","sw"]
		for direction in directions:
			var path="animation/NIN-001/"+action+"_"+direction+".png"
			art.textures[path]=texture
			art.clip_metadata[path]={"fixture":true}
	var c=art.product_coverage()
	if c.characters!=1 or c.portraits!=1 or c.buildings!=30 or c.complete_kits!=1 or c.clips!=14:
		push_error("P2_ART_COVERAGE_FAIL full fixture")
		quit(1)
		return
	art.clip_metadata.erase("animation/NIN-001/fall_sw.png")
	c=art.product_coverage()
	if c.complete_kits!=0 or c.clips!=13:
		push_error("P2_ART_COVERAGE_FAIL missing metadata")
		quit(1)
		return
	# Overlay fixture uses synthetic pixels solely for transactional validation.
	art.enabled=true
	var assets={}
	var clips={}
	var required={"idle":6,"move":8,"attack":6,"cast":6,"hit":4,"fall":4}
	var still=blank.save_png_to_buffer()
	assets["characters/NIN-002.png"]={"png":Marshalls.raw_to_base64(still),"width":96,"height":112,"sha256":art.hash_bytes(still)}
	for action in required:
		var dirs=["se","sw","ne","nw"] if action=="move" else ["se","sw"]
		for direction in dirs:
			var n=int(required[action])
			var img=Image.create(n*96,112,false,Image.FORMAT_RGBA8)
			img.fill(Color.WHITE)
			var bytes=img.save_png_to_buffer()
			var key="animation/NIN-002/"+action+"_"+direction+".png"
			assets[key]={"png":Marshalls.raw_to_base64(bytes),"width":n*96,"height":112,"sha256":art.hash_bytes(bytes)}
			var frames=[]
			for frame in range(n):frames.append({"rect":[frame*96,0,96,112],"duration_ms":100})
			clips[key]={"anchor":[48,104],"sha256":art.hash_bytes(bytes),"frames":frames}
	var pack={"schema":1,"status":"REVIEW_ONLY","character_id":"NIN-002","assets":assets,"clips":clips}
	var old=art.textures.size()
	if not art.import_character_overlay(JSON.stringify(pack),"NIN-002") or art.textures.size()!=old+15 or not art.character_overlays.has("NIN-002"):
		push_error("V3_OVERLAY_FAIL complete kit");quit(1);return
	var current=art.textures.size()
	pack.assets.erase("animation/NIN-002/idle_sw.png")
	if art.import_character_overlay(JSON.stringify(pack),"NIN-002") or art.textures.size()!=current or art.import_character_overlay(JSON.stringify(pack),"NIN-004"):
		push_error("V3_OVERLAY_FAIL invalid kit atomicity or lock");quit(1);return
	print("NARU_V3_OVERLAY_TRANSACTION_PASS fixture; not visual approval")
	print("NARU_P2_ART_COVERAGE_PASS full and incomplete fixture; not art acceptance")
	quit(0)
