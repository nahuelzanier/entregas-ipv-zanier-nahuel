extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "CANYON"
	player_spawn = Vector2(5,22)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(4,22)] = ["generate_map", $"../../SaltMines01/SaltMines01_05", Vector2(6,1)]
	triggers[Vector2(13,4)] = ["generate_map", $"../../Canyon01/Canyon01_02", Vector2(6,35)]
