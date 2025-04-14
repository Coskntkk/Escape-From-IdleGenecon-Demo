extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	var my_random_number = rng.randi_range(0, 3)
	$Sprite2D.frame = my_random_number


func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		Global.totems += 2
		queue_free()
