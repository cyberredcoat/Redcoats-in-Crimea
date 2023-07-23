extends Area2D

const speed: int = 2000
var direction: Vector2

func _process(delta):
	position += direction * speed * delta
