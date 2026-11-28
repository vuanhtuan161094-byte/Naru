extends RefCounted
# Base public art pack plus independently validated optional character overlays. VFX and protected art remain untouched.
const PATH="user://naru_private_art_v4.json"
const MAX_BYTES=16000000
# Independent R12 candidate; does not replace or mutate the approved 224-texture pack.
const R12_IRUKA=preload("res://assets/production/r12/iruka.svg")
# Static-first production: only fills missing identities; existing art and clips win.
const STATIC_ROSTER=preload("res://assets/production/r14/static_roster.svg")
const VILLAGE_BUILDINGS=preload("res://assets/production/r15/buildings.svg")
const VILLAGE_GROUND=preload("res://assets/production/r15/village_ground.svg")
var village_building_cache:Dictionary={}
func village_building_texture(id:String) -> Texture2D:
	if not id.begins_with("BLD-") or id.length()!=7 or not id.right(3).is_valid_int():return null
	var n=int(id.right(3))
	if n<1 or n>30:return null
	if not village_building_cache.has(id):
		var cell=AtlasTexture.new()
		cell.atlas=VILLAGE_BUILDINGS
		cell.region=Rect2(((n-1)%10)*160,floori(float(n-1)/10.0)*180,160,180)
		cell.filter_clip=true
		village_building_cache[id]=cell
	return village_building_cache[id]

const STATIC_EXISTING=[1,2,3,4,5,16,41,42,43,60,68,70,93]
var static_roster_cache:Dictionary={}
var static_roster_draws=0

func static_roster_texture(id:String) -> Texture2D:
	if not id.begins_with("NIN-") or id.length()!=7 or not id.right(3).is_valid_int():return null
	var n=int(id.right(3))
	if n<1 or n>144 or n in STATIC_EXISTING:return null
	if not static_roster_cache.has(id):
		var cell=AtlasTexture.new()
		cell.atlas=STATIC_ROSTER
		cell.region=Rect2(((n-1)%12)*96,floori(float(n-1)/12.0)*112,96,112)
		cell.filter_clip=true
		static_roster_cache[id]=cell
	return static_roster_cache[id]

var r12_actor_draws=0
var missing_actor_ids:Dictionary={}
var authored_actor_draws=0
var d2_clips:Dictionary={}
var senki_review=false
var senki_fx:Dictionary={}
var d2_draws:Dictionary={}
var d2_action_draws:Dictionary={}
func load_d2_pack(path:String)->bool:
	if OS.has_feature("web") or not FileAccess.file_exists(path):return false
	var f=FileAccess.open(path,FileAccess.READ)
	if f==null or f.get_length()>48000000:return false
	var doc=JSON.parse_string(f.get_as_text())
	if not doc is Dictionary or not doc.get("status","") in ["LOCAL_DEVOLUTION_REVIEW","LOCAL_SENKI_REVIEW"] or int(doc.get("schema",0))!=1 or not doc.get("characters",{}) is Dictionary:return false
	var staged:Dictionary={}
	for id in doc.characters:
		var record=doc.characters[id]
		if not record is Dictionary or record.get("direction","")!="screen_right" or not record.get("clips",{}) is Dictionary:continue
		var clips:Dictionary={}
		for action in record.clips:
			if not action in ["idle","move","attack","cast","hit","fall"]:continue
			var c=record.clips[action]
			if not c is Dictionary:continue
			var count=int(c.get("frames",0))
			var ms=int(c.get("frame_ms",0))
			if count<1 or count>42 or ms<20 or ms>2000:continue
			var bytes=Marshalls.base64_to_raw(str(c.get("png","")))
			if bytes.size()<24 or hash_bytes(bytes)!=str(c.get("sha256","")):continue
			var img=Image.new()
			if img.load_png_from_buffer(bytes)!=OK or img.get_width()!=96*count or img.get_height()!=112:continue
			clips[action]={"texture":ImageTexture.create_from_image(img),"frames":count,"ms":ms}
		if clips.has("idle"):staged[id]=clips
	d2_clips=staged
	senki_review=doc.get("status","")=="LOCAL_SENKI_REVIEW"
	senki_fx.clear()
	if senki_review and doc.get("vfx",{}) is Dictionary:
		for family in doc.vfx:
			var c=doc.vfx[family]
			if not c is Dictionary:continue
			var count=int(c.get("frames",0))
			if count<1 or count>32:continue
			var bytes=Marshalls.base64_to_raw(str(c.get("png","")))
			if bytes.size()<24 or hash_bytes(bytes)!=str(c.get("sha256","")):continue
			var img=Image.new()
			if img.load_png_from_buffer(bytes)!=OK or img.get_width()!=128*count or img.get_height()!=128:continue
			senki_fx[family]=ImageTexture.create_from_image(img)
		print("NARU_R3_PACK_READY ",d2_clips.keys()," FX ",senki_fx.keys())
	print("NARU_D2_PACK_READY ",d2_clips.keys())
	return not d2_clips.is_empty()

