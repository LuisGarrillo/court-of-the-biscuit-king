extends Node2D
class_name Stat
@onready var status: Label = $status
@export var icon : Sprite2D

var status_texts = [
	"Nothing yet",
	"Just a pinch",
	"Just a pinch",
	"Dominant flavor!",
	"Dominant flavor!",
	"Monopolizing!"
]

func update_status(level):
	status.text = status_texts[level]
	
