extends Label


func _process(_delta):
	if Input.is_action_just_released("ui_down"):
		return get_tree().change_scene("res://scenes/Options.tscn")
