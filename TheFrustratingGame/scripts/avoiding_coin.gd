extends Area2D

var avoid_state = false
var area_tracker
var coin_speed = 150

func _process(delta):
	
	if avoid_state == true:
		avoid_function(area_tracker,delta)


func _on_avoiding_coin_area_entered(area):
	
	if area.is_in_group("player"):
		queue_free()


func _on_avoid_zone_area_entered(area):
	
	if area.is_in_group("player"):
		avoid_state = true
		area_tracker = area.get_parent()

func _on_avoid_zone_area_exited(area):
	
	if area.is_in_group("player"):
		avoid_state = false

func avoid_function(signal_area,delta):
	
	if signal_area.position.y < position.y:
		position.y += coin_speed * delta 
	elif signal_area.position.y > position.y:
		position.y -= coin_speed * delta
	if signal_area.position.x < position.x:
		position.x += coin_speed * delta
	elif signal_area.position.x > position.x:
		position.x -= coin_speed * delta


func _on_teleport_avoiding_coin_timeout():
	position.x = rand_range(50,750)
	position.y = rand_range(50,550)
