extends KinematicBody2D

var gemR 

func _physics_process(delta):
	GameData.validate_RD()
	if $RayCast2D.is_colliding() == true || $RayCast2D2.is_colliding() == true:
#		open()

		if gemR == true:
			$AnimatedSprite.play("opening")
		else:
			pass


func _ready():
	add_to_group("RedDoor")
#	$AnimatedSprite.play("closed")
	$CollisionShape2D.disabled = false
	$Sprite.visible = false
	$Sprite2.visible = false


func open():
	$AnimatedSprite.play("opening")


func _on_AnimatedSprite_animation_finished():
	$CollisionShape2D.disabled = true 
	$AnimatedSprite.visible = false
	$Sprite.visible = true
	$Sprite2.visible = true
	
 
func validateG(gem):
	if gem == 1:
		gemR = true
	else:
		gemR = false
		
