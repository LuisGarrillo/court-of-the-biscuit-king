extends Node2D
@onready var dress_up: DressUp = $DressUp

@onready var current_round = 0
@onready var game_over: GameOver = $GameOver
@onready var judge: Judge = $Judge
@onready var title: Title = $Title

func _ready() -> void:
	Data.load_dress_textures()
	title_in()
	
func start_round():
	dress_up.set_up_pieces()
	dress_up.show_riddle()
	
func title_in():
	title.animation_player.play("in")

func _on_dress_up_game_over() -> void:
	game_over.animation_player.play("in")


func _on_dress_up_judge_in(approved) -> void:
	judge.set_up(approved)


func _on_judge_game_over_judge() -> void:
	dress_up.animation_player.play("game over")
	_on_dress_up_game_over()


func _on_judge_next_round() -> void:
	dress_up.advance()


func _on_title_start() -> void:
	start_round()


func _on_dress_up_finish_game() -> void:
	title_in()
