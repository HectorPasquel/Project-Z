extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/TextureButton.grab_focus()
	
func _physics_process(delta):
	if $VBoxContainer/TextureButton.is_hovered() == true:
		$VBoxContainer/TextureButton.grab_focus()




func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/GUI/MainMenu.tscn")
