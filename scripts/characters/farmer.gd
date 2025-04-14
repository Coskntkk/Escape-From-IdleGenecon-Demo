extends CharacterBody2D

@onready var AnimPlay : AnimationPlayer = $AnimationPlayer
@onready var Farm = null
const SPEED = 25

func _ready():
	Farm =  $"../Farm"
	pass

func _physics_process(_delta):
	if (velocity.x != 0 or velocity.y != 0):
		AnimPlay.play("walk")
	else:
		AnimPlay.play("idle")

	#Unit vector pointing at the target position from the characters position
	var direction = global_position.direction_to(Farm.global_position)
	
	velocity = direction * SPEED
	move_and_slide()

func destroySelf():
	Global.farmers += 1
	queue_free()
