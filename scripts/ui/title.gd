extends Node2D
class_name Title
@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal start
signal quit

func start_emit():
	start.emit()

func _on_start_clicked() -> void:
	animation_player.play("out")


func _on_quit_clicked() -> void:
	get_tree().quit()
