extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "THE DRAIN - 2"
	player_spawn = Vector2(10,12)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(10,13)] = ["generate_map", $"../Room01", Vector2(10.5,6)]
	triggers[Vector2(11,13)] = ["generate_map", $"../Room01", Vector2(10.5,6)]
	triggers[Vector2(0,3)] = ["generate_map", $"../Room03", Vector2(15,12.5)]
	triggers[Vector2(0,4)] = ["generate_map", $"../Room03", Vector2(15,12.5)]
	triggers[Vector2(4,0)] = ["generate_map", $"../Room04", Vector2(4.5,6)]
	triggers[Vector2(5,0)] = ["generate_map", $"../Room04", Vector2(4.5,6)]
	triggers[Vector2(16,4)] = ["generate_map", $"../Room04", Vector2(17,9.5)]
	triggers[Vector2(16,5)] = ["generate_map", $"../Room04", Vector2(17,9.5)]

