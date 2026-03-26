extends CharacterBody2D

class_name Player

signal health_depleted
signal health_reduced
const SPEED = 450.0
const DAMAGE_RATE = 1
const MAX_HEALTH = 5
var health = 5 
var moveDirection = Vector2.ZERO

# Could do a WASD controls as well as follow the mouse movement controls
func _physics_process(delta):
	moveDirection = Input.get_vector("left", "right", "up", "down")
	moveDirection.normalized()
	velocity = moveDirection * SPEED
	move_and_slide()

func take_damage():
	health -= DAMAGE_RATE
	health_reduced.emit()
	
	if health <= 0:
		health_depleted.emit()
