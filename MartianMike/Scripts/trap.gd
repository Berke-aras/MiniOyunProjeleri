extends Node2D

signal touched_player

func _on_area_2d_body_entered(body):
	if body is Player:
		#emit_signal("touched_player")
		touched_player.emit() #aynı ama godot 4 ile geldi ve parantez içine bise atabilirsin

