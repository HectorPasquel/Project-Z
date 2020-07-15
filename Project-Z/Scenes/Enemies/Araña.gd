extends KinematicBody2D
#Araña
var motion = Vector2()

const GRAVITY = 60
const SPEED = 100
const UP = Vector2(0,-1)

var is_dead = false
var is_hurted = false
var direction = 1 
#1 == right 
var health = 12
var timeout = false

var damageSword = 2

func _ready():
	pass 
	
func _physics_process(delta):
	apply_gravity()
	move_and_slide(motion, UP)
	walk()
	

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
			
			if is_on_wall():
				direction = direction * -1
				$RayCast2D.position.x *= -1
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
				$CollisionShape2D.position.x *= -1

func dead():
	
	is_dead = true
	motion = Vector2(0,0)
	$AnimatedSprite.play("dying")
	leave_mana()
	$Dying.start()
	
#	$AnimatedSprite.play("dead")



	
	
	
	
func harm(damage):
	health = health - damage

	is_hurted = true
	motion.x = 0
	$hurt.start()
	$AnimatedSprite.play("dying")
	if health < 1:
		dead()
		
		





const MANA = preload("res://Scenes/Items/Mana.tscn")
func leave_mana():
	var mana = MANA.instance()
	get_parent().add_child(mana)
	mana.position = $PositionMana.global_position

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

