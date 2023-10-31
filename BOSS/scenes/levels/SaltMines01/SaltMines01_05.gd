extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "salt mines 1-5"
	player_spawn = Vector2(6, 24)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(5,0)] = ["generate_map", $"../../Canyon01/Canyon01_01", Vector2(5,22)]
	triggers[Vector2(6,0)] = ["generate_map", $"../../Canyon01/Canyon01_01", Vector2(5,22)]
	triggers[Vector2(7,0)] = ["generate_map", $"../../Canyon01/Canyon01_01", Vector2(5,22)]
	triggers[Vector2(5,25)] = ["generate_map", $"../SaltMines01_04", Vector2(11,4)]
	triggers[Vector2(6,25)] = ["generate_map", $"../SaltMines01_04", Vector2(11,4)]
	triggers[Vector2(7,25)] = ["generate_map", $"../SaltMines01_04", Vector2(11,4)]

