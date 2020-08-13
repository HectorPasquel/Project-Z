extends Area2D


func _ready():
	add_to_group("WJ")
	GameData.validate_WJ()


func validateD(ability):
	if ability == 1:
		queue_free()
	else:
		pass



func _on_WJ_body_entered(body):
	if "Player" in body.name:
		GameData.update_ability(2)
	queue_free()
