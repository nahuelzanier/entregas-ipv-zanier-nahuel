extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "BEACH SIDE GROTTO"
	player_spawn = Vector2(2,8)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(8,13)] = ["generate_map", $"../../Island01/Island03", Vector2(12,7)]
