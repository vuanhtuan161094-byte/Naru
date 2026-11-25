extends RefCounted
# Visual-only: reads real Combat state, never changes gameplay.
const ROOT = "res://art_private/"
var cache: Dictionary = {}
var sprite_draws: int = 0
var vfx_draws: int = 0
var tile_draws: int = 0
var has_plate: bool = false

func background(field: Control, forest: bool) -> void:
	var t := texture("environment/arena_960x540.png") if forest else null
	has_plate = t != null
	if has_plate:
		field.draw_texture_rect(t, Rect2(Vector2.ZERO,field.size),false,Color(0.8,0.8,0.8,1.0))

func texture(path: String) -> Texture2D:
	if not cache.has(path):
		cache[path] = load(ROOT + path) if ResourceLoader.exists(ROOT + path) else null
	return cache[path]

func tile(field: Control, p: Vector2, x: int, y: int) -> bool:
	var t := texture("environment/grass_%d.png" % ((x+y)%4))
	if t == null: return false
	field.draw_texture_rect(t, Rect2(p+Vector2(-38,0),Vector2(76,40)),false,Color(1,1,1,0.30) if has_plate else Color.WHITE)
	tile_draws += 1
	return true

func actor(field: Control, a: Dictionary, p: Vector2) -> bool:
	var t := texture("characters/%s.png" % str(a.id))
	if t == null: return false
	# Static three-quarter candidate; never mirror asymmetrical costume.
	var scale_factor: float = 0.85
	var anchor := Vector2(48,104)*scale_factor
	field.draw_texture_rect(t,Rect2(p-anchor,Vector2(96,112)*scale_factor),false)
	sprite_draws += 1
	return true

func effect(field: Control, skill_id: String, phase: String, p: Vector2, progress: float) -> void:
	var t := texture("vfx/VFX-%s/%s.png" % [skill_id,phase])
	if t == null: return
	var count: int = int(t.get_width()/128)
	if count < 1: return
	var idx: int = clampi(int(progress*count),0,count-1)
	var size := Vector2(96,96)
	field.draw_texture_rect_region(t,Rect2(p-size/2,size),Rect2(idx*128,0,128,128))
	vfx_draws += 1

func effects(field: Control, sim, iso: Callable) -> void:
	for a in sim.actors:
		if a.hp<=0 or a.pending.is_empty(): continue
		var skill: Dictionary = a.pending.skill
		var duration: float = maxf(0.05,float(skill.cast_s))
		effect(field,str(skill.skill_id),"charge",iso.call(a.pos)+Vector2(0,-35),1.0-float(a.cast_left)/duration)
	for pr in sim.projectiles:
		var source: Dictionary = sim.actor_by_uid(int(pr.source))
		var target: Dictionary = sim.actor_by_uid(int(pr.target))
		if source.is_empty() or target.is_empty(): continue
		var duration: float = maxf(0.05,source.pos.distance_to(target.pos)/maxf(0.01,float(pr.skill.projectile_speed_m_s)))
		var f: float = clampf(1.0-float(pr.remaining)/duration,0,1)
		var origin: Vector2 = iso.call(source.pos)
		var dest: Vector2 = iso.call(target.pos)
		effect(field,str(pr.skill.skill_id),"travel",origin.lerp(dest,f)+Vector2(0,-28),f)
	for ev in sim.art_events:
		var elapsed: float = float(sim.ticks-int(ev.tick))*0.05
		if elapsed<0 or elapsed>=0.96: continue
		var p: Vector2 = iso.call(ev.target_pos)
		# Release means effect resolution, not a confirmed damage hit.
		effect(field,str(ev.skill_id),"impact" if elapsed<0.48 else "residual",p+Vector2(0,-28),fmod(elapsed,0.48)/0.48)
