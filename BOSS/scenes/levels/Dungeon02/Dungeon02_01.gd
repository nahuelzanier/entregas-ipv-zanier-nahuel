extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "dungeon 2-1"
	player_spawn = Vector2(11, 28)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(26,17)] = ["generate_map", $"../../Island01/Island02", Vector2(25,17)]
	triggers[Vector2(25,23)] = ["generate_map", $"../../Island01/Island02", Vector2(25,22)]
	triggers[Vector2(15,18)] = ["generate_map", $"../../Island01/Island02", Vector2(16,18)]
	triggers[Vector2(10,25)] = ["generate_map", $"../Dungeon02_02", Vector2(10,8)]
	triggers[Vector2(3,20)] = ["generate_map", $"../../Island01/Island02", Vector2(3,20)]
	triggers[Vector2(4,21)] = ["generate_map", $"../Dungeon02_02", Vector2(6,9)]
