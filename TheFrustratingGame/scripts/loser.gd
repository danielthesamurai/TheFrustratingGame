extends Node2D

func _process(_delta):
	if Input.is_action_just_released("reset"):
		return get_tree().change_scene("res://scenes/title_screen.tscn")
