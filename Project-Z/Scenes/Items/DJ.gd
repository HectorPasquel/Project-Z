extends Area2D


func _ready():
	add_to_group("DJ")
	GameData.validate_DJ()


func validateDJ(ability):
	if ability == 1:
		queue_free()
	else:
		pass

func _on_DJ_body_entered(body):
	if "Player" in body.name:
		GameData.update_ability(1)
	queue_free()
