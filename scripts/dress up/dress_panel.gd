extends Node2D
class_name DressPanel
@onready var buttons: Node2D = $buttons
@onready var pieces: Node2D = $Pieces

var current_flavor : String = "sweet"

signal add_piece

func _ready() -> void:
	for button : FlavorButton in buttons.get_children():
		button.change_flavor.connect(change_flavor)
		
	for piece: Piece in pieces.get_children():
		piece.change_piece.connect(change_piece_repeat)

func change_flavor(new_flavor):
	current_flavor = new_flavor
	update_pieces()


func update_pieces():
	for piece : Piece in pieces.get_children():
		piece.update(current_flavor)

func change_piece_repeat(type) -> void:
	add_piece.emit(type, current_flavor)
