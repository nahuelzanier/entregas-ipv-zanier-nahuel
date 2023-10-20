extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "dungeon01_room01"
	player_spawn = Vector2(2,8)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(10,5), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(10.5,12))
		[Vector2(11,5), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(10.5,12))
		[Vector2(2,7), tag]:
			CurrentMap.call_deferred("generate_map", $"../../Island01/Island01", Vector2(10,25))
		_:
			pass