func draw_d2(field:Control,a:Dictionary,id:String,p:Vector2,ticks:int,display_scale:float,state:Dictionary)->float:
	# Explicit opt-in only. No invented opposite/back-facing frames, no base sprite replacing a form.
	if not d2_clips.has(id) or not a.get("active_form",{}).is_empty():return 0.0
	if str(state.get("direction","")).to_lower()!="se":return 0.0
	var action=str(state.get("action","Idle")).to_lower()
	var clips:Dictionary=d2_clips[id]
	if not clips.has(action):return 0.0
	var c:Dictionary=clips[action]
	var age=maxi(0,ticks-int(state.get("started_tick",0)))*50
	var frame_count=int(c.frames)
	var frame=floori(float(age)/float(c.ms))
	frame=posmod(frame,frame_count) if action in ["idle","move"] else mini(frame,frame_count-1)
	var dest=Rect2(p-Vector2(48,104)*display_scale,Vector2(96,112)*display_scale)
	field.draw_texture_rect_region(c.texture,dest,Rect2(frame*96,0,96,112))
	if not d2_draws.has(id):print("NARU_R3_ACTOR_DRAW " if senki_review else "NARU_D2_ACTOR_DRAW ",id)
	d2_draws[id]=int(d2_draws.get(id,0))+1
	var key=id+"/"+action
	if not d2_action_draws.has(key):print("NARU_R3_ACTION_DRAW " if senki_review else "NARU_D2_ACTION_DRAW ",key)
	d2_action_draws[key]=int(d2_action_draws.get(key,0))+1
	actor_draws+=1
	return 104.0*display_scale

var character_overlays:Dictionary={}
var textures: Dictionary={}
var source_label="DEV • chưa nạp gói riêng"
var enabled=false
var error=""
var actor_draws=0
var effect_draws=0
var external_fx_draws=0
var external_fx_family_draws:Dictionary={}
var external_fx_cache:Dictionary={}
var external_skill_families:Dictionary={}

var portrait_draws=0
var last_pos: Dictionary={}
var motion: Dictionary={}
var review_move_r3: Dictionary={}
var review_clip_hashes: Dictionary={}
var review_move_draws=0
var clip_metadata: Dictionary={}
var clip_draws: Dictionary={}
var fallback_draws=0
var directional_pose_draws=0
var clone_draws=0
var summon_draws=0
const CLONE_SKILLS=["NIN-001-S1","NIN-041-S1","NIN-060-S3","NIN-070-S2"]
const SUMMON_ART={"NIN-004-S2":preload("res://assets/production/summon/ninken.svg"),"NIN-043-S6":preload("res://assets/production/summon/katsuyu.svg")}

func hash_bytes(bytes: PackedByteArray) -> String:
	var h=HashingContext.new()
	h.start(HashingContext.HASH_SHA256)
	h.update(bytes)
	return h.finish().hex_encode()

func import_text(raw: String,persist: bool=true) -> bool:
	error=""
	load_move_contract()
	var staged_hashes={}
	var staged_clips={}
	if raw.length()>MAX_BYTES:
		error="Gói quá lớn"
		return false
	var pack=JSON.parse_string(raw)
	var supplied=pack_clip_metadata(raw)
	if not pack is Dictionary or int(pack.get("schema",0))!=1 or pack.get("status")!="REVIEW_ONLY" or not pack.get("assets") is Dictionary:
		error="Sai định dạng gói review"
		return false
	if pack.assets.size()==0 or pack.assets.size()>360:
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
		if str(path).begins_with("animation/") and supplied.has(path):
			var meta=supplied[path]
			if not valid_clip(meta,width,height,str(entry.sha256)):
				error="Sai contract animation: "+str(path)
				return false
			staged_clips[path]=meta
		staged[path]=ImageTexture.create_from_image(img)
		staged_hashes[path]=str(entry.sha256)
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
	character_overlays.clear()
	review_clip_hashes=staged_hashes
	clip_metadata=staged_clips
	enabled=true
	source_label="REVIEW RIÊNG • "+str(textures.size())+" ảnh"
	return true

