extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
const MAX_SPEED = 220.0
const ACCELERATION = 75.0
const FRICTION = 50.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer


func _physics_process(delta: float) -> void:
	if Global.dead == true:
		return
	if Input.is_action_just_pressed("menu"):
		Global.direction = -1
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() || !timer.is_stopped()):
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true


	if direction:
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)
		
	var was_on_floor = is_on_floor()
		
	move_and_slide()
	
	if was_on_floor && !is_on_floor():
		timer.start()		
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("default")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")


func _on_shield_body_entered(body: Node2D) -> void:
	pass


func _on_shield_area_entered(area: Area2D) -> void:
	if area.get_parent() is projectile_thing:
		area.get_parent().direction = 1
		area.get_parent().position += Vector2(1, 0)
		area.get_parent().flipped = true
		pass
