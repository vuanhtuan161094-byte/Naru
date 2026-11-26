extends RefCounted
# Straight 2.5D camera: ground occupies lower 60%, horizon remains scenery.
static func ground_top(view:Vector2) -> float:
	return maxf(84.0,view.y*0.41)

static func steps(view:Vector2,arena:Vector2) -> Vector2:
	var sx=maxf(1.0,(view.x-116.0)/maxf(1.0,arena.x))
	var sy=maxf(1.0,(view.y-ground_top(view)-26.0)/maxf(1.0,arena.y))
	return Vector2(sx,sy)

static func project(p:Vector2,view:Vector2,arena:Vector2) -> Vector2:
	var s=steps(view,arena)
	return Vector2(58.0+p.x*s.x,ground_top(view)+p.y*s.y)

static func sprite_scale(view:Vector2,arena:Vector2) -> float:
	var s=steps(view,arena)
	return clampf(minf(s.x/64.0,s.y/31.0),0.42,0.95)