# Apply a complete V3 character kit atomically, without resetting the existing pack.
# Only exact per-character paths may be replaced. No VFX, environment or protected IDs.
func import_character_overlay(raw:String,id:String) -> bool:
	error=""
	if not enabled or id in ["NIN-004","NIN-060","NIN-068","NIN-093"] or not id.begins_with("NIN-") or id.length()!=7 or not id.right(3).is_valid_int() or int(id.right(3))<1 or int(id.right(3))>144:
		error="ID overlay không hợp lệ hoặc đang khóa"
		return false
	if raw.length()>4000000:
		error="Gói nhân vật quá lớn"
		return false
	var pack=JSON.parse_string(raw)
	if not pack is Dictionary or pack.get("character_id","")!=id or pack.has("hold") or not pack.get("assets",{}) is Dictionary or not pack.get("clips",{}) is Dictionary:
		error="Gói nhân vật chưa được hoàn thiện"
		return false
	var required={}
	var counts={"idle":6,"move":8,"attack":6,"cast":6,"hit":4,"fall":4}
	for action in counts:
		var dirs=["se","sw","ne","nw"] if action=="move" else ["se","sw"]
		for direction in dirs:
			required["animation/"+id+"/"+action+"_"+direction+".png"]=counts[action]
	var static_path="characters/"+id+".png"
	if pack.assets.size()!=15 or pack.clips.size()!=14 or not pack.assets.has(static_path):
		error="Cần đúng 14 clip, 84 cel và 1 sprite tĩnh"
		return false
	for path in required:
		if not pack.assets.has(path) or not pack.clips.has(path) or not pack.clips[path] is Dictionary or not pack.clips[path].get("frames",[]) is Array or pack.clips[path].get("frames",[]).size()!=required[path]:
			error="Thiếu clip "+path
			return false
	var staged:Variant=get_script().new()
	if not staged.import_text(raw,false):
		error=staged.error
		return false
	for path in staged.textures:
		if path!=static_path and not required.has(path):
			error="Đường dẫn ngoài phạm vi nhân vật"
			return false
	for path in staged.textures:
		textures[path]=staged.textures[path]
		review_clip_hashes[path]=staged.review_clip_hashes[path]
	for path in staged.clip_metadata:clip_metadata[path]=staged.clip_metadata[path]
	character_overlays[id]=true
	source_label="MỸ THUẬT TÍCH HỢP • "+str(textures.size())+" ảnh"
	return true

func overlay_path(id:String) -> String:
	return "user://naru_overlay_"+id+".json" if id in ["NIN-001","NIN-002"] else ""

func save_overlay(raw:String,id:String) -> bool:
	var path=overlay_path(id)
	if path.is_empty() or not character_overlays.has(id):return false
	var file=FileAccess.open(path+".tmp",FileAccess.WRITE)
	if file==null:return false
	file.store_string(raw)
	file.flush()
	file.close()
	if FileAccess.file_exists(path):
		if FileAccess.file_exists(path+".bak"):DirAccess.remove_absolute(path+".bak")
		if DirAccess.rename_absolute(path,path+".bak")!=OK:return false
	if DirAccess.rename_absolute(path+".tmp",path)!=OK:
		if FileAccess.file_exists(path+".bak"):DirAccess.rename_absolute(path+".bak",path)
		return false
	return true

func restore_overlays() -> void:
	if not enabled:return
	for id in ["NIN-001","NIN-002"]:
		var path=overlay_path(id)
		for candidate in [path,path+".bak"]:
			if FileAccess.file_exists(candidate) and import_character_overlay(FileAccess.get_file_as_string(candidate),id):break
	error=""

func restore() -> void:
	for path in [PATH,PATH+".bak"]:
		if FileAccess.file_exists(path) and import_text(FileAccess.get_file_as_string(path),false):return

func texture(path: String) -> Texture2D:
	if not enabled:return null
	if path=="environment/village_ground_r15.png":return VILLAGE_GROUND
	if textures.has(path):return textures[path]
	if path in ["characters/NIN-005.png","portraits/NIN-005.png"]:return R12_IRUKA
	if path.begins_with("characters/") or path.begins_with("portraits/"):
		var id=path.get_file().get_basename()
		if path.begins_with("portraits/") and textures.has("characters/"+id+".png"):return textures["characters/"+id+".png"]
		return static_roster_texture(id)
	return null

