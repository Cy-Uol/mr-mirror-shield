extends CharacterBody2D
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var anim = $AnimatedSprite2D
var direction = -1
var SPEED = 100.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	if ray_cast_right.is_colliding():
		var collider = ray_cast_right.get_collider()
		if collider.name != "Player":
			direction = 1
		
	if ray_cast_left.is_colliding():
		var collider = ray_cast_left.get_collider()
		if collider.name != "Player":
			direction = -1
		
	if direction > 0:
		anim.flip_h = false
	elif direction < 0:
		anim.flip_h = true
		
	#velocity.x = move_toward(velocity.x, -direction * SPEED, delta)
	position.x += -direction * SPEED * delta
	anim.play("default")
