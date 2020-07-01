extends CanvasLayer


onready var health_bar = $LifeBar

func _on_health_updated(health, amount):
	health_bar.value = health
	
func _on_max_health_updated(max_health):
	health_bar.max_value = max_health
	
