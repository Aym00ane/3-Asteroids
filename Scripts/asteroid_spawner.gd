extends Node
class_name AsteroidsSpawner

@export var asteroid_scene: PackedScene

@export var count = 6
func _ready():
	for i in range(6):
		var random_spawn_position = get_random_position()
		spawn_asteroid(random_spawn_position)



func get_random_position() -> Vector2: 
	var rect = get_viewport().get_visible_rect()
	var camera = get_viewport().get_camera_2d()
	var zoom = camera.zoom
	var camera_position = camera.position
	var size = rect.size / zoom
	
	var bounds = {}

	bounds.top = (camera_position.y - size.y) / 2
	bounds.bottom = (camera_position.y + size.y) / 2
	bounds.right = (camera_position.x + size.x) / 2
	bounds.left = (camera_position.x - size.x) / 2
	
	var x = randf_range(bounds.left, bounds.right)
	var y = randf_range(bounds.top, bounds.bottom)
	return Vector2(x,y)

func spawn_asteroid(random_spawn_position):
	var asteroid = asteroid_scene.instantiate() as Asteroid
	get_tree().root.add_child.call_deferred(asteroid)
	asteroid.global_position = random_spawn_position










