extends Node

@onready var dress_textures: Dictionary[String, Dictionary] = {
	"sweet": {
	},
	"salty": {
	},
	"bitter": {
	},
	"acid": {
	}
}

func load_dress_textures() -> void:
	for key in dress_textures.keys():
		dress_textures[key]["upper"] = load("res://assets/sprites/clothes/" + key + "/upper.png")
		dress_textures[key]["main"] = load("res://assets/sprites/clothes/" + key + "/main.png")
		dress_textures[key]["lower"] = load("res://assets/sprites/clothes/" + key + "/lower.png")
	pass
