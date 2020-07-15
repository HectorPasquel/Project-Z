extends CanvasLayer


func _ready():
	add_to_group("GUI")
	
	
	

	
	









var mock = 0
var mock_M = 0


func _physics_process(delta):
	var health = get_tree().root.get_node("TestRoom").get_node("Player").health
	GameData.max_health_display()
	var mana = get_tree().root.get_node("GameData").mana
	
	$Control/VBoxContainer/HBoxContainer/ActualH.text = str(health)
	$Control/VBoxContainer/HBoxContainer/MaxH.text = str(mock)
	$Control/VBoxContainer/HBoxContainer2/ActualM.text = str(mana)
	$Control/VBoxContainer/HBoxContainer2/MaxM.text = str(mock_M)
	

	
	
	

func process(max_h, max_m):
	mock_M = max_m
	mock = max_h 
#	print (max_m)
	
#	print (max_h)
