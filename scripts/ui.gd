extends Node

var score = 0
var curr_level:String
@onready var healthcounter: Label = $layout/health/healthcounter
@onready var coincounter: Label = $layout/coins/coincounter
@onready var layout: CanvasLayer = $layout

func update_health(health:int)->void:
	if health >= 0: healthcounter.text = str(health)
	else:
		healthcounter.text = str("0")
		score = 0

func update_coins()->void:
	score += 1
	coincounter.text = str(score)

func toggle_visibiltiy()->void:
	layout.visible = !layout.visible
