extends RefCounted
# Straight landscape 2.5D projection. X never contributes to screen Y, and Y never contributes to screen X. World combat unchanged.
static func steps(view:Vector2,arena:Vector2) -> Vector2:
	var sx=maxf(1.0,(view.x-76.0)/maxf(1.0,arena.x))
	var sy=maxf(1.0,(view.y-118.0)/maxf(1.0,arena.y))
	return Vector2(sx,sy)

static func project(p:Vector2,view:Vector2,arena:Vector2) -> Vector2:
	var s=steps(view,arena)
	return Vector2(38.0+p.x*s.x,92.0+p.y*s.y)

static func sprite_scale(view:Vector2,arena:Vector2) -> float:
	var s=steps(view,arena)
	return clampf(minf(s.x/60.0,s.y/31.0),0.38,1.0)