func count_characters() -> int:
	var count=0
	for path in textures:
		if str(path).begins_with("characters/"):count+=1
	return count

# Exact direction/action coverage; a static sprite or legacy walk is not a completed kit.
func product_coverage() -> Dictionary:
	var counts={"characters":0,"portraits":0,"buildings":0,"clips":clip_metadata.size(),"complete_kits":0,"vfx_sheets":0}
	for path in textures:
		var name=str(path)
		if name.begins_with("characters/"):
			counts.characters+=1
			var id=name.get_file().get_basename()
			var complete=true
			for action in ["idle","move","attack","cast","hit","fall"]:
				var directions=["se","sw","ne","nw"] if action=="move" else ["se","sw"]
				for direction in directions:
					var key="animation/"+id+"/"+action+"_"+direction+".png"
					if not textures.has(key) or not clip_metadata.has(key):complete=false
			if complete:counts.complete_kits+=1
		elif name.begins_with("portraits/"):counts.portraits+=1
		elif name.begins_with("environment/buildings/"):counts.buildings+=1
		elif name.begins_with("vfx/"):counts.vfx_sheets+=1
	# Do not inflate imported/authored coverage or claim full animation.
	counts["static_candidates"]=131
	counts["renderable_ninjas"]=0
	counts["renderable_portraits"]=0
	if enabled:
		for n in range(1,145):
			var id="NIN-%03d"%n
			if texture("characters/"+id+".png")!=null:counts.renderable_ninjas+=1
			if texture("portraits/"+id+".png")!=null:counts.renderable_portraits+=1
	return counts

func reset_battle() -> void:
	d2_draws.clear()
	d2_action_draws.clear()
	last_pos={}
	motion={}
	actor_draws=0
	effect_draws=0
	portrait_draws=0
	review_move_draws=0
	clip_draws={}
	fallback_draws=0
	r12_actor_draws=0
	static_roster_draws=0
	authored_actor_draws=0
	missing_actor_ids.clear()
	directional_pose_draws=0
	clone_draws=0
	summon_draws=0

func background(field: Control,environment: String) -> bool:
	var t=texture("environment/arena_open_r3.png")
	if environment=="forest":
		var forest=texture("environment/arena_960x540.png")
		if forest!=null:t=forest
	if t==null:
		field.draw_rect(Rect2(Vector2.ZERO,field.size),Color("#17282b"))
		return false
	# Preserve the entire panorama; enlarge the walkable ground band instead of
	# placing feet on the scenery or zooming the entire scene.
	var horizon=0.45*float(t.get_height())
	var top=preload("res://game/battle_camera.gd").ground_top(field.size)
	field.draw_texture_rect_region(t,Rect2(0,0,field.size.x,top),Rect2(0,0,t.get_width(),horizon),Color(0.93,0.93,0.93))
	field.draw_texture_rect_region(t,Rect2(0,top,field.size.x,field.size.y-top),Rect2(0,horizon,t.get_width(),t.get_height()-horizon),Color(0.93,0.93,0.93))
	return true

func tile(field: Control,p: Vector2,q: float,x: int,y: int,plate: bool) -> bool:
	var t=texture("environment/grass_%d.png" % ((x+y)%4))
	if t==null:return false
	field.draw_texture_rect(t,Rect2(p+Vector2(-38,0)*q,Vector2(76,40)*q),false,Color(1,1,1,0.36) if plate else Color.WHITE)
	return true

func presentation_id(a:Dictionary,owner:Dictionary={}) -> String:
	if bool(a.get("summon",false)) and str(a.get("summon_skill","")) in CLONE_SKILLS and not owner.is_empty():
		return str(owner.id)
	return str(a.id)

func pose_path(id:String,direction:String) -> String:
	var exact="animation/"+id+"/idle_"+direction+".png"
	if texture(exact)!=null:return exact
	var front="sw" if direction in ["nw","sw"] else "se"
	var alternate="animation/"+id+"/idle_"+front+".png"
	return alternate if texture(alternate)!=null else ""


