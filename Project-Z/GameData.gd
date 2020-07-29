extends Node

var mana = 0
var max_health = 10
var max_mana = 10
var checkpoint = 1
var positionX = 0
var positionY = 0


var health_stone_a = 0
var health_stone_b = 0
var health_stone_c = 0

var mana_stone_a = 0
var mana_stone_b = 0
var mana_stone_c = 0

var double_jump = 0
var dash = 0
var wall_jump = 0


var redStone = 0
var blueStone = 0
var greenStone = 0


var data = {
	mana = 0,
	max_health = 0,
	max_mana = 0,
	checkpoint = 0,
	positionX = 0,
	positionY = 0,
	health_stone_a = 0,
	health_stone_b = 0,
	health_stone_c = 0,
	mana_stone_a = 0,
	mana_stone_b = 0,
	mana_stone_c = 0,
	double_jump = 0,
	dash = 0,
	wall_jump = 0,
	redStone = 0,
	blueStone = 0,
	greenStone = 0
}


func _ready():
	var path = Directory.new()
	if(!path.dir_exists("user://jakon_saves")):
		path.open("user://")
		path.make_dir("user://jakon_saves")
	
	add_to_group("GameData")

func update_G(gem):
	if gem == -1:
		redStone = 0
		blueStone = 0
		greenStone = 0
	elif gem == 1:
		redStone = 1
	elif gem == 2:
		blueStone = 1
	elif gem == 3:
		greenStone = 1
		

func validate_RD():
	get_tree().call_group("RedDoor", "validateG", redStone)
	get_tree().call_group("GemRed", "validateG", redStone)


func validate_BD():
	get_tree().call_group("BlueDoor", "validateG", blueStone)
	get_tree().call_group("GemBlue", "validateG", blueStone)
	

func validate_GD():
	get_tree().call_group("GreenDoor", "validateG", greenStone)
	get_tree().call_group("GemGreen", "validateG", greenStone)


func validate_HSA():
	get_tree().call_group("HealthRock", "validate_a", health_stone_a)
	
func validate_HSB():
	get_tree().call_group("HealthRock2", "validate_a", health_stone_b)
	
func validate_HSC():
	get_tree().call_group("HealthRock3", "validate_a", health_stone_c)
	
	
	
func validate_MSA():
	get_tree().call_group("ManaRock", "validate_a", mana_stone_a)
	
func validate_MSB():
	get_tree().call_group("ManaRock2", "validate_a", mana_stone_b)
	
func validate_MSC():
	get_tree().call_group("ManaRock3", "validate_a", mana_stone_c)
	
func update_health_stone(state):
	if state == -1:
		health_stone_a = 0
		health_stone_b = 0
		health_stone_c = 0
	elif state == 1:
		health_stone_a = 1
	elif state == 2:
		health_stone_b = 1
	elif state == 3:
		health_stone_c = 1

func update_mana_stone(state):
	if state == -1:
		mana_stone_a = 0
		mana_stone_b = 0
		mana_stone_c = 0
	elif state == 1:
		mana_stone_a = 1
	elif state == 2:
		mana_stone_b = 1
	elif state == 3:
		mana_stone_c = 1

func update_max_health(max_h):
	if max_h == -1:
		max_health = 10
		
	else:
		max_health = max_health + max_h
		get_tree().call_group("Player","restore_health", max_health)
#		llenar vida a tope (pendiente)

func update_max_mana(max_m):
	if max_m == -1:
		max_mana = 10
		
	else:
		max_mana = max_mana + max_m
#		get_tree().call_group("Player","restore_health", max_health)
#		llenar vida a tope (pendiente)

		
	
func max_health_display():
	
	get_tree().call_group("GUI", "process", max_health, max_mana)
	
	
	
func update_mana(man):
	if man == -1:
		mana = 0
	else:
		if mana < max_mana:
			mana = mana + man
		else:
			mana = mana
	print (mana)
	
func update_position(X,Y):
	if X == -1 and Y == -1:
		positionX = 0
		positionY = 0
	else:
		positionX = X
		positionY = Y
	
	
func position_player():
	
	get_tree().call_group("Player", "positionPlayer", positionX, positionY)
	get_tree().call_group("Player","restore_health", max_health)

func use_mana(value):
	if value == 1:
		if mana >= 3:
			get_tree().call_group("Player","restore_health", max_health)
			mana = mana - 3
	elif value == 2:
		if mana >= 2:
			get_tree().call_group("Player", "slashW")
			mana = mana - 2






func _input(event):
	if event.is_action_pressed("mock"):
		print (max_mana)
		
		
		
		
		
		
		
		
		
func save_data():
	var save_data = File.new()
	save_data.open("user://jakon_saves/game.sav", File.WRITE)
	
	var saved_data = data
	saved_data.mana = mana
	saved_data.max_health = max_health
	saved_data.max_mana = max_mana
	saved_data.positionX = positionX
	saved_data.positionY = positionY
	saved_data.checkpoint = checkpoint
	saved_data.health_stone_a = health_stone_a
	saved_data.health_stone_b = health_stone_b
	saved_data.health_stone_c = health_stone_c
	saved_data.mana_stone_a = mana_stone_a
	saved_data.mana_stone_b = mana_stone_b
	saved_data.mana_stone_c = mana_stone_c
	saved_data.double_jump = double_jump
	saved_data.dash = dash
	saved_data.wall_jump = wall_jump
	saved_data.redStone = redStone
	saved_data.greenStone = greenStone
	saved_data.blueStone = blueStone
	
	



	
	
	
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
	max_mana = loaded_data.max_mana 
	positionX = loaded_data.positionX
	positionY = loaded_data.positionY
	checkpoint = loaded_data.checkpoint


	health_stone_a = loaded_data.health_stone_a
	health_stone_b = loaded_data.health_stone_b
	health_stone_c = loaded_data.health_stone_c
	
	mana_stone_a = loaded_data.mana_stone_a
	mana_stone_b = loaded_data.mana_stone_b
	mana_stone_c = loaded_data.mana_stone_c
	
	double_jump = loaded_data.double_jump
	dash = loaded_data.dash
	wall_jump = loaded_data.wall_jump
	
	redStone = loaded_data.redStone
	blueStone = loaded_data.blueStone
	greenStone = loaded_data.greenStone
	

	
	
	
