extends CharacterBody2D
 
@export var speed : float = 200.0
@export var jump_velocity : float = -300.0
@export var double_jump_velocity : float = -150
 
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped : bool = false
var health = 10
var healing : int = 10
var portal_play = false
var max_jumps = 2
 
@onready var anim = get_node("AnimationPlayer")
@onready var Jump_sound : AudioStreamPlayer2D = $Jump_sound

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		has_double_jumped = false
	# Handle Jump.
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			# Normal Jump from floor
			velocity.y = jump_velocity
			anim.play("Jump")
			Jump_sound.play()

			
		elif not has_double_jumped:
			# Double Jump in air
			velocity.y += double_jump_velocity
			anim.play("Double_Jump")
			Jump_sound.play()
			
	# Get the input direction and handle the movement/deceleration.
	# Replaced UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
		get_node("CollisionShape2D_h_left").disabled = true
		get_node("CollisionShape2D_h_right").disabled = false
		get_node("Area2D/CollisionShape2D_h_left_2").disabled = true
		get_node("Area2D/CollisionShape2D_h_right_2").disabled = false
		get_node("Area2D2/CollisionShape2D_h_left_3").disabled = true
		get_node("Area2D2/CollisionShape2D2_h_right_3").disabled = false
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
		get_node("CollisionShape2D_h_left").disabled = false
		get_node("Area2D/CollisionShape2D_h_left_2").disabled = false
		get_node("Area2D2/CollisionShape2D_h_left_3").disabled = false
		get_node("CollisionShape2D_h_right").disabled = true
		get_node("Area2D/CollisionShape2D_h_right_2").disabled = true
		get_node("Area2D2/CollisionShape2D2_h_right_3").disabled = true

	if direction:
		velocity.x = direction * speed
		if velocity.y == 0:
			anim.play("Run")

	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if velocity.y == 0:
			anim.play("Idle")
			
	if velocity.y > 0:
		anim.play("Fall")
	move_and_slide()
	
	if Game.playerHP <= 0:
		Game.Rubbish -= Game.Rubbish
		queue_free()
		get_tree().reload_current_scene()
		
		
	if Game.playerHP <= 0:
		Game.playerHP += healing
		

func _on_area_2d_area_entered(area):
	if area.is_in_group("test_portal"):
		SceneTransition.change_scene("res://level_one.tscn")
	if area.is_in_group("portal"):
		SceneTransition.change_scene("res://level_two.tscn")
	if area.is_in_group("portal_two"):
		SceneTransition.change_scene("res://level_three.tscn")
	if area.is_in_group("portal_three"):
		position.x = 47
		position.y = 150
	if area.is_in_group("portal_four"):
		SceneTransition.change_scene("res://level_three_v_2.tscn")
	if area.is_in_group("portal_five"):
		SceneTransition.change_scene("res://game_over.tscn")
