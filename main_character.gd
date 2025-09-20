extends CharacterBody2D

const SPEED = 300.0
var moveDirection = Vector2.ZERO

func _physics_process(delta):
	moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * SPEED
	#if moveDirection:
		#velocity = moveDirection
	#else: 
		#velocity = Vector2.ZERO
	move_and_slide()
	
	#var direction = Input.get_axis("left", "right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, 20)
	#move_and_slide()
