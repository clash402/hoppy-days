extends Area2D

# PROPERTIES
onready var anim_player = $AnimationPlayer
var boost_multiplier = 1.5


# SIGNALS
func _on_body_entered(body):
	if body.has_method("boost"):
		anim_player.play("boost")
		body.boost(boost_multiplier)
