extends Node2D


func _on_area_2d_body_entered(_body):
	$Label.visible = true


func _on_area_2d_body_exited(_body):
	$Label.visible = false
