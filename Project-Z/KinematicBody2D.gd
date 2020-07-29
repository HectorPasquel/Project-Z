extends KinematicBody2D


var gemB

func _physics_process(delta):
	GameData.validate_BD()
	if $RayCast2D.is_colliding() == true || $RayCast2D2.is_colliding() == true:
		if gemB == true:
			
			$AnimatedSprite.play("opening")
		else:
			pass


func _ready():
	add_to_group("BlueDoor")
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
		gemB = true
		
	else:
		gemB = false
