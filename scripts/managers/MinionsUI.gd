extends Control

@onready var MinerLabel : Label = $Miner/Label
@onready var LumberLabel : Label = $Lumber/Label
@onready var FarmerLabel : Label = $Farmer/Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	MinerLabel.text = str(Global.miners) 
	LumberLabel.text = str(Global.lumberjacks)
	FarmerLabel.text = str(Global.farmers)
