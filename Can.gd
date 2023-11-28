extends CharacterBody2D

var health = 10
var SPEED = 20
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

@onready var Explosive_sound : AudioStreamPlayer2D = $Explosive_sound
@onready var Hurt_sound : AudioStreamPlayer2D = $Hurt_sound

func _ready():
	get_node("AnimatedSprite2D").play("Idle")
func _physics_process(delta):
	# Gravity for Apple
	velocity.y += gravity * delta
	
	if chase == true:
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Run")
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
		
	else:
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Idle")
		velocity.x = 0
	move_and_slide()
	
	

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false

func _on_player_death_body_entered(body):
	if body.name == "Player" && Game.playerHP == 10:
		death()
	elif body.name == "Player" && Game.playerHP < 10:
		Game.playerHP += 2
		death()

func _on_player_collision_body_entered(body):
	if body.name == "Player":
		Game.playerHP -= 2
		Hurt_sound.play()
		death()
 
func death():
	Game.Rubbish += 1
	Utils.saveGame()
	chase = false
	get_node("AnimatedSprite2D").play("Death")
	Explosive_sound.play()
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()
