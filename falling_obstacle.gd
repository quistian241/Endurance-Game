extends CharacterBody2D

const FALL_VELOCITY = 250.0
const MAX_FALL_DIST = 700.0
var travelled_distance = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") 

func _physics_process(delta):
	#velocity.y += gravity * delta 
	velocity.y = FALL_VELOCITY
	move_and_slide()

	travelled_distance += FALL_VELOCITY * delta
	if travelled_distance > MAX_FALL_DIST:
		queue_free()
	
