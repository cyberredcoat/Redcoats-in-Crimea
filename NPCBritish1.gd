extends Area2D


func _physics_process(delta: float) -> void:
	const move_speed := 20.0
	%PathFollow2DB1.progress += move_speed * delta
