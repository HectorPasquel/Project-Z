extends Area2D



func _ready():
	$AnimatedSprite.play("default")
	
	

func _on_VisibilityNotifier2D_screen_exited():
	$Timer.start()


func _on_Mana_body_entered(body):
	if "Player" in body.name:
		body.addmana(5)
		GameData.update_max_health(2)
	queue_free()


func _on_Timer_timeout():
	queue_free()
	pass
