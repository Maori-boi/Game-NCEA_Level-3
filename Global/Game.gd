extends Node


var playerHP = 10
var Rubbish = 0

var hud_visible = false
var game_paused = false
var pause_menu

var main_menu_on = true

func clean():
	hud_visible = false
	game_paused = false
	pause_menu = false
	

func pause():
	if game_paused == false:
		game_paused = true
		pause_menu.visible = true
		get_tree().paused = true
	else:
		game_paused = false
		pause_menu.visible = false
		get_tree().paused = false
		
func resume():
	pause()
	
func restart():
	pause()
	Game.Rubbish = 0
	get_tree().reload_current_scene()
	
func load_main_menu():
	get_tree().change_scene_to_file("res://main.tscn")
	pause()
	hud_visible = false
	
func quit():
	get_tree().quit()
