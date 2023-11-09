extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "SEASIDE CLIFFS"
	player_spawn = Vector2(7, 13)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(19,7)] = ["generate_map", $"../Island02", Vector2(6,29)]
	triggers[Vector2(19,8)] = ["generate_map", $"../Island02", Vector2(6,30)]
	triggers[Vector2(12,6)] = ["generate_map", $"../../SideAreas01/SideCave01", Vector2(8,12)]
	triggers[Vector2(9,16)] = ["generate_map", $"../Island01", Vector2(5,1)]
	triggers[Vector2(10,16)] = ["generate_map", $"../Island01", Vector2(6,1)]
