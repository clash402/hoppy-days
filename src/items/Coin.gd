extends Node2D

# PROPERTIES
onready var AnimPlayer = $AnimationPlayer
onready var DisappearSFX = $DisappearSFX

var taken = false
var value = 1


# SIGNALS
func _on_body_entered(body):
	if not taken:
		taken = true
		if body.has_method("did_collect_coin"):
			body.did_collect_coin(value)
			AnimPlayer.play("disappear")
			DisappearSFX.play()


# CUSTOM
func disappear():
	queue_free()
