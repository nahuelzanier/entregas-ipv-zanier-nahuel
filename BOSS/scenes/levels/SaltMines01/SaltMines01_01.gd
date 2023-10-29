extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "salt mines 1-1"
	player_spawn = Vector2(4, 48)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	
	triggers[Vector2(6,47)] = ["generate_map", $"../../Island01/Island02", Vector2(9,7)]
	triggers[Vector2(14,6)] = ["generate_map", $"../../Island01/Island02", Vector2(11,4)]
	triggers[Vector2(24,10)] = ["generate_map", $"../SaltMinesDark01", Vector2(10,14)]
	triggers[Vector2(33,32)] = ["generate_map", $"../SaltMinesDark02", Vector2(10,14)]
	triggers[Vector2(3,4)] = ["generate_map", $"../SaltMines01_04", Vector2(11,17)]

func update_maps():
	if (entities[Vector2(10,3)] == Tags.et_torch_on
	 && entities[Vector2(10,2)] == Tags.et_torch_on):
		triggers[Vector2(24,10)] = ["generate_map", $"../SaltMines01_02", Vector2(21,17)]
		triggers[Vector2(33,32)] = ["generate_map", $"../SaltMines01_03", Vector2(27,18)]
