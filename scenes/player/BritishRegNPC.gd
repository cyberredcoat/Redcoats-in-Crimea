extends CharacterBody2D

@export var speed: int = 20
var can_shoot: bool = true

func _ready():
	$RedcoatRegAni/AnimationPlayer.play("BayonetSide")

func _physics_process(delta):
	var rng = RandomNumberGenerator.new()
	var fireableNumber = rng.randf_range(0, 1)

	if fireableNumber >= 0.15 and can_shoot:
		$RedcoatRegAni/AnimationPlayer.play("Fire")
		can_shoot = false
		$Timers/FireTimer.start()
		$Timers/FireableTimer.start()
		$NPCFire.play()

func _on_fire_timer_timeout():
	$RedcoatRegAni/AnimationPlayer.play("BayonetFront")

func _on_fireable_timer_timeout():
	can_shoot = true
