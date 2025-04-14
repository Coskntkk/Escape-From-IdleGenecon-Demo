extends Node2D

@onready var costLabel : Node2D = $CostLabel

func _ready():
	$Label.visible = false
	costLabel.visible = false

func _physics_process(_delta):
	$CostLabel/Label.text = str(Global.wood) + "/" + str(Global.farmerCost)
	$CostLabel/Label2.text = str(Global.coal) + "/" + str(Global.farmerCost)
	if (Global.wood < Global.farmerCost):
		$CostLabel/Label.modulate = Color(1,0,0,1)
	else: 
		$CostLabel/Label.modulate = Color(0,1,0,1)
	if (Global.coal < Global.farmerCost):
		$CostLabel/Label2.modulate = Color(1,0,0,1)
	else: 
		$CostLabel/Label2.modulate = Color(0,1,0,1)

func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		$Label.visible = true
		body.set_farmland(true)

		costLabel.visible = true

func _on_area_2d_body_exited(body):
	if (body.name == "Player"):
		$Label.visible = false
		body.set_farmland(false)

		costLabel.visible = false
