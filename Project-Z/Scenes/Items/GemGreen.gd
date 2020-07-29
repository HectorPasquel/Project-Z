extends Area2D


func _ready():
	add_to_group("GemGreen")
	GameData.validate_GD()


func validateG(gem):
	if gem == 1:
		queue_free()
	else:
		pass


func _on_GemGreen_body_entered(body):
	if "Player" in body.name:
		GameData.update_G(3)
	queue_free()
