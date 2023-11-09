extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner
onready var path_lit = false

func _ready():
	map_tag_name = "WATER TEMPLE"
	player_spawn = Vector2(15,5)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(15,4)] = ["generate_map", $"../Island01", Vector2(19,42)]
