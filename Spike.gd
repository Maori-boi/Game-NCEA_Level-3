extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.health == 0:
		$Player.position.x = 65
		$Player.position.y = 134
		$Player.health = 1


func _on_area_2d_body_entered(body):
	$Player.health -= 1
