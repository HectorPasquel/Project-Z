extends Node



func _ready():
	$VBoxContainer/HBoxContainer/TextureButton.grab_focus()
	
	
	
func _physics_process(delta):
	if $VBoxContainer/HBoxContainer/TextureButton.is_hovered() == true:
		$VBoxContainer/HBoxContainer/TextureButton.grab_focus()
	if $VBoxContainer/HBoxContainer2/Continue.is_hovered() == true:
		$VBoxContainer/HBoxContainer2/Continue.grab_focus()
	if $VBoxContainer/HBoxContainer3/Credits.is_hovered() == true:
		$VBoxContainer/HBoxContainer3/Credits.grab_focus()
	if $VBoxContainer/HBoxContainer4/Exit.is_hovered() == true:
		$VBoxContainer/HBoxContainer4/Exit.grab_focus()




func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Levels/TestRoom.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/GUI/Credits.tscn")
