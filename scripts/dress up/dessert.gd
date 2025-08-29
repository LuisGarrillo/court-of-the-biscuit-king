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

func reset() -> void:
	for key in pieces.keys():
		pieces[key].texture = null
	
	for key in stats.keys():
		stats[key] = null
