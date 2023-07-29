extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _process(delta):
	if Input.is_action_pressed("skip"):
		get_tree().change_scene_to_file("res://BattleOfTheAlma.tscn")
