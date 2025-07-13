extends Node

var score = 0
var curr_level:String
@onready var healthcounter: Label = $CanvasLayer/health/healthcounter
@onready var coincounter: Label = $CanvasLayer/coins/coincounter

func update_health(health:int)->void:
	healthcounter.text = str(health)
	
func update_coins()->void:
	score += 1
	coincounter.text = str(score)

func dead()->void:
	score = 0
	coincounter.text = "0"
