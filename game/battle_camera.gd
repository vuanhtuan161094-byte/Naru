extends RefCounted
# Horizontal oblique projection. World coordinates, collision and skill ranges are unchanged.
static func steps(view:Vector2,arena:Vector2) -> Vector2:
	var sx=maxf(1.0,(view.x-76.0)/(arena.x+arena.y*0.20))
	var sy=maxf(1.0,(view.y-118.0)/(arena.y+arena.x*0.12))
	return Vector2(sx,sy)

static func project(p:Vector2,view:Vector2,arena:Vector2) -> Vector2:
	var s=steps(view,arena)
	return Vector2(38.0+(p.x+(arena.y-p.y)*0.20)*s.x,92.0+(p.y+p.x*0.12)*s.y)

static func sprite_scale(view:Vector2,arena:Vector2) -> float:
	var s=steps(view,arena)
	return clampf(minf(s.x/60.0,s.y/31.0),0.38,1.0)
