extends CharacterBody2D

@onready var AnimPlay : AnimationPlayer = $AnimationPlayer
@onready var Forest = null
const SPEED = 25

func _ready():
	Forest =  $"../Forest"

func _physics_process(_delta):
	if (velocity.x != 0 or velocity.y != 0):
		AnimPlay.play("walk")
	else:
		AnimPlay.play("idle")

	#Unit vector pointing at the target position from the characters position
	var direction = global_position.direction_to(Forest.global_position)
	
	velocity = direction * SPEED
	move_and_slide()

func destroySelf():
	Global.lumberjacks += 1
	queue_free()
