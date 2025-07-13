extends Control


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file(ui.curr_level)

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
