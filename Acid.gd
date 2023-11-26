@tool
extends Control

@export var speed:Vector3
var off:Vector3 = Vector3.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	off += speed*delta
	$"TextureRect2".texture.noise.offset = off
