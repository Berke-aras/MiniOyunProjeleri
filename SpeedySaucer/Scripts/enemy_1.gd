extends Area2D

@export var speed = 300

signal  died

func _physics_process(delta):
	global_position.x += -speed*delta


func die():
	queue_free()
	#emit_signal("died")


func _on_body_entered(body):
	body.take_damage() #physic layerda enemynin tek tespit edebildiği body player, roketvs body değil area2d
	# playerdaki func calistirio
	die()



func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#print(area.name)
	if area.name == "DeathZone":
		pass
	else:
		emit_signal("died")
