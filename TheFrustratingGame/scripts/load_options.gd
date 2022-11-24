extends Node


func _ready():
	var options_file = File.new()
	if options_file.file_exists("user://options.save"):
		options_file.open("user://options.save",File.READ)
		OS.vsync_enabled = options_file.get_var()
		OS.window_size = options_file.get_var()
		options_file.close()
	else:
		pass
