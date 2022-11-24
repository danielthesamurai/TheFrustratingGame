extends Label

var tracker = false

func _ready():
	if OS.vsync_enabled == true:
		text = "On"
	else:
		text = "Off"

func _process(_delta):
	if Input.is_action_just_released("v_toggle"):
		tracker = !tracker
	if tracker == true:
		if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
			OS.vsync_enabled = !OS.vsync_enabled
		if OS.vsync_enabled == true:
			text = "On"
		else:
			text = "Off"
