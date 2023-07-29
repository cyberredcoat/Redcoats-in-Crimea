extends CharacterBody2D

signal player_shoot(pos,dir)
signal playerPos(pos,dir)
signal healthSignal(health)
signal playerSound(sound)
@export var speed: int = 20
var can_shoot: bool = true
var onHill: bool = true
var sound: bool = false
var health = 100

func _ready():
	$RedcoatRegAni/AnimationPlayer.play("BayonetSide")

func _process(_delta):
	var direction: Vector2 = Input.get_vector("left","right","front","back")
	var pos: Vector2 = $ShootStart.global_position
	var dir: Vector2 = (get_global_mouse_position() - position).normalized()
	playerPos.emit(pos,dir)

	velocity = direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("fire") and can_shoot:
		$RedcoatRegAni/AnimationPlayer.play("Fire")
		can_shoot = false
		$Timers/FireTimer.start()
		player_shoot.emit(pos,dir)
		$Timers/FireableTimer.start()
		$PlayerFire.play()

func _on_fire_timer_timeout():
	$RedcoatRegAni/AnimationPlayer.play("BayonetFront")
	
func _on_fireable_timer_timeout():
	can_shoot = true

func _on_area_2d_area_entered(area):
	health -= 2
	healthSignal.emit(health)
	if health == 0:
		get_tree().reload_current_scene()
	if health <= 0:
		get_tree().reload_current_scene()
