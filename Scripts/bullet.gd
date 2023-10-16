extends Area2D

class_name Bullet

var bullet_speed = 700
var direction: Vector2


func _process(delta):
	position += direction * bullet_speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
