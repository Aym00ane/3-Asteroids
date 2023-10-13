extends CharacterBody2D

class_name Player

@export var max_speed = 10
@export var rotation_speed = 3.5
@export var velocity_damping_factor = .5
@export var linear_velocity = 500

var input_vector: Vector2

var rotation_direction: int 


func _process(_delta):
	input_vector.x = Input.get_action_strength("rotate_left") - Input.get_action_strength("rotate_right")
	input_vector.y = Input.get_action_strength("forward")
	
	if Input.is_action_pressed("rotate_left"):
		rotation_direction = -1
	elif Input.is_action_pressed("rotate_right"):
		rotation_direction = 1
	else:
		rotation_direction = 0


func _physics_process(delta):
	rotation += rotation_direction * rotation_speed * delta
	if input_vector.y > 0 :
		accelerare_forward(delta)
	elif input_vector.y == 0 && velocity != Vector2.ZERO:
		slow_down_and_stop(delta)
		
	move_and_collide(velocity * delta)

func accelerare_forward(delta : float):
	velocity += (input_vector * linear_velocity * delta).rotated(rotation)
	velocity.limit_length(max_speed)


func slow_down_and_stop(delta : float):
	velocity = lerp(velocity, Vector2.ZERO, velocity_damping_factor * delta)
	
	#stopping
	if velocity.y >= -0.1 && velocity.y <= 0.1 :
		velocity.y = 0












