extends Area2D


func _ready():
	add_to_group("Getsuga")
	GameData.validate_Getsuga()


func validateD(ability):
	if ability == 1:
		queue_free()
	else:
		pass

func _on_Getsuga_body_entered(body):
	if "Player" in body.name:
		GameData.update_ability(4)
	queue_free()
