extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "island 1-2"
	player_spawn = Vector2(21.5, 32)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(21,33)] = ["generate_map", $"../Island01", Vector2(18,1)]
	triggers[Vector2(22,33)] = ["generate_map", $"../Island01", Vector2(19,1)]
	triggers[Vector2(28,12)] = ["generate_map", $"../../Furnace01/Furnace01", Vector2(2,20)]
	triggers[Vector2(26,17)] = ["generate_map", $"../../Dungeon02/Dungeon02_01", Vector2(26,18)]
	triggers[Vector2(25,23)] = ["generate_map", $"../../Dungeon02/Dungeon02_01", Vector2(25,24)]
	triggers[Vector2(15,18)] = ["generate_map", $"../../Dungeon02/Dungeon02_01", Vector2(16,18)]
	triggers[Vector2(3,21)] = ["generate_map", $"../../Dungeon02/Dungeon02_01", Vector2(3,21)]
	triggers[Vector2(33,15)] = ["generate_map", $"../Jungle01", Vector2(1,11)]
	triggers[Vector2(33,16)] = ["generate_map", $"../Jungle01", Vector2(1,12)]
	triggers[Vector2(33,17)] = ["generate_map", $"../Jungle01", Vector2(1,13)]
	triggers[Vector2(8,6)] = ["generate_map", $"../../SaltMines01/SaltMines01_01", Vector2(5,48)]
