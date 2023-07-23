extends StaticBody2D

signal door_entered

func _on_door_body_entered(_body):
	door_entered.emit()
