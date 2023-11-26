extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if $Player/Player.health == 0 && $Player/Player.position.x < 1850:
		$Player/Player.position.x = 720 
		$Player/Player.position.y = 260 
		$Player/Player.health = 10
	elif $Player/Player.health == 0 && $Player/Player.position.x < 2500:
		$Player/Player.position.x = 1850
		$Player/Player.position.y = 150
		$Player/Player.health = 10
	elif $Player/Player.health == 0 && $Player/Player.position.x < 3600:
		$Player/Player.position.x = 2500
		$Player/Player.position.y = 225
		$Player/Player.health = 10
	elif $Player/Player.health == 0 && $Player/Player.position.x < 4000:
		$Player/Player.position.x = 3650
		$Player/Player.position.y = 308
		$Player/Player.health = 10
		
@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	$Player/Player.health -= 10


@warning_ignore("unused_parameter")
func _on_area_2d_2_body_entered(body):
	$Player/Player.health -= 10
