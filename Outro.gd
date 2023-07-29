extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _process(delta):
	if Input.is_action_pressed("skip"):
		get_tree().change_scene_to_file("res://GodSave.tscn")

func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://GodSave.tscn")
