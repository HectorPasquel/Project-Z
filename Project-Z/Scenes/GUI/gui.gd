extends CanvasLayer


func _ready():
	add_to_group("GUI")
	
	
	

	
	









var mock = 0
var mock_M = 0
var health

func _physics_process(delta):
#	var health = get_tree().root.get_node("Player").health
	get_tree().call_group("Player", "display_H")
	GameData.max_health_display()
	var mana = get_tree().root.get_node("GameData").mana
	
	$Control/VBoxContainer/HBoxContainer/ActualH.text = str(health)
	$Control/VBoxContainer/HBoxContainer/MaxH.text = str(mock)
	$Control/VBoxContainer/HBoxContainer2/ActualM.text = str(mana)
	$Control/VBoxContainer/HBoxContainer2/MaxM.text = str(mock_M)
	

	
	
	
func dis_h(H):
	health = H

func process(max_h, max_m):
	mock_M = max_m
	mock = max_h 
#	print (max_m)
	
#	print (max_h)
