extends RefCounted
# Private visual-only runtime. No asset is bundled in the repository or public Web artifact.
const PATH="user://naru_private_art_v4.json"
const MAX_BYTES=12000000
var textures: Dictionary={}
var source_label="DEV • chưa nạp gói riêng"
var enabled=false
var error=""
var actor_draws=0
var effect_draws=0
var portrait_draws=0
var last_pos: Dictionary={}
var motion: Dictionary={}

func hash_bytes(bytes: PackedByteArray) -> String:
	var h=HashingContext.new()
	h.start(HashingContext.HASH_SHA256)
	h.update(bytes)
	return h.finish().hex_encode()

func import_text(raw: String,persist: bool=true) -> bool:
	error=""
	if raw.length()>MAX_BYTES:
		error="Gói quá lớn"
		return false
	var pack=JSON.parse_string(raw)
	if not pack is Dictionary or int(pack.get("schema",0))!=1 or pack.get("status")!="REVIEW_ONLY" or not pack.get("assets") is Dictionary:
		error="Sai định dạng gói review"
		return false
	if pack.assets.size()==0 or pack.assets.size()>240:
		error="Số ảnh không hợp lệ"
		return false
	var staged={}
	var pixel_total=0
	for path in pack.assets:
		if not str(path).ends_with(".png") or ".." in str(path) or not str(path).get_slice("/",0) in ["characters","portraits","environment","animation","vfx"]:
			error="Đường dẫn ảnh không hợp lệ"
			return false
		var entry=pack.assets[path]
		if not entry is Dictionary or not entry.get("png") is String:
			error="Thiếu dữ liệu ảnh"
			return false
		var width=int(entry.get("width",0))
		var height=int(entry.get("height",0))
		if width<1 or height<1 or width>4096 or height>2048:
			error="Kích thước ảnh không hợp lệ"
			return false
		pixel_total+=width*height
		if pixel_total>18000000:
			error="Gói ảnh vượt giới hạn bộ nhớ"
			return false
		var bytes=Marshalls.base64_to_raw(entry.png)
		if bytes.size()<24 or hash_bytes(bytes)!=str(entry.get("sha256","")):
			error="SHA-256 không khớp: "+str(path)
			return false
		# PNG IHDR dimensions checked before decoding; no file extraction.
		var actual_w=int(bytes[16])*16777216+int(bytes[17])*65536+int(bytes[18])*256+int(bytes[19])
		var actual_h=int(bytes[20])*16777216+int(bytes[21])*65536+int(bytes[22])*256+int(bytes[23])
		if actual_w!=width or actual_h!=height:
			error="Header PNG sai: "+str(path)
			return false
		var img=Image.new()
		if img.load_png_from_buffer(bytes)!=OK or img.get_width()!=width or img.get_height()!=height:
			error="Không đọc được PNG: "+str(path)
			return false
		if str(path).begins_with("characters/") and (width!=96 or height!=112):
			error="Sprite sai cell 96×112"
			return false
		staged[path]=ImageTexture.create_from_image(img)
	if persist:
		var file=FileAccess.open(PATH+".tmp",FileAccess.WRITE)
		if file==null:
			error="Không ghi được gói cục bộ"
			return false
		file.store_string(raw)
		file.flush()
		file.close()
		if FileAccess.file_exists(PATH):
			if FileAccess.file_exists(PATH+".bak"):DirAccess.remove_absolute(PATH+".bak")
			if DirAccess.rename_absolute(PATH,PATH+".bak")!=OK:
				error="Không sao lưu được gói cũ"
				return false
		if DirAccess.rename_absolute(PATH+".tmp",PATH)!=OK:
			if FileAccess.file_exists(PATH+".bak"):DirAccess.rename_absolute(PATH+".bak",PATH)
			error="Không lưu được gói cục bộ"
			return false
	textures=staged
	enabled=true
	source_label="REVIEW RIÊNG • "+str(textures.size())+" ảnh"
	return true

func restore() -> void:
	for path in [PATH,PATH+".bak"]:
		if FileAccess.file_exists(path) and import_text(FileAccess.get_file_as_string(path),false):return

func texture(path: String) -> Texture2D:
	if not enabled:return null
	return textures.get(path)

func count_characters() -> int:
	var count=0
	for path in textures:
		if str(path).begins_with("characters/"):count+=1
	return count

func reset_battle() -> void:
	last_pos={}
	motion={}
	actor_draws=0
	effect_draws=0
	portrait_draws=0

func background(field: Control,environment: String) -> bool:
	var t=texture("environment/arena_open_r3.png")
	if environment=="forest":
		var forest=texture("environment/arena_960x540.png")
		if forest!=null:t=forest
	if t==null:
		field.draw_rect(Rect2(Vector2.ZERO,field.size),Color("#17282b"))
		return false
	field.draw_texture_rect(t,Rect2(Vector2.ZERO,field.size),false,Color(0.87,0.87,0.87))
	return true

