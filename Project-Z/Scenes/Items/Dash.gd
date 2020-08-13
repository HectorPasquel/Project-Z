extends Area2D


func _ready():
	add_to_group("Dash")
	GameData.validate_Dash()


func validateD(ability):
	if ability == 1:
		queue_free()
	else:
		pass

func _on_Dash_body_entered(body):
	if "Player" in body.name:
		GameData.update_ability(3)
	queue_free()
