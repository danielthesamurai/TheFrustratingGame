extends Node

func _process(_delta):
	if Input.is_action_just_released("ui_accept"):
		OS.window_fullscreen = !OS.window_fullscreen
	if Input.is_action_just_released("ui_cancel"):
		get_tree().quit() 
