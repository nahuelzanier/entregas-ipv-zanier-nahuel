extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "salt mines 1-2"
	player_spawn = Vector2(21, 17)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(25,17)] = ["generate_map", $"../../Island01/Island02", Vector2(11,4)]
	triggers[Vector2(20,16)] = ["generate_map", $"../SaltMines01_01", Vector2(24,11)]
	triggers[Vector2(7,5)] = ["generate_map", $"../SaltMines01_04", Vector2(20,9)]
