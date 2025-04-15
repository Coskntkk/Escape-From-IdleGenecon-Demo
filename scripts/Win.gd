extends Area2D

func _on_body_entered(body):
	if (body.name == "Player"):
		var win_scene = preload("res://scenes/win_screen.tscn").instantiate()
		get_tree().root.add_child(win_scene)
