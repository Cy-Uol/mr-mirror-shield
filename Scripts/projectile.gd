extends Area2D
class_name projectile_thing
@onready var game_over = $/root/Tutorial/GameOverScreen
@onready var sprite = $Sprite2D
var speed = 100
var flipped = false
var direction = -1
func _physics_process(delta):
	if direction == 1 :
		sprite.flip_h = true
		flipped = true
	
	position += transform.x * speed * delta * direction
	

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Shield" && !flipped:
		sprite.flip_h = true
		flipped = true
		

	body.queue_free()
	queue_free()
