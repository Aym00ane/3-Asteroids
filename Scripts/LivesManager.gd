extends Node

class_name LivesManger

signal player_life_lost(lives: int)
const player_start_position = Vector2(0,0)

@export var lives = 3

var player_scene = preload("res://Scenes/player.tscn")
@onready var player = $"../Player" as Player

func _ready():
	player.on_player_death.connect(decrease_lives)


func decrease_lives():
	lives -= 1
	player_life_lost.emit(lives)
	if lives != 0:
		@warning_ignore("shadowed_variable")
		var player = player_scene.instantiate() as Player
		player.on_player_death.connect(decrease_lives)
		get_tree().root.get_node("main").add_child(player)
		player.global_position = player_start_position
		player.start_invincibility()