func tile(field: Control,p: Vector2,q: float,x: int,y: int,plate: bool) -> bool:
	var t=texture("environment/grass_%d.png" % ((x+y)%4))
	if t==null:return false
	field.draw_texture_rect(t,Rect2(p+Vector2(-38,0)*q,Vector2(76,40)*q),false,Color(1,1,1,0.36) if plate else Color.WHITE)
	return true

func draw_actor(field: Control,a: Dictionary,p: Vector2,ticks: int,display_scale: float=1.0,state: Dictionary={}) -> float:
	var id=str(a.id)
	var t=texture("characters/"+id+".png")
	var prior: Vector2=last_pos.get(a.uid,p)
	if prior.distance_to(p)>0.25:
		motion[a.uid]={"right":p.x>prior.x,"until":ticks+4}
	last_pos[a.uid]=p
	if t==null:return 0.0
	var height=92.0*display_scale
	var scale_value=height/112.0
	var dest=Rect2(p-Vector2(48,104)*scale_value,Vector2(96,112)*scale_value)
	# One provisional authored rightward walk pilot, never mirror or fabricate missing clips.
	var moving=motion.get(a.uid,{})
	var walk=texture("animation/"+id+"/walk_screen_right.png")
	var action=str(state.get("action","Idle")).to_lower()
	var direction=str(state.get("direction","SE")).to_lower()
	var authored=texture("animation/"+id+"/"+action+"_"+direction+".png")
	if authored!=null and authored.get_height()==112 and authored.get_width()%96==0:
		var frame_count=maxi(1,authored.get_width()/96)
		var frame=posmod(floori(float(ticks)/2.0),frame_count)
		field.draw_texture_rect_region(authored,dest,Rect2(frame*96,0,96,112))
	elif walk!=null and bool(moving.get("right",false)) and int(moving.get("until",0))>=ticks and walk.get_width()==384 and walk.get_height()==112:
		var frame=posmod(floori(float(ticks)/2.0),4)
		field.draw_texture_rect_region(walk,dest,Rect2(frame*96,0,96,112))
	else:field.draw_texture_rect(t,dest,false)
	actor_draws+=1
	return 104.0*scale_value

func sheet(field: Control,path: String,p: Vector2,progress: float,size_value: float=96.0) -> bool:
	var t=texture(path)
	if t==null or t.get_height()!=128 or t.get_width()%128!=0:return false
	var count=floori(float(t.get_width())/128.0)
	var frame=clampi(floori(progress*count),0,count-1)
	field.draw_texture_rect_region(t,Rect2(p-Vector2.ONE*size_value/2,Vector2.ONE*size_value),Rect2(frame*128,0,128,128))
	effect_draws+=1
	return true

func effects(field: Control,sim,project: Callable) -> void:
	for a in sim.actors:
		if a.hp<=0 or a.pending.is_empty():continue
		var skill=a.pending.skill
		var at: Vector2=project.call(a.pos)+Vector2(0,-32)
		var progress=1.0-float(a.cast_left)/maxf(0.05,float(skill.cast_s))
		if not sheet(field,"vfx/VFX-"+str(skill.skill_id)+"/charge.png",at,progress,82):
			field.draw_arc(at,15+6*sin(float(sim.ticks)*0.35),0,TAU,24,Color(0.45,0.78,1,0.65),2)
	for event in sim.art_events:
		var elapsed=float(sim.ticks-int(event.tick))*0.05
		if elapsed<0 or elapsed>=0.8:continue
		var at: Vector2=project.call(event.pos)+Vector2(0,-28)
		var progress=elapsed/0.8
		if event.kind=="contact":
			var phase="impact" if elapsed<0.4 else "residual"
			sheet(field,"vfx/VFX-"+str(event.skill)+"/"+phase+".png",at,fmod(elapsed,0.4)/0.4,110)
		elif event.kind in ["damage","heal","summon"]:
			var family="hit" if event.kind=="damage" else "heal" if event.kind=="heal" else "smoke"
			if not sheet(field,"vfx/families/"+family+".png",at,progress,76):
				field.draw_arc(at,8+22*progress,0,TAU,24,Color(1,0.72,0.38,1-progress),2)
			if event.kind!="summon":
				var text_value=("+" if event.kind=="heal" else "-")+str(roundi(float(event.amount)))
				field.draw_string(ThemeDB.fallback_font,at+Vector2(-14,-28-25*progress),text_value,HORIZONTAL_ALIGNMENT_LEFT,-1,15,Color(0.56,1,0.63,1-progress*0.8) if event.kind=="heal" else Color(1,0.83,0.58,1-progress*0.8))