# R15 optional source-frame review adapter. Only original right-facing frames; no synthetic rear direction.
var shinobi_candidates:Dictionary={}
var shinobi_draws:Dictionary={}
func load_shinobi_pack(path:String)->bool:
	if OS.has_feature("web") or not FileAccess.file_exists(path):return false
	var f=FileAccess.open(path,FileAccess.READ)
	if f==null or f.get_length()>64000000:return false
	var doc=JSON.parse_string(f.get_as_text())
	if not doc is Dictionary or doc.get("status","")!="SHINOBI_R15_REVIEW_ONLY" or not doc.get("characters",{}) is Dictionary:return false
	var staged:Dictionary={}
	for id in doc.characters:
		if not id in ["NIN-041","NIN-042","NIN-043","NIN-004"]:continue
		var item:Dictionary=doc.characters[id]
		var clips:Dictionary={}
		for action in item.get("clips",{}):
			var c:Dictionary=item.clips[action]
			var bytes=Marshalls.base64_to_raw(str(c.get("png","")))
			if bytes.size()<24 or hash_bytes(bytes)!=str(c.get("sha256","")):continue
			var im=Image.new()
			if im.load_png_from_buffer(bytes)!=OK or im.get_width()>4096 or im.get_height()>4096:continue
			var rects:Array=c.get("frames",[])
			if rects.is_empty() or rects.size()>300:continue
			var good=true
			for r in rects:
				if not r is Array or r.size()!=7:good=false;break
				if int(r[0])<0 or int(r[1])<0 or int(r[2])<=0 or int(r[3])<=0 or int(r[0])+int(r[2])>im.get_width() or int(r[1])+int(r[3])>im.get_height() or int(r[6])<10:good=false;break
			if not good:continue
			clips[action]={"texture":ImageTexture.create_from_image(im),"frames":rects}
		if clips.has("idle"):staged[id]={"clips":clips,"scale":clampf(float(item.get("scale",1.0)),0.1,2.0),"name":str(item.get("name",""))}
	shinobi_candidates=staged
	shinobi_draws.clear()
	print("NARU_R15_PACK_READY ",shinobi_candidates.keys())
	return shinobi_candidates.size()==4

func draw_shinobi(field:Control,a:Dictionary,id:String,p:Vector2,ticks:int,display_scale:float,state:Dictionary)->float:
	if not shinobi_candidates.has(id) or id!=str(a.id):return 0.0
	if str(state.get("direction","")).to_lower()!="se":return 0.0
	var action=str(state.get("action","idle")).to_lower()
	var item:Dictionary=shinobi_candidates[id]
	if not item.clips.has(action):return 0.0
	var c:Dictionary=item.clips[action]
	var frames:Array=c.frames
	var total=0
	for fr in frames:total+=int(fr[6])
	var age=maxi(0,ticks-int(state.get("started_tick",0)))*50
	age=posmod(age,maxi(1,total)) if action=="idle" else mini(age,maxi(0,total-1))
	var index=0
	for fr in frames:
		if age<int(fr[6]):break
		age-=int(fr[6])
		index+=1
	var r:Array=frames[mini(index,frames.size()-1)]
	var s=float(item.scale)*display_scale
	var dims=Vector2(float(r[2]),float(r[3]))
	var pivot=Vector2(float(r[4])*dims.x,float(r[5])*dims.y)
	field.draw_texture_rect_region(c.texture,Rect2(p-pivot*s,dims*s),Rect2(float(r[0]),float(r[1]),dims.x,dims.y))
	var key=id+"/"+action
	if not shinobi_draws.has(key):print("NARU_R15_ACTOR_DRAW ",key," candidate=",item.name)
	shinobi_draws[key]=int(shinobi_draws.get(key,0))+1
	actor_draws+=1
	return 104.0*display_scale

