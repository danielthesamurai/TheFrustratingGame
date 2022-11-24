extends Label

var sizes = [Vector2(800,600),Vector2(1024,768),Vector2(1280,720),Vector2(1680,1050),Vector2(1920,1080)]
var current_size = 0
var tracker = false

func _ready():
	text = str(OS.window_size.x)+"x"+str(OS.window_size.y)
	var size_tracker = 0
	for x in sizes:
		if OS.window_size == x:
			current_size = size_tracker
		else:
			size_tracker += 1

func _process(_delta):
	if Input.is_action_just_released("v_toggle"):
		tracker = !tracker
	if tracker == false:
		if Input.is_action_just_released("ui_down"):
			OS.window_size = sizes[current_size]
		if Input.is_action_just_released("ui_right") and current_size < sizes.size()-1:
			current_size += 1
		if Input.is_action_just_released("ui_left") and current_size > 0:
			current_size -= 1
	if Input.is_action_just_released("ui_up"):
		var save_options = File.new()
		var vsync_option = OS.vsync_enabled
		var resolution = OS.window_size
		save_options.open("user://options.save",File.WRITE_READ)
		save_options.store_var(vsync_option)
		save_options.store_var(resolution)
		save_options.close()
		return get_tree().change_scene("res://scenes/title_screen.tscn")
	if OS.window_fullscreen == false:
		text = str(sizes[current_size].x)+"x"+str(sizes[current_size].y)
	else:
		text = str(OS.get_screen_size().x)+"x"+str(OS.get_screen_size().y)
