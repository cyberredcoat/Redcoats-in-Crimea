extends Area2D

const speed: int = 100
var direction: Vector2

func _process(delta):
	position += direction * speed * delta
