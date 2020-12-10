extends Node2D

# PROPERTIES
export var speed: int = 300

onready var Area2D = $Area2D

var damage = 1
var boost_multiplier = 0.3


# DEFAULTS
func _ready():
	set_new_position()


func _process(delta):
	move(delta)
	is_colliding()


# SIGNALS
func _on_screen_exited():
	queue_free()


# CUSTOM
func set_new_position():
	set_as_toplevel(true)
	global_position = get_parent().global_position


func move(delta):
	position.y += speed * delta


func is_colliding():
	var bodies = Area2D.get_overlapping_bodies()
	for body in bodies:
		queue_free()
		if body.name == "Player":
			if body.has_method("was_hurt"):
				body.was_hurt(damage)
				body.boost(boost_multiplier)

