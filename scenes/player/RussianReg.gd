extends CharacterBody2D

signal russianShoot(pos,dir)
var russianCanFire: bool = true
@onready var player = Global.get("Player")
var distance = player.global_position.x - self.global_position.x

func _ready():
	$RussianRegAni/AnimationPlayer.play("BayonetSide")

func _on_fireable_timer_timeout():
	var pos: Vector2 = $ShootStart.global_position
	var dir: Vector2 = (Player.position - pos).normalized()
	
	var rng = RandomNumberGenerator.new()
	var fireableNumber = rng.randf_range(0, 1)
	
	if fireableNumber >= 0.15:
		print("Fire!")
		$RussianRegAni/AnimationPlayer.play("Fire")
		russianCanFire = false
		$Timers/FireTimer.start()
		russianShoot.emit(pos,dir)
		
	else:
		print("NO")

func _on_fire_timer_timeout():
	$RussianRegAni/AnimationPlayer.play("BayonetFront")
