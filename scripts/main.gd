extends Node2D
@onready var dress_up: DressUp = $DressUp

@onready var current_round = 0
@onready var game_over: GameOver = $GameOver

func _ready() -> void:
	Data.load_dress_textures()
	dress_up.set_up_pieces()
	dress_up.show_riddle()
	

func start_round():
	dress_up.set_up_pieces()
	dress_up.show_riddle()

func _on_dress_up_game_over() -> void:
	game_over.animation_player.play("in")
