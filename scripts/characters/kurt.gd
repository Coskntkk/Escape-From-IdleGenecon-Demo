extends Node2D


func _on_area_2d_body_entered(_body):
	if (
		Global.coal >= Global.maxLimit 
		and
		Global.wood >= Global.maxLimit
	):
		$Label2.visible = true
		Global.inWolf = true
	else:
		$Label.visible = true
	

func _on_area_2d_body_exited(_body):
	$Label.visible = false
	$Label2.visible = false
	Global.inWolf = false
