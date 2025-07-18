#running
extends state

@export var idle_state:state
@export var jump_state:state
@export var dash_state:state

var direction:int

func enter()->void:
	super()
	
func process_input(event:InputEvent)->state:
	if Input.is_action_just_pressed("dash") and parent.velocity.x != 0:
		one_dash = true
		return dash_state
	if Input.is_action_pressed("jump"):
		parent.in_air = true
		return jump_state 
	return null 
	
func process_physics(delta:float)->state:
	direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		if direction<0:
			parent.animated_sprite.flip_h = true
		elif direction>0:
			parent.animated_sprite.flip_h = false
		parent.velocity.x = direction * SPEED
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, parent.decelaration)
	if parent.velocity.x == 0:
		return idle_state
	if parent.is_on_floor() and not parent.was_on_floor and Input.is_action_pressed("jump"):
		print("buffer jump")
		return jump_state
	parent.was_on_floor = parent.is_on_floor()
	return null
