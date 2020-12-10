extends AnimatedSprite

func _on_Player_animate(velocity):
	var is_jumping = velocity.y < 0
	var is_walking_left = velocity.x < 0
	var is_walking_right = velocity.x > 0
	
	if is_jumping:
		play("jump")
	elif is_walking_left:
		play("walk_left")
	elif is_walking_right:
		play("walk_right")
	else:
		play("idle")
