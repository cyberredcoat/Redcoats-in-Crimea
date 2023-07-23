extends CharacterBody2D

class_name Player

signal player_shoot(pos,dir)
@export var speed: int = 500
var can_shoot: bool = true

func _process(_delta):
	# Variables
	var direction: Vector2 = Input.get_vector("left","right","front","back")
	var pos: Vector2 = $ShootStart.global_position
	var dir: Vector2 = (get_global_mouse_position() - position).normalized()
	# Movement
	velocity = direction * speed
	move_and_slide()
	# Rotation
	look_at(get_global_mouse_position())
	# Shoot
	if Input.is_action_pressed("fire") and can_shoot:
		print("Fire!")
		can_shoot = false
		$Timers/ShootTimer.start()
		player_shoot.emit(pos,dir)

# Timers
func _on_shoot_timer_timeout():
	can_shoot = true
