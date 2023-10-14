extends Area2D

class_name Asteroid 

@export var speed = 100

var image_array = ["res://Assets/Asteroid_01.png",
				   "res://Assets/Asteroid_02.png",
				   "res://Assets/Asteroid_03.png",
				   "res://Assets/Asteroid_04.png"]

var direction: Vector2

func _ready():
	var x = randf_range(-1,1)
	var y = randf_range(-1,1)
	
	direction = Vector2(x,y)

func _process(delta):
	position += direction * speed * delta
