extends CharacterBody2D

@onready var AnimPlay : AnimationPlayer = $AnimationPlayer

const SPEED = 3
const JUMP_VELOCITY = -400.0

var farmer = preload("res://scenes/Characters/farmer.tscn")
var lumber = preload("res://scenes/Characters/lumber.tscn")
var miner = preload("res://scenes/Characters/miner.tscn")

var in_woodland : bool = false
var in_mineland : bool = false
var in_farmland : bool = false

func _physics_process(_delta):
	var inputVector : Vector2 = Input.get_vector("left","right","up","down")
	position.y += inputVector.y * SPEED
	position.x += inputVector.x * SPEED

	if (inputVector.x != 0 or inputVector.y != 0):
		AnimPlay.play("walk")
	else:
		AnimPlay.play("idle")
		
	if (inputVector.x < 0):
		$Sprite2D.flip_h = true
	else: 
		$Sprite2D.flip_h = false

	if (Input.is_action_just_pressed("interact")):
		if (in_woodland and Global.wheat >= Global.lumberCost):
			spawnMinion("lumber")
			Global.wheat -= Global.lumberCost
			Global.lumberCost = int(Global.lumberCost + (Global.lumberCost /  5))
		elif (in_mineland and Global.wheat >= Global.minerCost):
			spawnMinion("miner")
			Global.wheat -= Global.minerCost
			Global.minerCost = int(Global.minerCost + (Global.minerCost /5))
		elif (in_farmland and Global.coal >= Global.farmerCost and Global.wood >= Global.farmerCost):
			spawnMinion("farmer")
			Global.coal -= Global.farmerCost
			Global.wood -= Global.farmerCost
			Global.farmerCost = int(Global.farmerCost + (Global.farmerCost / 5))
	if (Input.is_action_just_pressed("interact") and Global.inWolf):
		$'../Kurt/Label2'.visible = false
		$'../FireSprite'.visible = true
		$'../FireSprite/AnimationPlayer'.play("burn")
	move_and_slide()

func spawnMinion(type):
	if (type == "farmer"):
		var newx = farmer.instantiate()
		get_parent().add_child(newx)
		newx.global_position = global_position
	elif (type == "lumber"):
		var newx = lumber.instantiate()
		get_parent().add_child(newx)
		newx.global_position = global_position
	elif (type == "miner"):
		var newx = miner.instantiate()
		get_parent().add_child(newx)
		newx.global_position = global_position

func set_woodland(val: bool):
	in_woodland = val

func set_mineland(val: bool):
	in_mineland = val

func set_farmland(val: bool):
	in_farmland = val


func _on_animation_player_animation_finished(anim_name):
	$'../FireSprite'.visible = false
	var tilemap : TileMap = $'../TileMap'
	tilemap.set_layer_enabled(0, false)
	tilemap.set_layer_enabled(1, true)
