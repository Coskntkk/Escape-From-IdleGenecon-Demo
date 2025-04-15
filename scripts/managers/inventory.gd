extends Control

@onready var CoalLabel : Label = $Coal/Label
@onready var WoodLabel : Label = $Wood/Label
@onready var WheatLabel : Label = $Wheat/Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	CoalLabel.text = str(Global.coal) + "/" + str(Global.maxLimit)
	if (Global.coal == Global.maxLimit):
		CoalLabel.modulate = Color(0,1,0,1)
	else:
		CoalLabel.modulate = Color(1,1,1,1)

	WoodLabel.text = str(Global.wood) + "/" + str(Global.maxLimit)
	if (Global.wood == Global.maxLimit):
		WoodLabel.modulate = Color(0,1,0,1)
	else: 
		WoodLabel.modulate = Color(1,1,1,1)

	WheatLabel.text = str(Global.wheat)
