extends Node2D
@onready var dress_up: DressUp = $DressUp

@onready var current_round = 0

func _ready() -> void:
	Data.load_dress_textures()
	dress_up.set_up_pieces()
	dress_up.show_riddle()
	
