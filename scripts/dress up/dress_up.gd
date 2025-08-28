extends Node2D
class_name DressUp

@onready var dessert: Dessert = $Dessert
@onready var dress_panel: DressPanel = $DressPanel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var riddle: Label = $Riddle
@onready var timer: ProgrammingTimer = $Timer
@onready var stats_panel: StatsPanel = $StatsPanel

var level = 0
var riddles = ["A sweet entrance", "A very salty dish", "A more bitter than sweet memory", "Don't fotget to serve my fish with lemon slices!"]
var times = [1, 90, 90, 60]
var targets = [
	{
		"sweet": 3,
		"salty": 0,
		"bitter": 0,
		"acid": 0
	},
	{
		"sweet": 0,
		"salty": 5,
		"bitter": 0,
		"acid": 0
	},
	{
		"sweet": 1,
		"salty": 0,
		"bitter": 3,
		"acid": 0
	},
	{
		"sweet": 0,
		"salty": 3,
		"bitter": 0,
		"acid": 2
	}
]

var piece_weights = {
	"upper": 1,
	"main": 3,
	"lower": 1
}

signal game_over
signal next_round

func _ready() -> void:
	dress_panel.add_piece.connect(add_piece)

func show_riddle() -> void:
	riddle.text = riddles[level]
	timer.setup(times[level])
	animation_player.play("riddle in")

func enter() -> void:
	animation_player.play("in")

func add_piece(type, flavor) :
	dessert.add_piece(type,flavor)
	update_stats(dessert.stats)
	
func set_up_pieces():
	dress_panel.update_pieces()

func update_stats(proposal):
	var proposal_stat = load_stat(proposal)
	for key in proposal_stat.keys():
		stats_panel.update_stat(key, proposal_stat[key])

func load_stat(proposal):
	var proposal_stat = {
		"sweet": 0,
		"salty": 0,
		"bitter": 0,
		"acid": 0
	}
	for key in proposal.keys():
		if proposal[key] == null:
			continue
			
		proposal_stat[proposal[key]] += 0 if piece_weights[key] == null else piece_weights[key]
	return proposal_stat

func evaluate(proposal: Dictionary):
	var proposal_stat = load_stat(proposal)
	
	for key in proposal_stat.keys():
		if proposal_stat[key] < targets[key]:
			animation_player.play("game over")
			return
	level += 1
	check_next()

func check_next():
	if level < 4:
		animation_player.play("next round")
	else:
		animation_player.play("finish game")

func _on_timer_time_out() -> void:
	animation_player.play("time out")

func game_over_toggle():
	game_over.emit()
