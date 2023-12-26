extends RigidBody2D


func damage(pos):
	var top_left_body = RigidBody2D.new()
	var top_left_polygon = CollisionPolygon2D.new()
	var top_left_texture = $Polygon2D.duplicate()
	top_left_body.position = position + Vector2(-40, -40).rotated(rotation)
	top_left_body.linear_velocity = linear_velocity
	top_left_body.angular_velocity = angular_velocity
	top_left_body.add_child(top_left_texture)
	top_left_body.add_child(top_left_polygon)
	top_left_polygon.polygon = PackedVector2Array([
		Vector2(-40, -40),
		Vector2(-40, 40),
		Vector2(40, 40),
		Vector2(40, -40),
	])
	top_left_texture.polygon = PackedVector2Array([
		Vector2(0, 0),
		Vector2(80, 0),
		Vector2(80, 40),
		Vector2(80, 80),
		Vector2(0, 80),
	])
	top_left_texture.position = Vector2(-40, -40)
	top_left_body.rotation = rotation
	#var centroid1 = $Sprite2D.duplicate()
	#top_left_body.add_child(centroid1)
	
	var top_right_body = RigidBody2D.new()
	var top_right_polygon = CollisionPolygon2D.new()
	var top_right_texture = $Polygon2D.duplicate()
	top_right_body.position = position + Vector2(40, -40).rotated(rotation)
	top_right_body.linear_velocity = linear_velocity
	top_right_body.angular_velocity = angular_velocity
	top_right_polygon.polygon = PackedVector2Array([
		Vector2(-40, -40),
		Vector2(-40, 40),
		Vector2(40, 40),
		Vector2(40, -40),
	])
	top_right_texture.polygon = PackedVector2Array([
		Vector2(80, 0),
		Vector2(160, 0),
		Vector2(160, 40),
		Vector2(160, 80),
		Vector2(80, 80),
	])
	top_right_texture.position = Vector2(-120, -40)
	top_right_body.add_child(top_right_texture)
	top_right_body.add_child(top_right_polygon)
	top_right_body.rotation = rotation
	#var centroid2 = $Sprite2D.duplicate()
	#top_right_body.add_child(centroid2)
	
	var bottom_left_body = RigidBody2D.new()
	var bottom_left_polygon = CollisionPolygon2D.new()
	var bottom_left_texture = $Polygon2D.duplicate()
	bottom_left_body.position = position + Vector2(-40, 40).rotated(rotation)
	bottom_left_body.linear_velocity = linear_velocity
	bottom_left_body.angular_velocity = angular_velocity
	bottom_left_polygon.polygon = PackedVector2Array([
		Vector2(-40, -40),
		Vector2(-40, 40),
		Vector2(40, 40),
		Vector2(40, -40),
	])
	bottom_left_texture.polygon = PackedVector2Array([
		Vector2(0, 80),
		Vector2(80, 80),
		Vector2(80, 120),
		Vector2(80, 160),
		Vector2(0, 160),
	])
	bottom_left_texture.position = Vector2(-40, -120)
	bottom_left_body.add_child(bottom_left_texture)
	bottom_left_body.add_child(bottom_left_polygon)
	bottom_left_body.rotation = rotation
	#var centroid3 = $Sprite2D.duplicate()
	#bottom_left_body.add_child(centroid3)
	
	var bottom_right_body = RigidBody2D.new()
	var bottom_right_polygon = CollisionPolygon2D.new()
	var bottom_right_texture = $Polygon2D.duplicate()
	bottom_right_body.position = position + Vector2(40, 40).rotated(rotation)
	bottom_right_body.linear_velocity = linear_velocity
	bottom_right_body.angular_velocity = angular_velocity
	bottom_right_polygon.polygon = PackedVector2Array([
		Vector2(-40, -40),
		Vector2(-40, 40),
		Vector2(40, 40),
		Vector2(40, -40),
	])
	bottom_right_texture.polygon = PackedVector2Array([
		Vector2(80, 80),
		Vector2(160, 80),
		Vector2(160, 120),
		Vector2(160, 160),
		Vector2(80, 160),
	])
	bottom_right_texture.position = Vector2(-120, -120)
	bottom_right_body.add_child(bottom_right_texture)
	bottom_right_body.add_child(bottom_right_polygon)
	bottom_right_body.rotation = rotation
	#var centroid4 = $Sprite2D.duplicate()
	#bottom_right_body.add_child(centroid4)
	
	var world = get_parent()
	world.add_child(top_left_body)
	world.add_child(top_right_body)
	world.add_child(bottom_left_body)
	world.add_child(bottom_right_body)
	queue_free()
