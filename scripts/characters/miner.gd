extends CharacterBody2D

@onready var AnimPlay : AnimationPlayer = $AnimationPlayer
@onready var Mine = null
const SPEED = 25

func _ready():
	Mine =  $"../Mine"

func _physics_process(delta):
	if (velocity.x != 0 or velocity.y != 0):
		AnimPlay.play("walk")
	else:
		AnimPlay.play("idle")
	if (velocity.x):
		$Sprite2D.flip_h = true
	else: 
		$Sprite2D.flip_h = false

	#Unit vector pointing at the target position from the characters position
	var direction = global_position.direction_to(Mine.global_position)
	
	velocity = direction * SPEED
	move_and_slide()

func destroySelf():
	Global.miners += 1
	queue_free()
