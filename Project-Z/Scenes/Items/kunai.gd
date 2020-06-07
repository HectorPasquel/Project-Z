extends Area2D


const SPEED = 900
var velocity = Vector2()
var direction = 1

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	
	
func set_kunai_direction(dir):
	direction = dir
	print (direction)
	if dir == -1:
		$Sprite.flip_v = true	
		
			
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_kunai_body_entered(body):
	queue_free()