func draw_actor(field: Control,a: Dictionary,p: Vector2,ticks: int,display_scale: float=1.0,state: Dictionary={}) -> float:
	var id=str(state.get("render_id",a.id))
	if bool(a.get("summon",false)) and SUMMON_ART.has(str(a.get("summon_skill",""))):
		var prop:Texture2D=SUMMON_ART[str(a.summon_skill)]
		var w=76.0*display_scale
		var h=w*float(prop.get_height())/float(prop.get_width())
		field.draw_texture_rect(prop,Rect2(p-Vector2(w*0.5,h),Vector2(w,h)),false)
		summon_draws+=1
		actor_draws+=1
		return h
	if id!=str(a.id):clone_draws+=1
	var shinobi_height=draw_shinobi(field,a,id,p,ticks,display_scale,state)
	if shinobi_height>0:return shinobi_height
	var d2_height=draw_d2(field,a,id,p,ticks,display_scale,state)
	if d2_height>0:return d2_height
	var t=texture("characters/"+id+".png")
	var prior: Vector2=last_pos.get(a.uid,p)
	if prior.distance_to(p)>0.25:
		motion[a.uid]={"right":p.x>prior.x,"until":ticks+4}
	last_pos[a.uid]=p
	var action=str(state.get("action","Idle")).to_lower()
	var direction=str(state.get("direction","SE")).to_lower()
	var clip_path="animation/"+id+"/"+action+"_"+direction+".png"
	var authored=texture(clip_path)
	var pose=texture(pose_path(id,direction))
	var r3=review_move_r3.get(id,{})
	var r3_texture: Texture2D=null
	if action=="move" and direction in ["se","ne"] and not r3.is_empty() and review_clip_hashes.get(r3.path,"")==r3.sha256:r3_texture=texture(r3.path)
	if t==null and authored==null and r3_texture==null and pose==null:
		fallback_draws+=1
		missing_actor_ids[id]=true
		return 0.0
	if id=="NIN-005" and t==R12_IRUKA:r12_actor_draws+=1
	var height=112.0*display_scale
	var scale_value=height/112.0
	var dest=Rect2(p-Vector2(48,104)*scale_value,Vector2(96,112)*scale_value)
	# One provisional authored rightward walk pilot, never mirror or fabricate missing clips.
	var moving=motion.get(a.uid,{})
	var walk=texture("animation/"+id+"/walk_screen_right.png")
	if authored==null and r3_texture!=null and r3_texture.get_width()==768 and r3_texture.get_height()==112:
		var frame=frame_at(r3.frames,maxi(0,ticks-int(state.get("started_tick",0)))*50,true)
		field.draw_texture_rect_region(r3_texture,dest,Rect2(frame*96,0,96,112))
		review_move_draws+=1
		record_clip(r3.path,frame)
		authored_actor_draws+=1
	elif authored!=null and authored.get_height()==112 and authored.get_width()%96==0:
		var frame_count=maxi(1,authored.get_width()/96)
		var age=maxi(0,ticks-int(state.get("started_tick",0)))*50
		var frame=posmod(floori(float(age)/100.0),frame_count) if action in ["idle","move"] else mini(frame_count-1,floori(float(age)/100.0))
		var meta=clip_metadata.get(clip_path,{})
		if not meta.is_empty():frame=frame_at(meta.frames,age,action in ["idle","move"])
		field.draw_texture_rect_region(authored,dest,Rect2(frame*96,0,96,112))
		record_clip(clip_path,frame)
		authored_actor_draws+=1
	elif action=="move" and walk!=null and bool(moving.get("right",false)) and int(moving.get("until",0))>=ticks and walk.get_width()==384 and walk.get_height()==112:
		var frame=posmod(floori(float(ticks)/2.0),4)
		field.draw_texture_rect_region(walk,dest,Rect2(frame*96,0,96,112))
		authored_actor_draws+=1
	elif pose!=null and pose.get_height()==112 and pose.get_width()%96==0:
		# Honest static authored directional pose when the requested action is missing.
		field.draw_texture_rect_region(pose,dest,Rect2(0,0,96,112))
		directional_pose_draws+=1
		fallback_draws+=1
	elif t!=null:
		field.draw_texture_rect(t,dest,false)
		if static_roster_cache.has(id) and t==static_roster_cache[id]:static_roster_draws+=1
		fallback_draws+=1
	else:
		fallback_draws+=1
		return 0.0
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

# Optional normalized source assets; no gameplay changes and no replacement of approved skill art.
func external_sheet(field:Control,family:String,p:Vector2,progress:float,size_value:float)->bool:
	if not enabled or family.is_empty():return false
	if senki_review and senki_fx.has(family):
		var fx:Texture2D=senki_fx[family]
		var n=floori(float(fx.get_width())/128.0)
		var j=clampi(floori(progress*n),0,n-1)
		field.draw_texture_rect_region(fx,Rect2(p-Vector2.ONE*size_value/2,Vector2.ONE*size_value),Rect2(j*128,0,128,128))
		if not external_fx_family_draws.has("senki/"+family):print("NARU_R3_VFX_DRAW ",family)
		external_fx_family_draws["senki/"+family]=int(external_fx_family_draws.get("senki/"+family,0))+1
		effect_draws+=1
		return true
	if not external_fx_cache.has(family):
		var path="res://assets/external_review/vfx/"+family+".png"
		var candidate:Texture2D=null
		if ResourceLoader.exists(path):candidate=load(path) as Texture2D
		external_fx_cache[family]=candidate
	var t=external_fx_cache[family] as Texture2D
	if t==null or t.get_height()!=128 or t.get_width()%128!=0:return false
	var count=floori(float(t.get_width())/128.0)
	var frame=clampi(floori(progress*count),0,count-1)
	field.draw_texture_rect_region(t,Rect2(p-Vector2.ONE*size_value/2,Vector2.ONE*size_value),Rect2(frame*128,0,128,128))
	external_fx_draws+=1
	effect_draws+=1
	if external_fx_draws==1:print("NARU_EXTERNAL_VFX_FIRST_DRAW ",family)
	if not external_fx_family_draws.has(family):print("NARU_EXTERNAL_FX_RUNTIME_FAMILY ",family)
	external_fx_family_draws[family]=int(external_fx_family_draws.get(family,0))+1
	return true

