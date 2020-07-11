extends TextureProgress

var mock = 0

func _ready():
	add_to_group("LifeBar")

func _physics_process(delta):
	
	GameData.max_health_display()

	var display_health = mock
#	print (mock)

	value = display_health
	
	

func process(max_h):
	var health = get_tree().root.get_node("TestRoom").get_node("Player").health
	mock = 100 / max_h * health
	print (max_h)
#	print (max_h)

	
