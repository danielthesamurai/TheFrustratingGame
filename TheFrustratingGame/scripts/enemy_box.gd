extends Area2D

var speed = 500
var speed_array = [500,-500]
var coin_flip = 0

func _ready():
	randomize()
	speed = speed_array[floor(rand_range(0,2))]
	position.x = rand_range(50,750)
	position.y = rand_range(50,550)
	coin_flip = randi()%2

func _process(delta):
	if coin_flip == 0:
		position.x += speed * delta
	elif coin_flip == 1:
		position.y += speed * delta

func _on_enemy_box_area_entered(area):
	if area.is_in_group("wall"):
		speed = -speed
