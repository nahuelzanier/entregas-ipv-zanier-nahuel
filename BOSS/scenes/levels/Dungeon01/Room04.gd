extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "dungeon01_room04"
	player_spawn = Vector2(4,6)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(4,7), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(4.5,1))
		[Vector2(5,7), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(4.5,1))
		[Vector2(16,9), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(15,4.5))
		[Vector2(16,10), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(15,4.5))
		[Vector2(4,0), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room05", Vector2(10.5,23))
		[Vector2(5,0), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room05", Vector2(10.5,23))
		_:
			pass
