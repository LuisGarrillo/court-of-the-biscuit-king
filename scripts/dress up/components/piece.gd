extends Node2D
class_name Piece

@export var sprite : Sprite2D
@export var area : Area2D
@export var type : String

var inside = false
signal change_piece

func _ready() -> void:
	area.mouse_entered.connect(_on_area_2d_mouse_entered)
	area.mouse_exited.connect(_on_area_2d_mouse_exited)

func update(flavor):
	sprite.texture = Data.dress_textures[flavor][type]

func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and inside:
		print("adding :" + type)
		change_piece.emit(type)

func _on_area_2d_mouse_entered() -> void:
	inside = true


func _on_area_2d_mouse_exited() -> void:
	inside = false
