extends Area2D


func _physics_process(delta: float) -> void:
	const move_speed := 5.0
	%PathFollow2D4.progress += move_speed * delta
