extends Node2D

@export var next_level: PackedScene = null

@export var is_final_level: bool = false

@onready var start = $Start
@onready var player = $Player
@onready var exit = $Exit
@onready var death_zone = $DeathZone

@onready var hud = $UI/HUD
@onready var ui = $UI

@export var level_time = 5

var win = false 
var timer_node = null
var time_left

func _ready():
	player.global_position = start.get_spawn_pos()
	
	var traps = get_tree().get_nodes_in_group("traps")
	#print(traps)
	for trap in traps:
		#trap.connect("touched_player", _on_trap_touched_player)
		trap.touched_player.connect(_on_trap_touched_player) #godot 4 way
	
	exit.body_entered.connect(_on_exit_body_entered)
	
	death_zone.body_entered.connect(_on_death_zone_body_entered)
	
	
	time_left = level_time
	hud.set_time(time_left)
	
	timer_node = Timer.new()
	timer_node.name = "LevelTimer"
	timer_node.wait_time = 1
	timer_node.timeout.connect(_on_level_timer_timeout)
	add_child(timer_node) # timer node u level scenesine ekler
	timer_node.start()

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()


func _on_death_zone_body_entered(body):
	AudioPlayer.play_sfx("hurt")
	reset_player()


func _on_trap_touched_player():
	AudioPlayer.play_sfx("hurt")
	reset_player()


func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_pos()


func _on_exit_body_entered(body):
	if body is Player:
		if (next_level != null) or is_final_level:
			exit.animate()
			player.active = false
			win = true
			await get_tree().create_timer(1.5).timeout
			
			if is_final_level:
				ui.show_win_screen(true)
			else:
				get_tree().change_scene_to_packed(next_level)


func _on_level_timer_timeout():
	if win == false:
		time_left -= 1
		hud.set_time(time_left)
		#print(time_left)
		if time_left < 0:
			AudioPlayer.play_sfx("hurt")
			reset_player()
			time_left = level_time
			hud.set_time(time_left)
