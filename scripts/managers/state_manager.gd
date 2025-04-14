extends Node2D

func _on_timer_timeout():
	# Coal
	var coalToGain : int = Global.miners * Global.coalModifier
	var coalNextVal : int = Global.coal + coalToGain
	Global.coal = coalNextVal
	# Wood
	var woodToGain : int = Global.lumberjacks * Global.woodModifier
	var woodNextVal : int = Global.wood + woodToGain
	Global.wood = woodNextVal
	# Wheat
	var wheatToGain : int = Global.farmers * Global.wheatModifier
	var wheatNextVal : int = Global.wheat + wheatToGain
	Global.wheat = wheatNextVal
