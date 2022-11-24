extends Node
var timer_var = 30
onready var global_level_array = get_node("/root/LevelArray")

func _ready():
	global_level_array.level_array.erase(global_level_array.level_tracker)
	global_level_array.tracker_size -= 1
	timer_var = 30

func _process(delta):
	$CanvasLayer/lives_text.text = "Lives: " + str(global_level_array.lives)
	timer_var -= 1 * delta
	$CanvasLayer/Label.text = str(floor(timer_var))
	if timer_var <= 0:
		if global_level_array.lives <= 0:
			return get_tree().change_scene("res://scenes/loser.tscn")
		if get_parent().get_tree().get_nodes_in_group("coin").size() > 0:
			global_level_array.lives -= 1
			randomize()
			global_level_array.level_tracker = global_level_array.level_array[floor(rand_range(0,global_level_array.tracker_size))]
			return get_tree().change_scene(global_level_array.level_tracker)
	if get_tree().get_nodes_in_group("coin").size() == 0:
		if global_level_array.level_array.size() > 0:
			randomize()
			global_level_array.level_tracker = global_level_array.level_array[floor(rand_range(0,global_level_array.tracker_size))]
			return get_tree().change_scene(global_level_array.level_tracker)
		else:
			return get_tree().change_scene("res://scenes/winner.tscn")

func on_global_wall_signal():
	timer_var -= 5

func _on_bomb_explode():
	timer_var -= 30
