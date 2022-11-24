extends Node2D
onready var global_level_array = get_node("/root/LevelArray")

func _process(_delta):
	if Input.is_action_just_released("reset") and name == "title_root":
		global_level_array.level_1 = "res://scenes/level_1.tscn"
		global_level_array.level_2 = "res://scenes/level_2.tscn"
		global_level_array.level_3 = "res://scenes/level_3.tscn"
		global_level_array.level_4 = "res://scenes/level_4.tscn"
		global_level_array.level_5 = "res://scenes/level_5.tscn"
		global_level_array.level_6 = "res://scenes/level_6.tscn"
		global_level_array.level_7 = "res://scenes/level_7.tscn"
		global_level_array.level_8 = "res://scenes/level_8.tscn"
		global_level_array.level_9 = "res://scenes/level_9.tscn"
		global_level_array.level_10 = "res://scenes/level_10.tscn"
		global_level_array.level_array = [global_level_array.level_1,global_level_array.level_2,global_level_array.level_3,global_level_array.level_4,global_level_array.level_5,global_level_array.level_6,global_level_array.level_7,global_level_array.level_8,global_level_array.level_9,global_level_array.level_10]
		global_level_array.tracker_size = 10
		global_level_array.lives = 3
		randomize()
		global_level_array.level_tracker = global_level_array.level_array[floor(rand_range(0,global_level_array.tracker_size))]
		return get_tree().change_scene(global_level_array.level_tracker)
