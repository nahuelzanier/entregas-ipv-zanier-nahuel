extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "salt mines 1-1"
	player_spawn = Vector2(3, 3)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
