extends Node2D
class_name CustomButton

@onready var area_2d: Area2D = $Area2D

var inside = false
signal clicked

func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and inside:
		clicked.emit()

func _on_area_2d_mouse_entered() -> void:
	inside = true


func _on_area_2d_mouse_exited() -> void:
	inside = false
