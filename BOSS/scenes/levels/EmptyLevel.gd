extends "res://scenes/levels/_AbstractLevel.gd"

onready var map_designer = $MapDesigner

func _ready():
	map_tag_name = "OUCH..."
	player_spawn = Vector2(1,1)
	map = map_designer.get_map()
