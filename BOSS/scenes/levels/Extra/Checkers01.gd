extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "Checkers"
	player_spawn = Vector2(26,25)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(26,27)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(13,18)]
