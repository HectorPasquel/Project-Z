extends Area2D


const SPEED = 1500
var velocity = Vector2()
var direction = 1
var damage = 2

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	
	
func set_kunai_direction(dir):
	direction = dir
	print (direction)
	if dir == -1:
		$Sprite2.flip_h = true
		
			
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_kunai_body_entered(body):
	if "Enemy1" in body.name:
		body.harm(damage)
	elif "Enemy2" in body.name:
		body.harm(damage)
	elif "Enemy3" in body.name:
		body.harm(damage)
	elif "Enemy4" in body.name:
		body.harm(damage)
	elif "Player" in body.name:
		body.harm(damage)
	queue_free()
