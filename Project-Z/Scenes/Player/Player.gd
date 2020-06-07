extends KinematicBody2D

var motion = Vector2()

const SPEED = 700
const GRAVITY = 60
const UP = Vector2(0,-1)
const JUMP_SPEED = -1000
const KUNAI = preload("res://Scenes/Items/kunai.tscn")

var jump_count = 0
var attacking = false
var timeout = false
var jumping = false
var wall_jumping = false
var throwing = false
var flashing = false

#var wall_direction = 1
#
onready var left_wall = $WallRaycast/LeftCast
onready var right_wall = $WallRaycast/RightCast


func _ready():
	pass
	
	
func _physics_process(delta):
	apply_gravity()
	Jump()
	wall_jump()
	animate()
	Move()
	slash()
	throw_kunai()
#	is_throwing()
	lunge()
	move_and_slide(motion, UP)
#	print (jump_count)
	print (motion.y)
#	test()
	
func apply_gravity():
#	if position.y > WORLD_LIMIT:
#		get_tree().call_group("Gamestate", "end_game")
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
		
		
func Jump():
	if Input.is_action_just_pressed("jump") and jump_count < 2 and Input.is_action_pressed("right") == false and Input.is_action_pressed("left") == false:
		jumping = true
		jump_count += 1
		motion.y = JUMP_SPEED
	
	elif  Input.is_action_just_pressed("jump") and jump_count < 2 and Input.is_action_pressed("right") and Input.is_action_pressed("left") == false:
		jumping = true
		jump_count += 1
		motion.y = JUMP_SPEED
	
	elif Input.is_action_just_pressed("jump") and jump_count < 2 and Input.is_action_pressed("left") and Input.is_action_pressed("right") == false:
		jumping = true
		jump_count += 1
		motion.y = JUMP_SPEED
		
	elif is_on_floor():
		jumping = false
		jump_count = 0
		wall_jumping = false
		
		
	

func Move():
	if Input.is_action_pressed("left") and Input.is_action_pressed("right") == false:
		if attacking == true and motion.y >= 0 and motion.y <= 60:
			motion.x = 0
		else:
			motion.x = -SPEED

			
		if sign ($Position2D.position.x) == 1 and $Animations.flip_h == true:
			$Position2D.position.x *= -1
		
	elif Input.is_action_pressed("right") and Input.is_action_pressed("left") == false:
		if attacking == true and motion.y >= 0 and motion.y <= 60:
			motion.x = 0
		else:
			motion.x = SPEED
			
		if sign ($Position2D.position.x) == -1 and $Animations.flip_h == false:
			$Position2D.position.x *= -1
	else:
		motion.x = 0
		
		
func slash():
	if Input.is_action_just_pressed("atack"):
		if not timeout:
			if motion.y >= 0 and motion.y <= 60:
				motion.x = 0
			attacking = true
			$Animations.play("attack")
			$Slash.play()
			$Timer.start()
			timeout = true
		
		
func throw_kunai():
	if Input.is_action_just_pressed("kunai"):
		
		if not timeout:
			if motion.y >= 0 and motion.y <= 60:
				motion.x = 0
			throwing = true
			var kunai = KUNAI.instance()
			if sign($Position2D.position.x) == 1:
				kunai.set_kunai_direction(1)
			else:
				kunai.set_kunai_direction(-1)
				$Animations.flip_h
			get_parent().add_child(kunai)
			kunai.position = $Position2D.global_position
			if motion.y < 0:
				$Animations.play("throwjump")
			elif motion.y > 100:
				$Animations.play("throwfall")
			else:
				$Animations.play("throwK")
			$kunai.play()
			$Timer.start()
			timeout = true
			
		
			
			
func lunge():
	if Input.is_action_just_pressed("lunge"):
		if not timeout:
			$Animations.play("flash")
			flashing = true
			if $Animations.flip_h == false:
				motion.x += 10000			
			else:
				motion.x -= 10000
			$Timer.start()
			timeout = true
		
		
func animate():
	if motion.y < 0 and attacking == false and wall_jumping == false and throwing == false and flashing == false:
		$Animations.play("jump")
	elif motion.y > 100 and attacking == false and wall_jumping == false and throwing == false and flashing == false: 
		$Animations.play("fall")
	elif motion.x > 1 and attacking == false and wall_jumping == false and throwing == false and flashing == false:
		$Animations.flip_h = false
		$Animations.play("walk")
	elif motion.x < -1 and attacking == false and wall_jumping == false and throwing == false and flashing == false:
		$Animations.flip_h = true
		$Animations.play ("walk")
#	elif motion.y == 60 and wall_jumping == true:
#		$Animations.play("wall_jump")
	elif attacking == false and wall_jumping == false and throwing == false and flashing == false:
		$Animations.play("idle")
					
			
func wall_jump():
	if left_wall.is_colliding() == true and jumping == true and Input.is_action_pressed("left"): 
		if motion.y < -200 or motion.y > 10:
			if motion.x == -700:
				wall_jumping = true
				motion.x = 0
				motion.y = 300
				$Animations.flip_h = false
				$Animations.play("wall_jump")
				
				jump_count = 0
		#		print ("left")
	if right_wall.is_colliding() == true and jumping == true and Input.is_action_pressed("right"):
		if motion.y < -200 or motion.y > 10:
			if motion.x == 700:
				wall_jumping = true
				motion.x = 0
				motion.y = 300
				$Animations.flip_h = true
				$Animations.play("wall_jump")
				jump_count = 0
		#		print ("right")
	elif right_wall.is_colliding() == false and left_wall.is_colliding() == false and not Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		wall_jumping = false
	print (wall_jumping)


func _on_Animations_animation_finished():
	attacking = false
	throwing = false
	flashing = false


func _on_Timer_timeout():
	timeout = false
