extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "salt mines dark room 01"
	player_spawn = Vector2(10, 14)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(14,14)] = ["generate_map", $"../../Island01/Island02", Vector2(11,4)]
	triggers[Vector2(9,13)] = ["generate_map", $"../SaltMines01_01", Vector2(24,11)]
