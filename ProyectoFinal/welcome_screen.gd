extends Node2D

func _on_start_button_pressed():
	# Al presionar el botón, cargamos y creamos una instancia de la escena de game_level.tscn
	var scene_instance = load("res://game_level.tscn").instance()
	
	# Establecemos la instancia de la escena como la escena actual
	get_tree().set_current_scene(scene_instance)
