extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "THE DRAIN - 4"
	player_spawn = Vector2(4,6)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(4,7)] = ["generate_map", $"../Room02", Vector2(4.5,1)]
	triggers[Vector2(5,7)] = ["generate_map", $"../Room02", Vector2(4.5,1)]
	triggers[Vector2(16,9)] = ["generate_map", $"../Room02", Vector2(15,4.5)]
	triggers[Vector2(16,10)] = ["generate_map", $"../Room02", Vector2(15,4.5)]
	triggers[Vector2(4,0)] = ["generate_map", $"../Room05", Vector2(10.5,23)]
	triggers[Vector2(5,0)] = ["generate_map", $"../Room05", Vector2(10.5,23)]

