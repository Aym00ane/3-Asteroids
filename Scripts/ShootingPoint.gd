extends Marker2D 

@export var bullet_scene: PackedScene

@onready var shoot_sound = $"../ShootSound"

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate() as Bullet
		get_tree().root.add_child(bullet)
		shoot_sound.play()
		
		var shot_direction = Vector2(0,1).rotated(get_parent().rotation)
		bullet.position = global_position
		bullet.direction = shot_direction
