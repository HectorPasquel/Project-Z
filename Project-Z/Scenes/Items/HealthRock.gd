extends Area2D


var status = false
var timeout = true
func _ready():
	$Sprite.visible = true
	$Sprite2.visible = false
	add_to_group("HealthRock")
	 





func _on_Timer_timeout():
	timeout = true



	


func _on_HealthRock_body_entered(body):
	GameData.validate_HSA()
	print (status)
	if timeout == true:
		if status == true:
			status = false
			GameData.update_health_stone(1)
			GameData.update_max_health(2)
			$Sprite.visible = false
			$Sprite2.visible = true
			$Timer.start()
			timeout = false
		else:
			pass
		
	else:
		pass
	
	
func validate_a(state):
	if state == 0:
		status = true
	else:
		status = false
	
	
