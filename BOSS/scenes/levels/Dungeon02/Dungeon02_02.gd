extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "dungeon 2-2"
	player_spawn = Vector2(3, 3)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(11,8)] = ["generate_map", $"../Dungeon02_01", Vector2(11,25)]
	triggers[Vector2(6,8)] = ["generate_map", $"../Dungeon02_01", Vector2(4,20)]
