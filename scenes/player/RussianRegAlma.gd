extends CharacterBody2D

signal russianShoot(posi, dir)
var russianCanFire: bool = true
@export var speed: int = 20
var playerPos: Vector2

func _ready():
	$RussianRegAni/AnimationPlayer.play("BayonetSide")

func _on_player_player_pos(pos,dir):
	playerPos = pos

func _on_fireable_timer_timeout():
	var posi: Vector2 = $ShootStart.global_position
	var dir: Vector2 = (playerPos - position).normalized()

	var rng = RandomNumberGenerator.new()
	var fireableNumber = rng.randf_range(0, 1)

	if fireableNumber >= 0.15:
		print("Fire!")
		$RussianRegAni/AnimationPlayer.play("Fire")
		russianCanFire = false
		$Timers/FireTimer.start()
		russianShoot.emit(posi, dir)

	else:
		print("NO")

func _on_fire_timer_timeout():
	$RussianRegAni/AnimationPlayer.play("BayonetFront")
