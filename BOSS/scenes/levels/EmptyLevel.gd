extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "empty_level"
	player_spawn = Vector2(0,0)
	map = []
