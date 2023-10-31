extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "canyon 1-2"
	player_spawn = Vector2(6,35)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(5,35)] = ["generate_map", $"../../Canyon01/Canyon01_01", Vector2(13,5)]
	triggers[Vector2(8,5)] = ["generate_map", $"../../Canyon01/Canyon01_03", Vector2(4,29)]
