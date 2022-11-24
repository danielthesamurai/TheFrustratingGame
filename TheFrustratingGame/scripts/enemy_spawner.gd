extends Node

var enemy = load("res://scenes/enemy_box.tscn")

func _ready():
	for i in 10:
		enemy_spawn()

func enemy_spawn():
	var enemy_instance = enemy.instance()
	get_parent().call_deferred("add_child",enemy_instance)
