extends Node2D


func _on_area_2d_body_entered_farmer(body):
	if(body.name != "Player"):
		body.destroySelf()


func _on_area_2d_body_entered_lumber(body):
	if(body.name != "Player"):
		body.destroySelf()


func _on_area_2d_body_entered_miner(body):
	if(body.name != "Player"):
		body.destroySelf()
