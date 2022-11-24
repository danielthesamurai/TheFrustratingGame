extends KinematicBody2D

var player_vector = Vector2()
var player_speed = 500
var player_brakes_speed = 500
var player_speed_limit = 200
var control_array = ["ui_up","ui_down","ui_left","ui_right"]
var control_var_1 = ""
var control_var_2 = ""
var control_var_3 = ""
var control_var_4 = ""
var warp_bool = false
signal up
signal down
signal left
signal right

func _ready():
	randomize_controls()
	$time_lost.visible = false


func _process(delta):
	if Input.is_action_pressed(control_var_1) and player_vector.y >= -player_speed_limit:
		player_vector.y -= player_speed * delta
	elif Input.is_action_pressed(control_var_2) and player_vector.y <= player_speed_limit:
		player_vector.y += player_speed * delta
	else:
		if player_vector.y < 0:
			player_vector.y += player_brakes_speed * delta
			if player_vector.y > 0:
				player_vector.y = 0
		if player_vector.y > 0:
			player_vector.y -= player_brakes_speed * delta
			if player_vector.y < 0:
				player_vector.y = 0
	if warp_bool == true:
		warp_player()
	
	if Input.is_action_pressed(control_var_3) and player_vector.x >= -player_speed_limit:
		player_vector.x -= player_speed * delta
	elif Input.is_action_pressed(control_var_4) and player_vector.x <= player_speed_limit:
		player_vector.x += player_speed * delta
	else:
		if player_vector.x < 0:
			player_vector.x += player_brakes_speed * delta
			if player_vector.x > 0:
				player_vector.x = 0
		if player_vector.x > 0:
			player_vector.x -= player_brakes_speed * delta
			if player_vector.x < 0:
				player_vector.x = 0
	return move_and_slide(player_vector)

func randomize_controls():
	control_array = ["ui_up","ui_down","ui_left","ui_right"]
	randomize()
	control_var_1 = control_array[floor(rand_range(0,4))]
	control_array.erase(control_var_1)
	control_var_2 = control_array[floor(rand_range(0,3))]
	control_array.erase(control_var_2)
	control_var_3 = control_array[floor(rand_range(0,2))]
	control_array.erase(control_var_3)
	control_var_4 = control_array[floor(rand_range(0,1))]
	control_array.erase(control_var_4)
	

func _on_Area2D_area_entered(area):
	if area.is_in_group("wall") or area.is_in_group("enemy"):
		$time_lost.visible = true
		position.x = 413
		position.y = 537
		$AnimationPlayer.play("lost_time_anim")
		get_tree().call_group("timer","on_global_wall_signal")

	if area.is_in_group("coin"):
		randomize_controls()
		


func _on_ice_level_ready():
	player_speed = 400
	player_brakes_speed = 50
	player_speed_limit = 400


func _on_teleport_node_ready():
	warp_bool = true
	
func warp_player():
	if position.x < 0:
		position.x = 400
		position.y = 300
		emit_signal("left")
	if position.x > 800:
		position.x = 400
		position.y = 300
		emit_signal("right")
	if position.y < 0:
		position.x = 400
		position.y = 300
		emit_signal("up") 
	if position.y > 600:
		position.x = 400
		position.y = 300
		emit_signal("down")
