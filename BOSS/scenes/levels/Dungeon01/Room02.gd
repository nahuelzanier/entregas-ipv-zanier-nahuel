extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "dungeon01_room02"
	player_spawn = Vector2(10,12)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(10,13), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room01", Vector2(10.5,6))
		[Vector2(11,13), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room01", Vector2(10.5,6))
		[Vector2(0,3), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room03", Vector2(15,12.5))
		[Vector2(0,4), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room03", Vector2(15,12.5))
		[Vector2(4,0), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(4.5,6))
		[Vector2(5,0), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(4.5,6))
		[Vector2(16,4), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(17,9.5))
		[Vector2(16,5), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(17,9.5))
		_:
			pass
