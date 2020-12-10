extends Node2D

# PROPERTIES
const PATH_WIN_SCREEN = "res://src/ui/WinScreen.tscn"
const PATH_LOSE_SCREEN = "res://src/ui/LoseScreen.tscn"


# CUSTOM
func win_game():
	get_tree().change_scene(PATH_WIN_SCREEN)


func lose_game():
	get_tree().change_scene(PATH_LOSE_SCREEN)
