extends Area2D

@onready var timer = $Timer
@onready var game_over = $/root/Cave/GameOverScreen

func _on_body_entered(body: Node2D) -> void:
	if body.name != "TileMap":
		if body.get_node("CollisionShape2D") and body.name != "Slime":
			Engine.time_scale = 0.5
			body.get_node("CollisionShape2D").queue_free()
			game_over.game_over_start()
			Global.dead = true
			timer.start()
	else:
		self.hide()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	game_over.game_over_end()
	get_tree().reload_current_scene()
	
