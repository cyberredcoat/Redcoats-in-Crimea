extends ProgressBar

func _on_player_health_signal(health):
	%HealthBar.value = health
