extends KinematicBody2D

var motion = Vector2()

const GRAVITY = 60
const SPEED = 200
const UP = Vector2(0,-1)

var is_dead = false
var is_hurted = false
var direction = 1 
#1 == right 
var health = 12
var timeout = false
var attacking = false
var damageSword = 25

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
					$AtackArea/CollisionShape2D.position.x *= -1
					$CollisionShape2D.position.x *= -1
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
					$AtackArea/CollisionShape2D.position.x *= -1
					$CollisionShape2D.position.x *= -1

func dead():
	
	is_dead = true
	motion = Vector2(0,0)
	$AnimatedSprite.play("dying")
	
	$Dying.start()
#	$AnimatedSprite.play("dead")



	
	
	
	
func harm(damage):
	health = health - damage
	$grunt.play()
	is_hurted = true
	motion.x = 0
	$hurt.start()
	$AnimatedSprite.play("dying")
	if health < 1:
		dead()
		
		
func slash():
#	if Input.is_action_just_pressed("harm"):
	if is_dead == false:
		if is_hurted == false:
			if direction == 1 and $viewR.is_colliding() == true:
				motion.x = 0
				if attacking == false:
					$AnimatedSprite.play("idle")
				if not timeout:
					attacking = true
					motion.x = 0
					$AnimatedSprite.play("attack")
					
					$attacking.start()
					$collisionA.start()
					$delay.start()
					
						
					timeout = true
					
#					$AtackArea/CollisionShape2D.disabled = false
				
			elif direction == 1 and $viewL.is_colliding() == true:
				$AnimatedSprite.flip_h = true
				$AtackArea/CollisionShape2D.position.x *= -1
				direction = direction * -1
				motion.x = 0
				if attacking == false:
					$AnimatedSprite.play("idle")
				if not timeout:
					attacking = true
					motion.x = 0
					$AnimatedSprite.play("attack")
					
					$attacking.start()
					$collisionA.start()
					$delay.start()
					
						
					timeout = true
					
#					$AtackArea/CollisionShape2D.disabled = false
				
			elif direction == -1 and $viewR.is_colliding() == true:
				$AnimatedSprite.flip_h = false
				$AtackArea/CollisionShape2D.position.x *= -1
				direction = direction * -1
				motion.x = 0
				if attacking == false:
					$AnimatedSprite.play("idle")
				if not timeout:
					attacking = true
					motion.x = 0
					$AnimatedSprite.play("attack")
					
					$attacking.start()
					$collisionA.start()
					$delay.start()
						
					timeout = true
					
#					$AtackArea/CollisionShape2D.disabled = false
				
			elif direction == -1 and $viewL.is_colliding() == true:
				motion.x = 0
				if attacking == false:
					$AnimatedSprite.play("idle")
				if not timeout:
					attacking = true
					motion.x = 0
					$AnimatedSprite.play("attack")
					
					$attacking.start()
					$collisionA.start()
					$delay.start()
						
					timeout = true
					
#					$AtackArea/CollisionShape2D.disabled = false
		
				
				
		#	if $viewR.is_colliding() == true or $viewL.is_colliding() == true:
		#		if not timeout:
		#			attacking = true
		#			motion.x = 0
		#			$AnimatedSprite.play("attack")
		#			$AtackArea/CollisionShape2D.disabled = false
		#			$attacking.start()
		#
		#
		#			timeout = true
		#	else:
		#		pass



func _on_Vanish_timeout():
	queue_free()


func _on_Dying_timeout():
	$CollisionShape2D.disabled = true
	$AnimatedSprite.play("dead")
	$Vanish.start()


func _on_hurt_timeout():
	is_hurted = false


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		body.harm(damageSword)


func _on_attacking_timeout():
	timeout = false
	


func _on_AnimatedSprite_animation_finished():
	attacking = false


func _on_collisionA_timeout():
	$AtackArea/CollisionShape2D.disabled = true


func _on_delay_timeout():
	$AtackArea/CollisionShape2D.disabled = false
	
