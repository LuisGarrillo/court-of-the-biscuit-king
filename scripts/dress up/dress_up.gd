extends Node2D
class_name DressUp

@onready var dessert: Dessert = $Dessert
@onready var dress_panel: DressPanel = $DressPanel
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	dress_panel.add_piece.connect(add_piece)

func show_riddle() -> void:
	animation_player.play("riddle in")

func enter() -> void:
	animation_player.play("in")

func add_piece(type, flavor) :
	dessert.add_piece(type,flavor)
	
func set_up_pieces():
	dress_panel.update_pieces()
