extends RefCounted
# Private visual-only runtime. No asset is bundled in the repository or public Web artifact.
const PATH="user://naru_private_art_v4.json"
const MAX_BYTES=16000000
# Independent R12 candidate; does not replace or mutate the approved 224-texture pack.
const R12_IRUKA=preload("res://assets/production/r12/iruka.svg")
var r12_actor_draws=0
var missing_actor_ids:Dictionary={}
var authored_actor_draws=0
var textures: Dictionary={}
var source_label="DEV • chưa nạp gói riêng"
var enabled=false
var error=""
var actor_draws=0
var effect_draws=0
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
	review_clip_hashes=staged_hashes
	clip_metadata=staged_clips
	enabled=true
	source_label="REVIEW RIÊNG • "+str(textures.size())+" ảnh"
	return true

func restore() -> void:
	for path in [PATH,PATH+".bak"]:
		if FileAccess.file_exists(path) and import_text(FileAccess.get_file_as_string(path),false):return

func texture(path: String) -> Texture2D:
	if not enabled:return null
	if path in ["characters/NIN-005.png","portraits/NIN-005.png"] and not textures.has(path):return R12_IRUKA
	return textures.get(path)

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
				for direction in ["se","sw","ne","nw"]:
					var key="animation/"+id+"/"+action+"_"+direction+".png"
					if not textures.has(key) or not clip_metadata.has(key):complete=false
			if complete:counts.complete_kits+=1
		elif name.begins_with("portraits/"):counts.portraits+=1
		elif name.begins_with("environment/buildings/"):counts.buildings+=1
		elif name.begins_with("vfx/"):counts.vfx_sheets+=1
	return counts

func reset_battle() -> void:
	last_pos={}
	motion={}
	actor_draws=0
	effect_draws=0
	portrait_draws=0
	review_move_draws=0
	clip_draws={}
	fallback_draws=0
	r12_actor_draws=0
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

func effects(field: Control,sim,project: Callable) -> void:
	for a in sim.actors:
		if a.hp<=0 or a.pending.is_empty():continue
		var skill=a.pending.skill
		var at: Vector2=project.call(a.pos)+Vector2(0,-32)
		var progress=1.0-float(a.cast_left)/maxf(0.05,float(skill.cast_s))
		if not sheet(field,"vfx/VFX-"+str(skill.skill_id)+"/charge.png",at,progress,82):
			field.draw_arc(at,15+6*sin(float(sim.ticks)*0.35),0,TAU,24,Color(0.45,0.78,1,0.65),2)
	var numbers=[]
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

func record_clip(path: String,frame: int) -> void:
	if not clip_draws.has(path):clip_draws[path]={"draws":0,"frames":{}}
	clip_draws[path].draws+=1
	clip_draws[path].frames[frame]=true
