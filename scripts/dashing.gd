#dashing
extends state

@export var running_state:state
@export var jumping_state:state
@export var idle_state:state

@onready var dash_time: Timer = $dash_time
@onready var dash_cooldown: Timer = $dash_cooldown
@onready var dash_sound: AudioStreamPlayer = $dash_sound
var direction:int

func enter():
	direction = Input.get_axis("move_left", "move_right")
	if can_dash and one_dash:
		parent.velocity.x = direction * dash_speed
		if parent.velocity.x != 0:
			dash_sound.play()
		is_dashing = true
		can_dash = false
		dash_cooldown.start()
		dash_time.start()
	if parent.velocity.x != 0:super()
	

func process_physics(delta:float)->state:
	if is_dashing:
		return null
	
	direction = Input.get_axis("move_left", "move_right")
	if parent.velocity.x == 0: return idle_state
	if not is_dashing: return running_state
	return null

func process_input(event:InputEvent)->state:
	if Input.is_action_just_pressed("jump"):
		return jumping_state
	return null

func _on_dash_time_timeout() -> void:
	is_dashing = false
	can_dash = false
func _on_dash_cooldown_timeout() -> void:
	can_dash = true
