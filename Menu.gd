extends Node2D

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		get_tree().change_scene_to_file("res://Intro.tscn")
