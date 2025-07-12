extends Area2D

@onready var pickupanimation: AnimationPlayer = $pickupanimation

func _on_body_entered(body: Node2D) -> void:
	pickupanimation.play("pickup")
	ui.update_coins()
