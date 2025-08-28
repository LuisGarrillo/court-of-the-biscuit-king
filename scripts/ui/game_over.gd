extends Node2D
class_name GameOver
@onready var retry: CustomButton = $Retry
@onready var quit: CustomButton = $Quit
@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal retry_sig
signal quit_sig

func _ready() -> void:
	retry.area_2d.monitoring = false
	quit.area_2d.monitoring = false


func toggle():
	retry.area_2d.monitoring = !retry.area_2d.monitoring
	quit.area_2d.monitoring = !quit.area_2d.monitoring

func retyr_emit():
	retry_sig.emit()

func _on_retry_clicked() -> void:
	print("retrying")
	animation_player.play("out")


func _on_quit_clicked() -> void:
	print("quiting")
	quit_sig.emit()
