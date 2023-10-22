extends Area2D

class_name Asteroid 

signal on_asteroid_destruction(size : AsteroidSize, position :Vector2)

@export var speed = 100
@export var speed_increment_factor = .5
@onready var sprite = $Sprite2D
@onready var explosion_particles = $ExplosionParticles

const utils = preload("res://Scripts/utils.gd")

var image_array = ["res://Assets/Asteroid_01.png",
				   "res://Assets/Asteroid_02.png",
				   "res://Assets/Asteroid_03.png",
				   "res://Assets/Asteroid_04.png"]
				

var size = utils.AsteroidSize.BIG

var direction: Vector2

func _ready():
	var scaleValue = 1 / (size + 1.0)
	scale = Vector2(scaleValue,scaleValue)
	
	var random_index = randi() % image_array.size() 
	var random_image = load(image_array[random_index])
	sprite.texture = random_image
	
	speed = speed + speed * size * speed_increment_factor
	
	var x = randf_range(-1,1)
	var y = randf_range(-1,1)
	
	direction = Vector2(x,y)

func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if body is Player && !(body as Player).is_invincible:
		(body as Player).on_player_death.emit()
		body.queue_free()
		on_destroy()

func emit_explosion():
	explosion_particles.emitting = true
	explosion_particles.reparent(get_tree().root)

func on_destroy():
	emit_explosion()
	queue_free()
	var new_asteroid_size = size + 1
	on_asteroid_destruction.emit(new_asteroid_size, global_position)


func _on_area_entered(area):
	if area is Bullet || area is Ufo:
		area.queue_free()
		on_destroy()
		
		
