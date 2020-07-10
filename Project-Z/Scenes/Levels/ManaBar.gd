extends TextureProgress



func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	value = get_tree().root.get_node("GameData").mana
