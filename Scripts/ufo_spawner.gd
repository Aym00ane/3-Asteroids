extends Node

@export var ufo_scene: PackedScene
@onready var timer = $Timer as UfoTimer

@onready var top_path = $Top/PathFollow2D
@onready var bottom_path = $Bottom/PathFollow2D

func _ready():
	timer.timeout.connect(spawn_ufo)


func spawn_ufo():
	var ufo = ufo_scene.instantiate() as Ufo
	var path_to_follow = top_path if randf() > 0.5 else bottom_path as PathFollow2D
	
	if path_to_follow.get_child_count() != 0:
		return
	
	path_to_follow.progress = 0
	ufo.path = path_to_follow
	path_to_follow.add_child(ufo)
	timer.setup_timer()
	timer.start()
