extends Node2D
class_name FlavorButton
@export var flavor : String
var inside = false
signal change_flavor

func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and inside:
		print("changing to:" + flavor)
		change_flavor.emit(flavor)

func _on_area_2d_mouse_entered() -> void:
	inside = true


func _on_area_2d_mouse_exited() -> void:
	inside = false
