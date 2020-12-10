extends Control

# PROPERTIES
const PATH_LEVEL_1 = "res://src/levels/Level1.tscn"


# SIGNALS
func _on_RestartButton_pressed():
	get_tree().change_scene(PATH_LEVEL_1)
