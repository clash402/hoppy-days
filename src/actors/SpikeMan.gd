extends Node2D

# PROPERTIES
var damage = 1
var boost_multiplier = 1.5


# SIGNALS
func _on_body_entered(body):
	if body.has_method("was_hurt"):
		body.was_hurt(damage)
		body.boost(boost_multiplier)
