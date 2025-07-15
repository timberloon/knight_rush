extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("slipping")
		body.decelaration = 3

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("not slipping")
		body.decelaration = body.default_decel
