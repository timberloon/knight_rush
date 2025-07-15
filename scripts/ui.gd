extends Node

var score = 0
var curr_level:String
@onready var healthcounter: Label = $layout/health/healthcounter
@onready var coincounter: Label = $layout/coins/coincounter
@onready var layout: CanvasLayer = $layout

func update_health(health:int)->void:
	healthcounter.text = str(health)
	
func update_coins()->void:
	score += 1
	coincounter.text = str(score)

func dead()->void:
	score = 0
	coincounter.text = "0"

func toggle_visibiltiy()->void:
	layout.visible = !layout.visible
