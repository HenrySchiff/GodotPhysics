extends CharacterBody2D

const JUMP_VELOCITY: int = 800
const SPEED: int = 300
const PUSH_FORCE: int = 80
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal bullet_trail(start, end)

func _process(_delta):
	$GunImage.look_at(get_global_mouse_position())

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_VELOCITY
		
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * PUSH_FORCE)
			
	if Input.is_action_just_pressed("shoot"):
		var start = $GunImage/MuzzlePoint.global_position
		var angle = start.angle_to_point(get_global_mouse_position())
		var end = Vector2.RIGHT.rotated(angle) * 5000 + start
		
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsRayQueryParameters2D.create(start, end)
		var result = space_state.intersect_ray(query)
		
		if result:
			end = result.position
			
			if result.collider.has_method("damage"):
				result.collider.damage(end)
			
		bullet_trail.emit(start, end)
