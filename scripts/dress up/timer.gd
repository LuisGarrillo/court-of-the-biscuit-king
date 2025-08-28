extends Node2D
class_name ProgrammingTimer

@onready var label: Label = $Label
@onready var timer: Timer = $Timer

var last_check

signal time_out

func _process(delta: float) -> void:
	if timer.is_stopped():
		return
	check()
	pass

func check():
	if last_check != ceil(timer.time_left):
		last_check = roundi(timer.time_left)
		update_label()

func update_label():
	var min = floori(last_check / 60)
	min = ("0" if min < 10 else "") + String.num_int64(min)
	
	var sec = last_check % 60
	sec = ("0" if sec < 10 else "") + String.num_int64(sec)
	label.text = min + ":" + sec

func start_call():
	timer.start()

func setup(time):
	timer.wait_time = time
	last_check = roundi(timer.wait_time)
	update_label()

func _on_timer_timeout() -> void:
	time_out.emit()
