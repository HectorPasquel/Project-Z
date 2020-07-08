extends Node

var mana = 0
var max_health = 100
var checkpoint = 1
var positionX = 0
var positionY = 0

var data = {
	mana = 0,
	max_health = 0,
	checkpoint = 0,
	positionX = 0,
	positionY = 0
}


func _ready():
	var path = Directory.new()
	if(!path.dir_exists("user://jakon_saves")):
		path.open("user://")
		path.make_dir("user://jakon_saves")
	
	add_to_group("GameData")


func update_max_health(max_h):
	max_health = max_h
	
func update_mana(man):
	if man == -1:
		mana = 0
	else:
		mana = mana + man
	
func update_position(X,Y):
	if X == -1 and Y == -1:
		positionX = 0
		positionY = 0
	else:
		positionX = X
		positionY = Y
	
	
func position_player():
	
	get_tree().call_group("Player", "positionPlayer", positionX, positionY)

func use_mana(value):
	if value == 1:
		if mana >= 500:
			get_tree().call_group("Player","restore_health")
			mana = mana - 500
	elif value == 2:
		if mana >= 300:
			get_tree().call_group("Player", "slashW")
			mana = mana - 300







func _input(event):
	if event.is_action_pressed("mock"):
		print (positionX, "  ", positionY)
		
		
		
		
		
		
		
		
		
func save_data():
	var save_data = File.new()
	save_data.open("user://jakon_saves/game.sav", File.WRITE)
	
	var saved_data = data
	saved_data.mana = mana
	saved_data.max_health = max_health
	saved_data.positionX = positionX
	saved_data.positionY = positionY
	saved_data.checkpoint = checkpoint
	
	
	save_data.store_line(to_json(saved_data))
	save_data.close()
	
	
	
func load_data():
	var load_data = File.new()
	if (!load_data.file_exists("user://jakon_saves/game.sav")):
		return
	load_data.open("user://jakon_saves/game.sav",File.READ)
	
	var loaded_data = data
	
	while(!load_data.eof_reached()):
		var mock_data = parse_json(load_data.get_line())
		if (mock_data != null):
			loaded_data = mock_data
			
	load_data.close()
			
	mana = loaded_data.mana
	max_health = loaded_data.max_health
	positionX = loaded_data.positionX
	positionY = loaded_data.positionY
	checkpoint = loaded_data.checkpoint

	
		
		
		
		
		
	
	
	
