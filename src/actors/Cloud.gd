extends Node2D

# PROPERTIES
onready var Timer = $Sprite/Timer
onready var RayCast = $Sprite/RayCast2D
const PATH_LIGHTNING = "res://src/hazards/Lightning.tscn"
var timeout = false


# DEFAULTS
func _process(delta):
	if RayCast.is_colliding():
		fire()


# SIGNALS
func _on_Timer_timeout():
	timeout = false


# CUSTOM
func fire():
	if not timeout:
		var lightning_bolt = load(PATH_LIGHTNING).instance()
		RayCast.add_child(lightning_bolt)
		Timer.start()
		timeout = true
