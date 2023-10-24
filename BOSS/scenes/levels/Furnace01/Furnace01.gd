extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "Furnace 01"
	player_spawn = Vector2(2, 20)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(2,19), tag]:
			CurrentMap.call_deferred("generate_map", $"../../Island01/Island02", Vector2(28,11))
		_:
			pass
