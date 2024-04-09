extends Node2D

func _ready():
	$gameOverTheme.play()
	
func _on_retry_pressed():
	get_tree().change_scene_to_file("res://level_3.tscn")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