func external_family(skill_id:String)->String:
	if external_skill_families.is_empty():
		var data=JSON.parse_string(FileAccess.get_file_as_string("res://data/skill-p2/vfx_families.json"))
		if data is Array:
			for item in data:
				for id in item.get("skills",[]):external_skill_families[str(id)]=str(item.id)
		external_skill_families["_loaded"]=true
	var family=str(external_skill_families.get(skill_id,""))
	var aliases={"melee":"hit","smash":"ground_smash","fireball":"fire_impact","fire_dragon":"fire_impact","fire":"fire_impact","lightning_lance":"lightning","lightning_dash":"lightning","lightning_needle":"lightning","kirin":"lightning_strike","water_dragon":"water_wave","clone":"smoke","rasengan":"chakra","rasengan_big":"chakra","rasenshuriken":"wind_impact","earth_wall":"earth","blackfire":"black_flame","air":"wind","beguile":"curse","genjutsu":"curse","mind":"curse","eye":"mark","ocular":"mark","kamui":"space","raijin":"space","raijin_mark":"mark","space_barrier":"barrier","susanoo_shield":"shield","susanoo_sword":"sword","byakugo":"heal","byakugou":"heal","healing":"heal","slug":"summon","katsuyu":"summon","ninken":"summon","dog":"summon","toad":"summon","chakra_cloak":"chakra","seal":"seal","wood":"wood","ice":"ice","needle":"hit","arrow":"hit","kunai":"hit","weapon":"hit","wire":"hit","chain":"hit","thread":"hit","bone":"earth","iron":"earth","clay":"explosion","bijuu_bomb":"explosion","ink":"smoke","ash":"smoke","mist":"steam","dust":"sand","laser":"beam","orb":"chakra","roll":"hit","lotus":"kick","gate":"haste","reflect":"shield","team":"cleanse","paper":"wind_impact","lightning_aura":"lightning_aura","blacklight":"shadow","black_flame":"black_flame","lightning":"lightning","palm":"palm","kick":"kick","scythe":"scythe","curse":"curse","heal":"heal"}
	return str(aliases.get(family,family))

func external_travel_family(skill_id:String)->String:
	var family=external_family(skill_id)
	var travel={"fire_impact":"fire_travel","lightning":"lightning_travel","lightning_strike":"lightning_travel","water":"water_travel","water_wave":"water_travel","chakra":"chakra_travel","wind":"wind_travel","wind_impact":"wind_travel","beam":"beam","ice":"needle"}
	return str(travel.get(family,""))

