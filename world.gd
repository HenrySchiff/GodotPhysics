extends Node2D

var pixel_scene: PackedScene = preload("res://pixel.tscn")

func _ready():
	
	var offset = Vector2(400, 200)
	
	#for y in range(10):
		#for x in range(10):
			#var new_pixel = pixel_scene.instantiate()
			#var pixel_size = new_pixel.get_node("CollisionShape2D").shape.size
			#
			#new_pixel.position = Vector2(x, y) * pixel_size + offset
			#
			#$Pixels.add_child(new_pixel)


func _on_player_bullet_trail(start, end):
	$BulletTrail.visible = true
	$BulletTrail.points = PackedVector2Array([start, end])
	$BulletTrail/Timer.start()

func _on_timer_timeout():
	$BulletTrail.visible = false
