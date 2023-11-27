extends Control


func _ready():
	Utils.saveGame()
	Utils.loadGame()
	Game.hud_visible = false

func _on_quit_pressed():
	get_tree().quit()
	
func _on_credits_pressed():
	SceneTransition.change_scene("res://credits.tscn")

func _on_play_pressed():
	SceneTransition.change_scene("res://test_level.tscn")
	Game.hud_visible = true