func effects(field: Control,sim,project: Callable) -> void:
	for a in sim.actors:
		if a.hp<=0 or a.pending.is_empty():continue
		var skill=a.pending.skill
		var at: Vector2=project.call(a.pos)+Vector2(0,-32)
		var progress=1.0-float(a.cast_left)/maxf(0.05,float(skill.cast_s))
		if not sheet(field,"vfx/VFX-"+str(skill.skill_id)+"/charge.png",at,progress,82) and not external_sheet(field,"charge",at,progress,82):
			field.draw_arc(at,15+6*sin(float(sim.ticks)*0.35),0,TAU,24,Color(0.45,0.78,1,0.65),2)
	var numbers=[]
	for event in sim.art_events:
		var elapsed=float(sim.ticks-int(event.tick))*0.05
		if elapsed<0 or elapsed>=0.8:continue
		var at: Vector2=project.call(event.pos)+Vector2(0,-28)
		var progress=elapsed/0.8
		if event.kind=="contact":
			var phase="impact" if elapsed<0.4 else "residual"
			if not sheet(field,"vfx/VFX-"+str(event.skill)+"/"+phase+".png",at,fmod(elapsed,0.4)/0.4,110) and phase=="impact":
				external_sheet(field,external_family(str(event.skill)),at,elapsed/0.4,110)
		elif event.kind in ["damage","heal","summon"]:
			var family="hit" if event.kind=="damage" else "heal" if event.kind=="heal" else "smoke"
			if not sheet(field,"vfx/families/"+family+".png",at,progress,76) and not external_sheet(field,family,at,progress,76):
				field.draw_arc(at,8+22*progress,0,TAU,24,Color(1,0.72,0.38,1-progress),2)
			if event.kind!="summon" and elapsed<0.55:
				numbers.append({"at":at+Vector2(-14,-28-25*progress),"kind":event.kind,"amount":float(event.amount),"age":elapsed})
	# Presentation only: keep the largest actual nearby hit readable. Full events
	# remain in combat and contribution logs; no damage numbers are fabricated.
	numbers.sort_custom(func(a,b):return a.amount>b.amount)
	var used:Array[Vector2]=[]
	for n in numbers:
		if used.size()>=8:break
		var point=Vector2(n.at)
		if used.any(func(p):return absf(p.x-point.x)<55 and absf(p.y-point.y)<24):continue
		used.append(point)
		var text_value=("+" if n.kind=="heal" else "-")+str(roundi(n.amount))
		var alpha=clampf(1.0-maxf(0.0,float(n.age)-0.33)*3.0,0.35,1.0)
		field.draw_string_outline(ThemeDB.fallback_font,point,text_value,HORIZONTAL_ALIGNMENT_LEFT,-1,18,4,Color(0.08,0.10,0.10,alpha))
		field.draw_string(ThemeDB.fallback_font,point,text_value,HORIZONTAL_ALIGNMENT_LEFT,-1,18,Color(0.56,1,0.63,alpha) if n.kind=="heal" else Color(1,0.83,0.58,alpha))

func load_move_contract() -> void:
	if not review_move_r3.is_empty():return
	var path="res://data/art-review/move-r3-contract.json"
	if not FileAccess.file_exists(path):return
	var record=JSON.parse_string(FileAccess.get_file_as_string(path))
	if not record is Dictionary:return
	for clip in record.get("clips",[]):
		if clip.get("owner_visual_approved",false) and clip.status=="REVIEW_ONLY" and clip.frames.size()==8 and valid_anchor(clip.anchor) and valid_clip(clip,768,112,str(clip.sha256)):review_move_r3[clip.id]=clip

func valid_anchor(anchor: Variant) -> bool:
	return anchor is Array and anchor.size()==2 and (anchor[0] is float or anchor[0] is int) and (anchor[1] is float or anchor[1] is int) and float(anchor[0])==48.0 and float(anchor[1])==104.0

func pack_clip_metadata(raw: String) -> Dictionary:
	var p=JSON.parse_string(raw)
	if not p is Dictionary or not p.get("clips",{}) is Dictionary:return {}
	return p.get("clips",{})

func valid_clip(meta: Variant,width: int,height: int,sha: String) -> bool:
	if not meta is Dictionary or not valid_anchor(meta.get("anchor",[])) or str(meta.get("sha256",""))!=sha:return false
	if height!=112 or width%96!=0 or not meta.get("frames",[]) is Array:return false
	var frames=meta.frames
	if frames.is_empty() or frames.size()!=width/96:return false
	for i in range(frames.size()):
		var r=frames[i]
		var rect=r.get("rect",[])
		if not rect is Array or rect.size()!=4:return false
		if float(rect[0])!=float(i*96) or float(rect[1])!=0.0 or float(rect[2])!=96.0 or float(rect[3])!=112.0:return false
		if float(r.get("duration_ms",0))<20.0 or float(r.get("duration_ms",0))>2000.0:return false
	return true

func frame_at(frames: Array,age_ms: int,looping: bool) -> int:
	var total=0
	for r in frames:total+=int(r.duration_ms)
	if total<=0:return 0
	var age=posmod(age_ms,total) if looping else clampi(age_ms,0,total-1)
	for i in range(frames.size()):
		age-=int(frames[i].duration_ms)
		if age<0:return i
	return frames.size()-1

func character_clip_draws(id:String) -> int:
	var count=0
	for path in clip_draws:
		if str(path).begins_with("animation/"+id+"/"):count+=int(clip_draws[path].draws)
	return count

func record_clip(path: String,frame: int) -> void:
	if not clip_draws.has(path):clip_draws[path]={"draws":0,"frames":{}}
	clip_draws[path].draws+=1
	clip_draws[path].frames[frame]=true
