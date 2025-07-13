extends Node

func _on_start_pressed() -> void:
	ui.curr_level = "res://scenes/game.tscn"
	get_tree().change_scene_to_file("res://scenes/game.tscn")
