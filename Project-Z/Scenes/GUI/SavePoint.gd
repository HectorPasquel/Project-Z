extends Area2D

var saving = false

func _ready():
	$Sprite.visible = true
	$Sprite2.visible = false



func _on_SavePoint_body_entered(body):
	if saving == false:
		get_tree().call_group("Player", "position_update")
		
		$Saving.start()
		$Timer.start()
#			GameData.save_data()
#			$Sprite.visible = false
#			$Sprite2.visible = true
#			saving = true
#			$Timer.start()


func _on_Timer_timeout():
	saving = false
	$Sprite.visible = true
	$Sprite2.visible = false


func _on_Saving_timeout():
	GameData.save_data()
	$Sprite.visible = false
	$Sprite2.visible = true
	saving = true
	
