extends Node2D
class_name Judge
@onready var hand: Sprite2D = $Sprite2D/Hand
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var outfit_approved
signal game_over_judge
signal next_round

var hands: Dictionary[String, Texture2D] = {
	"ok": load("res://assets/sprites/king/hands/ok.png"),
	"bad": load("res://assets/sprites/king/hands/bad.png"),
	"thinking": load("res://assets/sprites/king/hands/thinking.png")
}

func set_up(approved):
	outfit_approved = approved
	animation_player.play("king in")

func emit_judgement():
	hand.texture = hands["ok"] if outfit_approved else hands["bad"]
	animation_player.play("emit")

func outcome():
	if not outfit_approved:
		animation_player.play("game over")
		game_over_judge.emit()
	else:
		animation_player.play("game over")
		next_round.emit()

func reset():
	hand.texture = hands["thinking"]
