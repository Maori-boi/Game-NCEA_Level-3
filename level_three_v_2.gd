extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player/Player.health == 0 && $Player/Player.position.x < 2600:
		$Player/Player.position.x = 50
		$Player/Player.position.y = 514
		$Player/Player.health = 10
	elif $Player/Player.health == 0 && $Player/Player.position.x < 4300:
		$Player/Player.position.x = 2700
		$Player/Player.position.y = 400
		$Player/Player.health = 10
	elif $Player/Player.health == 0 && $Player/Player.position.x < 5000:
		$Player/Player.position.x = 4500
		$Player/Player.position.y = 200
		$Player/Player.health = 10

func _on_area_2d_body_entered(body):
	$Player/Player.health -= 10


func _on_area_2d_2_body_entered(body):
	$Player/Player.health -= 10


func _on_area_2d_3_body_entered(body):
	$Player/Player.health -= 10
