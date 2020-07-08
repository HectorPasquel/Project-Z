extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#func _input(event):
#	if event.is_action_pressed("load"):
#		GameData.save_data()


func _on_Room1_body_entered(body):
	if "Player" in body.name:
		get_tree().call_group("MiniMap", "checkRoom",1)


func _on_Room2_body_entered(body):
	if "Player" in body.name:
		get_tree().call_group("MiniMap", "checkRoom",2)


func _on_Room3_body_entered(body):
	if "Player" in body.name:
		get_tree().call_group("MiniMap", "checkRoom",3)
