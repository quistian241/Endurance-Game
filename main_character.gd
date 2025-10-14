extends CharacterBody2D

const SPEED = 300.0
#const FRICTION = 30.0 ## friction was troublesome to add 
var moveDirection = Vector2.ZERO

# Could do a WASD controls as well as follow the mouse movement controls
func _physics_process(delta):
	moveDirection = Input.get_vector("left", "right", "up", "down")
	moveDirection.normalized()
	velocity = moveDirection * SPEED
	move_and_slide()
