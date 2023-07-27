extends CharacterBody2D

signal player_shoot(pos,dir)
signal playerPos(pos,dir)
signal healthSignal(health)
@export var speed: int = 20
var can_shoot: bool = true
var onHill: bool = true
var health = 200

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
		print("Fire!")
		$RedcoatRegAni/AnimationPlayer.play("Fire")
		can_shoot = false
		$Timers/FireTimer.start()
		player_shoot.emit(pos,dir)
		$Timers/FireableTimer.start()

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
		
func _on_area_2d_mt_area_entered(area):
	onHill = true
	
func _on_area_2d_mt_area_exited(area):
	onHill = false

func _on_health_timer_timeout():
	if onHill:
		health -= 1
		healthSignal.emit(health)
		if health == 0:
			queue_free()
		if health <= 0:
			queue_free()
			
	$Timers/HealthTimer.start()
