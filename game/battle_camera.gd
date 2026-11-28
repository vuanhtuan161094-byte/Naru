extends RefCounted
# Straight 2.5D camera: ground occupies lower 69%, horizon remains scenery.
static func ground_top(view:Vector2) -> float:
	return maxf(84.0,view.y*0.22)

static func steps(view:Vector2,arena:Vector2) -> Vector2:
	var sx=maxf(1.0,(view.x-116.0)/maxf(1.0,arena.x))
	var sy=maxf(1.0,(view.y-ground_top(view)-40.0)/maxf(1.0,arena.y))
	return Vector2(sx,sy)

static func project(p:Vector2,view:Vector2,arena:Vector2) -> Vector2:
	var s=steps(view,arena)
	return Vector2(58.0+p.x*s.x,ground_top(view)+p.y*s.y)

static func sprite_scale(view:Vector2,arena:Vector2) -> float:
	var s=steps(view,arena)
	return clampf(minf(s.x/64.0,s.y/31.0),0.42,0.95)

static func sprite_direction(v:Vector2,side:int,action:String="move") -> String:
	var right=v.x>0.05 or (absf(v.x)<=0.05 and side==0)
	if action.to_lower()=="move" and v.y < -absf(v.x)*1.3:return "NE" if right else "NW"
	return "SE" if right else "SW"

# Presentation-only bounded framing. World positions, collisions, and timing are untouched.
static func framing(view:Vector2,arena:Vector2,points:Array[Vector2]) -> Dictionary:
	var center=Vector2(view.x*0.5,(ground_top(view)+view.y-26.0)*0.5)
	if points.is_empty():return {"zoom":1.0,"shift":Vector2.ZERO}
	var lo=project(points[0],view,arena)
	var hi=lo
	for p in points:
		var s=project(p,view,arena)
		lo=lo.min(s)
		hi=hi.max(s)
	var extent=hi-lo
	var zoom=clampf(minf((view.x-170.0)/maxf(1.0,extent.x),(view.y-ground_top(view)-75.0)/maxf(1.0,extent.y)),1.0,1.38)
	# Leave nearly full battlefields in the original camera; zoom only small encounters.
	if points.size()>6:zoom=minf(zoom,1.16)
	var midpoint=(lo+hi)*0.5
	var shift=(center-midpoint)*zoom
	if zoom<=1.01:shift=Vector2.ZERO
	return {"zoom":zoom,"shift":shift}

static func project_framed(p:Vector2,view:Vector2,arena:Vector2,frame:Dictionary) -> Vector2:
	var center=Vector2(view.x*0.5,(ground_top(view)+view.y-26.0)*0.5)
	return center+(project(p,view,arena)-center)*float(frame.get("zoom",1.0))+Vector2(frame.get("shift",Vector2.ZERO))
