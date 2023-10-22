extends CanvasLayer

@onready var lives_container: HBoxContainer = $MarginContainer/LivesContainer
@onready var lives_manager: LivesManger = $"../LivesManager"
@onready var game_over_label: Label = %GameOverLabel
@onready var points_label: Label = %PointsLabel
@onready var asteroids_spawner: AsteroidsSpawner = $"../AsteroidsSpawner"



var life_texture = preload("res://Assets/Lives.png")
var empty_life_texture = preload("res://Assets/Player.png")


func _ready():
	var lives = lives_manager.lives
	
	for i in range(lives):
		var life_text_rect = TextureRect.new()
		life_text_rect.stretch_mode = TextureRect.STRETCH_SCALE
		life_text_rect.texture = life_texture
		life_text_rect.custom_minimum_size = Vector2(32,32)
		lives_container.add_child(life_text_rect)
	
	lives_manager.player_life_lost.connect(life_lost)
	asteroids_spawner.points_updated.connect(score_points)
	asteroids_spawner.game_won.connect(game_won)

func life_lost(lives_left):
	var life_texture_rect: TextureRect = lives_container.get_child(lives_left)
	life_texture_rect.texture = empty_life_texture
	
	if lives_left == 0:
		game_over_label.visible = true

func score_points(points: int):
	points_label.text = "%d" % points


func game_won():
	game_over_label.visible = true
	game_over_label.text = "Noice! U WON"
	game_over_label.add_theme_font_size_override("font_size",80)
	game_over_label.add_theme_color_override("font_color",Color.CHARTREUSE)
