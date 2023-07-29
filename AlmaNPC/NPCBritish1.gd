extends Area2D


func _physics_process(delta: float) -> void:
	const move_speed := 7.5
	%PathFollow2D1.progress += move_speed * delta
