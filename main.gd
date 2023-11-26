extends Node2D


func _ready():
	Utils.saveGame()
	Utils.loadGame()

func _on_quit_pressed():
	get_tree().quit()
	
func _on_credits_pressed():
	SceneTransition.change_scene("res://credits.tscn")

#func _on_main_menu_pressed():
#	get_tree().change_scene_to_file("res://main.tscn")


func _on_play_pressed():
	SceneTransition.change_scene("res://test_level.tscn")
