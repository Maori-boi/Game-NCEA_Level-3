extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.pause_menu = $pause_menu
	Game.pause_menu.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#visible = Global.hud_visible
	if Input.is_action_just_pressed("Pause"):
		Game.pause()

func _on_pause_button_pressed():
	Game.pause()

func _on_resume_button_pressed():
	Game.resume()
	print(get_tree().paused)

func _on_restart_button_pressed():
	Game.restart()

func _on_main_menu_button_pressed():
	Game.load_main_menu()

func _on_quit_button_pressed():
	Game.quit()
