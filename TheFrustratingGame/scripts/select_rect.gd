extends ColorRect

onready var window_label = get_parent().get_node("window_label")
onready var vsync_label = get_parent().get_node("vsync_toggle")
var tracker = false

func _process(_delta):
	if tracker == false:
		rect_position = window_label.rect_position
	else:
		rect_position = vsync_label.rect_position
	if Input.is_action_just_released("v_toggle"):
		tracker = !tracker
