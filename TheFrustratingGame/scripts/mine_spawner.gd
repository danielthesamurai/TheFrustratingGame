extends Node

onready var mine = load("res://scenes/invisible_mine.tscn")
onready var root = get_node(".")

func _ready():
	for i in 10:
		add_mine()

	
func add_mine():
	randomize()
	var mine_instance = mine.instance()
	mine_instance.position.x = rand_range(100,700)
	mine_instance.position.y = rand_range(100,500)
	root.add_child(mine_instance)

