extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("MiniMap")
	$ColorRect1.visible = true
	$ColorRect2.visible = false
	$ColorRect3.visible = false



func _input(event):
	if event.is_action_pressed("map"):
		get_tree().paused = not get_tree().paused
		visible = not visible

func checkRoom(room):
	if room == 1:
		$ColorRect1.visible = true
		$ColorRect2.visible = false
		$ColorRect3.visible = false
	elif room == 2:
		$ColorRect1.visible = false
		$ColorRect2.visible = true
		$ColorRect3.visible = false
		$ColorRect5.visible = false
	elif room == 3:
		$ColorRect1.visible = false
		$ColorRect2.visible = false
		$ColorRect3.visible = true
		$ColorRect4.visible = false
	
