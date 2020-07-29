extends Area2D


func _ready():
	add_to_group("GemRed")
	GameData.validate_RD()


func validateG(gem):
	if gem == 1:
		queue_free()
	else:
		pass


func _on_GemRed_body_entered(body):
	if "Player" in body.name:
		GameData.update_G(1)
	queue_free()
