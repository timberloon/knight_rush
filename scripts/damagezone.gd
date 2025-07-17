extends Area2D
@onready var damage_sound: AudioStreamPlayer2D = $damage_sound
@onready var death_timer: Timer = $death_timer
@onready var cooldown: Timer = $cooldown
var playr:Node2D

var in_cooldown = false
@export var damage:int

func _on_body_entered(body: Node2D) -> void:
	playr = body
	if not in_cooldown:
		take_damage()
		if body.health <= 0:
			die()

func _on_death_timer_timeout() -> void:
		Engine.time_scale = 1
		playr.dead = false
		get_tree().change_scene_to_file("res://scenes/you_died.tscn")

func _on_cooldown_timeout() -> void:
	in_cooldown = false
	
func take_damage()->void:
	playr.taking_damage = true
	playr.animated_sprite.play("damage")
	playr.health -= damage
	damage_sound.play()
	in_cooldown = true
	cooldown.start()

func die()->void:
	playr.dead = true
	damage_sound.play()
	playr.animated_sprite.play("death")
	playr.velocity.y = -200.0
	ui.toggle_visibiltiy()
	Engine.time_scale = 0.5
	death_timer.start()
