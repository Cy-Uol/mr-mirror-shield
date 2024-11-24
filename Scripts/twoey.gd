extends Area2D

@onready var range = $Range
@onready var timer = $Timer
@onready var anim =$AnimatedSprite2D
@onready var mouth = $Marker2D
@export var Projectile : PackedScene

var is_in_range = false

func _physics_process(delta: float) -> void:
	
	pass

func _on_timer_timeout() -> void:
	if is_in_range:
		fire_projectile()
		timer.start()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		is_in_range = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		is_in_range = false
		anim.play("default")

func fire_projectile():
	var b = Projectile.instantiate()
	owner.add_child(b)
	b.global_transform = mouth.global_transform
	anim.play("attack")
	
