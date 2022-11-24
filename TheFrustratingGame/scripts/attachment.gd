extends Node2D

onready var player = $player
onready var timer = $level_timer
onready var teleporter

func _ready():
	if name == "level_8_root":
		teleporter = $teleport_node
		connect_teleport_node_to_player("left","on_player_left")
		connect_teleport_node_to_player("right","on_player_right")
		connect_teleport_node_to_player("up","on_player_up")
		connect_teleport_node_to_player("down","on_player_down")

func _on_tutorial_prompt_reset_player():
	$player.position.x = rand_range(50,750)
	$player.position.y = rand_range(50,450)
	

func connect_teleport_node_to_player(dir,player_signal):
	return player.connect(dir,teleporter,player_signal)


func _on_teleport_node_maze_finished():
	if get_tree().get_nodes_in_group("coin").size() > 0:
		$coin.position.x = 400
		$coin.position.y = 300


func _on_hidden_bomb_ready():
	var coin_array = get_tree().get_nodes_in_group("coin")
	var bomb = randi()%coin_array.size()
	$bomb.position = coin_array[bomb].position
	coin_array[bomb].queue_free()
	


func _on_invisible_coin_ready():
	$coin.position.x = rand_range(50,750)
	$coin.position.y = rand_range(50,550)
	$coin.visible = false
