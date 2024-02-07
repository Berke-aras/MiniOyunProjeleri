extends StaticBody2D

@onready var spawn_pos = $SpawnPoint


func _ready():
	print(get_spawn_pos())

func get_spawn_pos():
	return spawn_pos.global_position
