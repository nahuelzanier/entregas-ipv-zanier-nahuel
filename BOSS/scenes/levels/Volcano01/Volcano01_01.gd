extends "res://scenes/levels/_AbstractLevel.gd"

onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner
onready var volcano_return_path = Vector2(1,12)

func _ready():
	map_tag_name = "volcano 1-1"
	player_spawn = Vector2(14,50)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(14,57)] = ["generate_map", $"../../Island01/Jungle03", volcano_return_path]
	triggers[Vector2(15,57)] = ["generate_map", $"../../Island01/Jungle03", volcano_return_path]
	triggers[Vector2(16,57)] = ["generate_map", $"../../Island01/Jungle03", volcano_return_path]
	triggers[Vector2(13,17)] = ["generate_map", $"../../Extras/Checkers01", Vector2(26,26)]

func volcano_return_path(vector2):
	triggers[Vector2(14,57)] = ["generate_map", $"../../Island01/Jungle03", vector2]
	triggers[Vector2(15,57)] = ["generate_map", $"../../Island01/Jungle03", vector2]
	triggers[Vector2(16,57)] = ["generate_map", $"../../Island01/Jungle03", vector2]
		
