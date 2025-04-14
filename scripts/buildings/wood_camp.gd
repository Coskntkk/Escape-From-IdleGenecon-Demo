extends Node2D

@onready var costLabel : Node2D = $CostLabel

func _ready():
	$Label.visible = false
	costLabel.visible = false

func _physics_process(_delta):
	$CostLabel/Label.text = str(Global.wheat) + "/" + str(Global.lumberCost)
	if (Global.wheat < Global.lumberCost):
		$CostLabel/Label.modulate = Color(1,0,0,1)
	else: 
		$CostLabel/Label.modulate = Color(0,1,0,1)

func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		$Label.visible = true
		body.set_woodland(true)
		
		costLabel.visible = true

func _on_area_2d_body_exited(body):
	if (body.name == "Player"):
		$Label.visible = false
		body.set_woodland(false)

		costLabel.visible = false
