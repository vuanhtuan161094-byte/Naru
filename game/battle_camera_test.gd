extends SceneTree
const Camera=preload("res://game/battle_camera.gd")
func _initialize() -> void:
	for view in [Vector2(1244,510),Vector2(1244,620),Vector2(900,330)]:
		for arena in [Vector2(14,10),Vector2(12,8),Vector2(18,12),Vector2(30,20)]:
			var left=Camera.project(Vector2(1,arena.y/2),view,arena)
			var right=Camera.project(Vector2(arena.x-1,arena.y/2),view,arena)
			if right.x-left.x<view.x*0.55 or not is_equal_approx(right.y,left.y):
				push_error("BATTLE_LAYOUT_FAIL horizontal separation");quit(1);return
			# Equal world X must retain exactly equal screen X across depth.
			for x in [1.0,arena.x/2.0,arena.x-1.0]:
				var back=Camera.project(Vector2(x,1),view,arena)
				var front=Camera.project(Vector2(x,arena.y-1),view,arena)
				if not is_equal_approx(back.x,front.x) or front.y<=back.y:
					push_error("BATTLE_LAYOUT_FAIL straight depth axis");quit(1);return
			for p in [Vector2.ZERO,Vector2(arena.x,0),arena,Vector2(0,arena.y)]:
				var pos=Camera.project(p,view,arena)
				if not Rect2(Vector2.ZERO,view).has_point(pos) or pos.y<Camera.ground_top(view):
					push_error("BATTLE_LAYOUT_FAIL out of bounds");quit(1);return
	print("NARU_BATTLE_LAYOUT_PASS 12 map/viewport combinations; zero shear on both axes")
	quit(0)
