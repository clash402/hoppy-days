extends Node2D

# SIGNALS
func _on_body_entered(body):
	get_tree().call_group("Level", "win_game")
