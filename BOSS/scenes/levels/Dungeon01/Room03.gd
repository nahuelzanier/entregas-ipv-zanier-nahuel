extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "dungeon01_room03"
	player_spawn = Vector2(15,12)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(16,12), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(1,3.5))
		[Vector2(16,13), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(1,3.5))
		_:
			pass
