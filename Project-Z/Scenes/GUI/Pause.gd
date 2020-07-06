extends Control




func _ready():
	$VBoxContainer/HBoxContainer/Resume.grab_focus()
	
func _physics_process(delta):
	if $VBoxContainer/HBoxContainer/Resume.is_hovered() == true:
		$VBoxContainer/HBoxContainer/Resume.grab_focus()
	if $VBoxContainer/HBoxContainer2/Quit.is_hovered() == true:
		$VBoxContainer/HBoxContainer2/Quit.grab_focus()


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$VBoxContainer/HBoxContainer/Resume.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible


func _on_Quit_pressed():
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://Scenes/GUI/MainMenu.tscn")

func _on_Resume_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
