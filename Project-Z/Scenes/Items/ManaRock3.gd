extends Area2D



var status = false
var timeout = true
func _ready():
	$Sprite.visible = true
	$Sprite2.visible = false
	add_to_group("ManaRock3")
	 





func _on_Timer_timeout():
	timeout = true



	


func _on_ManaRock_body_entered(body):
	GameData.validate_MSC()
	print (status)
	if timeout == true:
		if status == true:
			status = false
			GameData.update_mana_stone(3)
			GameData.update_max_mana(2)
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
	
	
