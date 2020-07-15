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


#var save_path = "user://save.dat"
#func saveData():
#	var data = {
#		"max_health" : 100,
#
#	}
#	var file = File.new()
#	var error = file.open(save_path, File.WRITE)
#	if error == OK:
#		file.store_var(data)
#		file.close()



func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Levels/TestRoom.tscn")
	GameData.update_mana(-1)
	GameData.update_position(-1, -1)
	GameData.update_max_health(-1)
	GameData.update_max_mana(-1)
	GameData.update_health_stone(-1)
	GameData.update_mana_stone(-1)
#	GameData.position_player()


func _on_Exit_pressed():
	get_tree().quit()


func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/GUI/Credits.tscn")


func _on_Continue_pressed():
	get_tree().change_scene("res://Scenes/Levels/TestRoom.tscn")
	GameData.load_data()
#	GameData.position_player()
