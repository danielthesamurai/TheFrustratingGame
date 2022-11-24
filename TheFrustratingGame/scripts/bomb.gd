extends Area2D

signal explode

func _on_bomb_area_entered(area):
	if area.is_in_group("player"):
		emit_signal("explode")
