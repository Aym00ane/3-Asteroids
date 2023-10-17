extends Area2D

class_name Ufo

@onready var explosion_particles = $ExplosionParticles
@onready var shooting_timer = $ShootingTimer

@export var bullet_scene: PackedScene
@export var path: PathFollow2D

var speed = 300
var curren_point_on_path = 0


func _ready():
	shooting_timer.timeout.connect(shoot)
func _process(delta):
	if path == null:
		return
	var progress = delta * speed
	path.progress += progress

func shoot():
	var bullet = bullet_scene.instantiate() as Bullet
	bullet.set_collision_layer_value(2,0)
	bullet.set_collision_layer_value(5,1)
	
	get_tree().root.add_child(bullet)
	bullet.position = global_position
	bullet.direction = get_random_shot_direction()



func get_random_shot_direction():
	var x = randf_range(1,3)
	var y = randf_range(1,3)
	return Vector2(x,y)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
