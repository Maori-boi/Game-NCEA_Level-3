extends Node2D

func _input(event : InputEvent):
	if(event.is_action_pressed("Pause")):
		var current_value : bool = get_tree().paused
		get_tree().paused = !current_value
