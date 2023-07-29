extends CharacterBody2D

var russianCanFire: bool = true
@export var speed: int = 20

func _ready():
	$RussianRegAni/AnimationPlayer.play("BayonetSide")

func _on_fireable_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var fireableNumber = rng.randf_range(0, 1)

	if fireableNumber >= 0.2:
		$RussianRegAni/AnimationPlayer.play("Fire")
		russianCanFire = false
		$Timers/FireTimer.start()
		$NPCFire.play()

func _on_fire_timer_timeout():
	$RussianRegAni/AnimationPlayer.play("BayonetFront")
