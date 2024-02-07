extends Node2D

var enemy_scene = preload("res://Scenes/enemy_1.tscn")
var path_enemy_scene = preload("res://Scenes/path_enemy.tscn")

@onready var spawn_positions = $SpawnPositions

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

func _on_timer_timeout():
	spawn_enemy()


func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children() #get children ile 6 yeri aldık
	var random_spawn_position = spawn_positions_array.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.position = random_spawn_position.global_position
	#add_child(enemy_instance)
	emit_signal("enemy_spawned", enemy_instance)


func _on_timer_2_timeout():
	spawn_path_enemy()

func spawn_path_enemy():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
