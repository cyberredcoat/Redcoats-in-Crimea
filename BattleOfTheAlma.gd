extends Node2D

var fireScene: PackedScene = preload("res://scenes/projectiles/bullet.tscn")
var enemyFireScene: PackedScene = preload("res://scenes/projectiles/bullet.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_player_player_shoot(pos,dir):
	var fire = enemyFireScene.instantiate() as Area2D
	fire.position = pos
	fire.direction = dir
	fire.rotation_degrees = rad_to_deg(dir.angle()) + 90
	$Projectiles.add_child(fire)

func _on_russian_reg_russian_shoot(pos, dir):
	var enemyFire = enemyFireScene.instantiate() as Area2D
	enemyFire.position = pos
	enemyFire.direction = dir
	enemyFire.rotation_degrees = rad_to_deg(dir.angle()) + 90
	$ProjectilesEnemy.add_child(enemyFire)
