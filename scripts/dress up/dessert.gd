extends Node2D
class_name Dessert

@onready var pieces: Dictionary[String, Sprite2D] = {
	"upper": $Node2D/UpperPiece,
	"main": $Node2D/MainPiece,
	"lower": $Node2D/LowerPiece
}

var stats: Dictionary = {
	"upper": null,
	"main": null,
	"lower": null,
}
	
func add_piece(type, flavor) -> void:
	pieces[type].texture = Data.dress_textures[flavor][type]
	stats[type] = flavor
