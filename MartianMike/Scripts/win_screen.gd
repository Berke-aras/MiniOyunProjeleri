extends Control




func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
	#bu sekilde preload veya load yapmana gerek yok otomatik yapıyor
