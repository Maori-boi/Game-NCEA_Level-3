extends Node2D

#@onready var pause_menu = $Pause_menu
#var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if $Player/Player.health == 0 && $Player/Player.position.x < 2000:
		$Player/Player.position.x = 750
		$Player/Player.position.y = 305
		$Player/Player.health = 10
	elif $Player/Player.health == 0 && $Player/Player.position.x < 4000:
		$Player/Player.position.x = 2700
		$Player/Player.position.y = 305
		$Player/Player.health = 10
		
	if Input.is_action_just_pressed("Pause"):
		pass
		
#func pauseMenu():
#	if paused:
#		pause_menu.hide()
#		Engine.time_scale = 1
#	else:
#		pause_menu.show()
#		Engine.time_scale = 0
#		
#	paused = !paused

@warning_ignore("unused_parameter")
func _on_spike_one_body_entered(body):
	$Player/Player.health -= 10 

@warning_ignore("unused_parameter")
func _on_spike_two_body_entered(body):
	$Player/Player.health -= 10
