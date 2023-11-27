extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.saveGame()
	Utils.loadGame()


func _on_quit_pressed():
	get_tree().quit()

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
