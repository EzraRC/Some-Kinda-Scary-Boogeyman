extends Node2D

@export var level_num = 0

func _ready():
	print("level ready")

func _on_door_player_entered(level):
	get_tree().change_scene_to_file(level)

func _input(event):
	if event.is_action_pressed("reset_level"):
		get_tree().reload_current_scene.call_deferred()
