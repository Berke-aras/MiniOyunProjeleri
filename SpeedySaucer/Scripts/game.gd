extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_hit_sound = $PlayerHitSound

var gos_scene = preload("res://Scenes/game_over_screen.tscn")


func _on_death_zone_area_entered(area):
	area.die()
	#area.queue_free()


func _on_player_took_damage():
	lives -= 1
	hud.set_lives(lives)
	player_hit_sound.play()
	if lives == 0:
		player.die()
		
		await get_tree().create_timer(1.2).timeout
		set_score()



func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 100
	#print(score)
	hud.set_score_label(score)
	enemy_hit_sound.play()

func set_score():
	var gos_instance = gos_scene.instantiate()
	gos_instance.set_score(score)
	ui.add_child(gos_instance)
	


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", _on_enemy_died)
