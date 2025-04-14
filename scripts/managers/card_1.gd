extends Node2D

@onready var Spr : Sprite2D = $Sprite2D
@onready var unlocked : bool = false
@onready var Lbl : Label = $Label

@export var num : int

func _process(_delta):
	if (!unlocked):
		if (Global.unlockedCards >= num):
			unlocked = true
			$Lock.visible = false

func _on_area_2d_mouse_entered():
	if (unlocked): 
		Spr.scale *= 1.33
		Lbl.visible = true

func _on_area_2d_mouse_exited():
	if (unlocked): 
		Spr.scale /= 1.33
		Lbl.visible = false

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and unlocked:
		print(num)
		if (num == 1):
			Global.wheatModifier = Global.wheatModifier * 2
		elif (num == 2):
			Global.coalModifier = Global.coalModifier * 2
		queue_free()
