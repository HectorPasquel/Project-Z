extends KinematicBody2D
#Ninja
var motion = Vector2()

const GRAVITY = 60
const SPEED = 100
const UP = Vector2(0,-1)

var is_dead = false
var is_hurted = false
var direction = 1 
#1 == right 
var health = 9
var timeout = false
var attacking = false
var damageSword = 25
var delayK = false

const KUNAI = preload("res://Scenes/Items/kunai.tscn")
const MANA = preload("res://Scenes/Items/Mana.tscn")


func _ready():
	pass 
	
func _physics_process(delta):
	apply_gravity()
	move_and_slide(motion, UP)
	walk()
	slash()
	
#	print (direction)
	
func apply_gravity():
	if is_dead == false:
		if is_on_floor() and motion.y > 0:
			motion.y = 0
		elif is_on_ceiling():
			motion.y = 1
		else:
			motion.y += GRAVITY
		
func walk():
	if is_dead == false:
		if is_hurted == false:
			if attacking == false:
				if is_on_wall():
					direction = direction * -1
					$RayCast2D.position.x *= -1
					
					$CollisionShape2D.position.x *= -1
#					$Position2D.position.x *= -1
				motion.x = SPEED * direction
				if direction == 1:
					$AnimatedSprite.play("walk")
					$AnimatedSprite.flip_h = false
				elif direction == -1:
					$AnimatedSprite.play("walk")
					$AnimatedSprite.flip_h = true
				if $RayCast2D.is_colliding() == false:
					direction = direction * -1
					$RayCast2D.position.x *= -1
					$CollisionShape2D.position.x *= -1
#					$Position2D.position.x *= -1

func dead():
	
	is_dead = true
	motion = Vector2(0,0)
	$AnimatedSprite.play("dying")
	
	$Dying.start()
	leave_mana()
	
#	$AnimatedSprite.play("dead")



	
	
	
	
func harm(damage):
	health = health - damage
	$grunt.play()
	is_hurted = true
	motion.x = 0
	$hurt.start()
	$AnimatedSprite.play("hurt")
	if health < 1:
		dead()

#func throwKunai():
#
#	var kunai = KUNAI.instance()
#	if sign($Position2D.position.x) == 1:
#		kunai.set_kunai_direction(1)
#	else:
#		kunai.set_kunai_direction(-1)
#	get_parent().add_child(kunai)
#	kunai.position = $Position2D.global_position
#

func leave_mana():
	var mana = MANA.instance()
	get_parent().add_child(mana)
	mana.position = $PositionMana.global_position

	
func slash():
#	if Input.is_action_just_pressed("harm"):
	if is_dead == false:
		if is_hurted == false:
			
			if direction == 1 and $viewR.is_colliding() == true:
				$Position2D.position.x = 100
				motion.x = 0
				var kunai = KUNAI.instance()
				kunai.set_kunai_direction(1)
				
				if attacking == false:
					$AnimatedSprite.play("idle")
			
				if not timeout:
					
					attacking = true	
					motion.x = 0
					$AnimatedSprite.play("attack")
					$attacking.start()
	#				throwKunai()
	
						
					get_parent().add_child(kunai)
					kunai.position = $Position2D.global_position
						
						
					timeout = true
					
#					
				
			elif direction == 1 and $viewL.is_colliding() == true:
				$Position2D.position.x = -120
				$AnimatedSprite.flip_h = true
#				$AtackArea/CollisionShape2D.position.x *= -1
				direction = direction * -1
				motion.x = 0
				var kunai = KUNAI.instance()
				kunai.set_kunai_direction(1)
				if attacking == false:
					$AnimatedSprite.play("idle")
#				$delay.start()
#				delayK = true
#				if not timeout:
#					if delayK == false:
#						attacking = true
#						motion.x = 0
#						$attacking.start()
#						$AnimatedSprite.play("attack")
#	#					throwKunai()
#
#						get_parent().add_child(kunai)
#						kunai.position = $Position2D.global_position
#
#
#
#
#						timeout = true
					
#					
				
			elif direction == -1 and $viewR.is_colliding() == true:
				$Position2D.position.x = 100
				$AnimatedSprite.flip_h = false
#				$AtackArea/CollisionShape2D.position.x *= -1
				direction = direction * -1
				motion.x = 0
				var kunai = KUNAI.instance()
				kunai.set_kunai_direction(-1)
				if attacking == false:
					$AnimatedSprite.play("idle")
#				$delay.start()
#				delayK = true
#				if not timeout:
#					if delayK == false:
#						attacking = true
#						motion.x = 0
#						$AnimatedSprite.play("attack")
#						$attacking.start()
#	#					throwKunai()
#
#
#						get_parent().add_child(kunai)
#						kunai.position = $Position2D.global_position
#
#
#
#
#						timeout = true
						
#				
				
			elif direction == -1 and $viewL.is_colliding() == true:
				motion.x = 0
				$Position2D.position.x = -120
				var kunai = KUNAI.instance()
				kunai.set_kunai_direction(-1)
				if attacking == false:
					$AnimatedSprite.play("idle")
	
				if not timeout:
					
					attacking = true
					motion.x = 0
					$AnimatedSprite.play("attack")
					$attacking.start()
	#				throwKunai()
						
						
					get_parent().add_child(kunai)
					kunai.position = $Position2D.global_position
						
						
						
					timeout = true
						
#					





func _on_Vanish_timeout():
	queue_free()


func _on_Dying_timeout():
	$CollisionShape2D.disabled = true
	$AnimatedSprite.play("dead")
	$Vanish.start()
	


func _on_hurt_timeout():
	is_hurted = false





func _on_attacking_timeout():
	timeout = false
	


func _on_AnimatedSprite_animation_finished():
	attacking = false


func _on_delay_timeout():
	delayK = false
