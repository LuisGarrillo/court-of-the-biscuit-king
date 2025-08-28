extends Node2D
class_name StatsPanel

@onready var stats: Dictionary[String, Stat] = {
	"sweet": $Sweet,
	"salty": $Salty,
	"bitter": $Bitter,
	"acid": $Acid
}

func update_stat(flavor, level):
	stats[flavor].update_status(level)
