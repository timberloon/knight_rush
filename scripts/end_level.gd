extends Node
@export var next_level:String

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		call_deferred("_change_scene")

func _change_scene() -> void:
	get_tree().change_scene_to_file(next_level)
	
