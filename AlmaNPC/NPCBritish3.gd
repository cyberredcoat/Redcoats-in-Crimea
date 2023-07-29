extends Area2D


func _physics_process(delta: float) -> void:
	const move_speed := 7.0
	%PathFollow2D3.progress += move_speed * delta
