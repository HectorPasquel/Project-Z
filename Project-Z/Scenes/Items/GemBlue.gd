extends Area2D


func _ready():
	add_to_group("GemBlue")
	GameData.validate_BD()


func validateG(gem):
	if gem == 1:
		queue_free()
	else:
		pass


func _on_GemBlue_body_entered(body):
	if "Player" in body.name:
		GameData.update_G(2)
	queue_free()
