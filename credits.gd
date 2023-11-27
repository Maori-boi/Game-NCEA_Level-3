extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.saveGame()
	Utils.loadGame()
	Game.hud_visible = false





func _on_exit_pressed():
	SceneTransition.change_scene("res://main.tscn")


func _on_quit_pressed():
	get_tree().quit()
