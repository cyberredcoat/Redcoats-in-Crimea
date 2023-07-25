extends Area2D

const speed: int = 100
var direction: Vector2

func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
