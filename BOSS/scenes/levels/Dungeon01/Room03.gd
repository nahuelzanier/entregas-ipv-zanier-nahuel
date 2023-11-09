extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "THE DRAIN - 3"
	player_spawn = Vector2(15,12)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(16,12)] = ["generate_map", $"../Room02", Vector2(1,3.5)]
	triggers[Vector2(16,13)] = ["generate_map", $"../Room02", Vector2(1,3.5)]

