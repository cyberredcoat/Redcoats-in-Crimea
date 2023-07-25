extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/projectiles/bullet.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_player_player_shoot(pos,dir):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = pos
	bullet.direction = dir
	bullet.rotation_degrees = rad_to_deg(dir.angle()) + 90
	$Projectiles.add_child(bullet)


func _on_area_2d_3_body_entered(body):
	get_tree().reload_current_scene()
	pass
