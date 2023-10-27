extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "salt mines dark room 02"
	player_spawn = Vector2(4, 48)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(14,0)] = ["generate_map", $"../../Island01/Island02", Vector2(11,4)]
	triggers[Vector2(9,13)] = ["generate_map", $"../SaltMines01_01", Vector2(32,32)]
