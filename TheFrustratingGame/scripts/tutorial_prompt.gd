extends Node

onready var global_level_array = get_node("/root/LevelArray")
var input_array = ["ui_left","ui_right","ui_up","ui_down"]
var array_store = 0
signal reset_player

func _process(_delta):
	if $CanvasLayer/Label.visible == true:
		randomize()
		if Input.is_action_just_released(input_array[array_store]):
			emit_signal("reset_player")
			$CanvasLayer/ColorRect.visible = !$CanvasLayer/ColorRect.visible
			$CanvasLayer/Label.visible = !$CanvasLayer/Label.visible
			$CanvasLayer/tutorial_timer.start()
			

func _on_tutorial_timer_timeout():
	$CanvasLayer/ColorRect.visible = !$CanvasLayer/ColorRect.visible
	$CanvasLayer/Label.visible = !$CanvasLayer/Label.visible
	array_store = floor(rand_range(0,4))
	random_text(array_store)

func random_text(random_input):
	if random_input == 0:
		$CanvasLayer/Label.text = "press left"
	elif random_input == 1:
		$CanvasLayer/Label.text = "press right"
	elif random_input == 2:
		$CanvasLayer/Label.text = "press up"
	elif random_input == 3:
		$CanvasLayer/Label.text = "press down"
