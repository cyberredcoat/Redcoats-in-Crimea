extends CharacterBody2D

signal russianShoot(posi, dir)
signal russianHealthSignal(russianHealth)
var russianCanFire: bool = true
@export var speed: int = 20
var playerPos: Vector2
var russianHealth = 100

func _ready():
	$RussianRegAni/AnimationPlayer.play("BayonetSide")

func _on_player_player_pos(pos,dir):
	playerPos = pos

func _on_fireable_timer_timeout():
	var posi: Vector2 = $ShootStart.global_position
	var dir: Vector2 = (playerPos - position).normalized()

	var rng = RandomNumberGenerator.new()
	var fireableNumber = rng.randf_range(0, 1)

	if fireableNumber >= 0.3:
		$RussianRegAni/AnimationPlayer.play("Fire")
		russianCanFire = false
		$Timers/FireTimer.start()
		russianShoot.emit(posi, dir)
		$EnemyFire.play()

func _on_fire_timer_timeout():
	$RussianRegAni/AnimationPlayer.play("BayonetFront")

func _on_area_2d_area_entered(area):
	russianHealth -= 2
	russianHealthSignal.emit(russianHealth)
	
	if russianHealth == 0:
		russianCanFire = false
		get_tree().change_scene_to_file("res://TheBarrierTitle.tscn")
		
	if russianHealth <= 0:
		russianCanFire = false
		get_tree().change_scene_to_file("res://TheBarrierTitle.tscn")
