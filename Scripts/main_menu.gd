extends Control

@onready var tutorial_button = $Panel/Tutorial
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_down"):
		tutorial_button.grab_focus()
	if Input.is_action_just_pressed("menu"):
		_on_quit_pressed()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/cave.tscn")


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
