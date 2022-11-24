extends Node


var directions = []
var correct_sequence = ["L","D","U","R"]
signal maze_finished

func _ready():
	correct_sequence.shuffle()
	
func _process(_delta):
	if directions.size() > 4:
		directions = []
	if directions == correct_sequence:
		emit_signal("maze_finished")

func on_player_left():
	directions.append("L")

func on_player_right():
	directions.append("R")

func on_player_up():
	directions.append("U")
	
func on_player_down():
	directions.append("D")
