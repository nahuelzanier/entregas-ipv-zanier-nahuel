extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "dungeon01_room05"
	player_spawn = Vector2(10,23)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(10,24), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(4.5,1))
		[Vector2(11,24), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(4.5,1))
		_:
			pass

func update_maps():
	if (map[Vector2(8,3)] != Tags.fl_water
	 && map[Vector2(8,5)] != Tags.fl_water
	 && map[Vector2(8,7)] != Tags.fl_water
	 && map[Vector2(8,9)] != Tags.fl_water
	):
		$"../../Island01/Island01".stop_whirlpool()
	else:
		$"../../Island01/Island01".start_whirlpool()
