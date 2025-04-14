extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var newWal = Global.totems * 20
	$Bar/Progress.region_rect = Rect2(0, 0, newWal, 36)
	
	if (Global.totems >= 5):
		Global.unlockedCards += 1
		Global.totems -= 5
