extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "dungeon01_room04"
	player_spawn = Vector2(4.5,6)
	map = [
		['xxx','xxx','xxx','xxb','xxa','xxa','xxb','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','drl','drr','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxx','wly','dng','emp','stn','stn','dng','emp','dng','dng','dng','dng','emp','dng','emp','fou','emp','dng','dng','emp','emp','wly','xxx'],
		['xxx','wly','dng','dng','dng','dng','dng','emp','dng','dng','dng','dng','emp','dng','dng','emp','dng','dng','dng','dng','emp','wly','xxx'],
		['xxx','wly','dng','emp','dng','dng','dng','emp','dng','dng','dng','dng','emp','dng','dng','dng','dng','dng','emp','dng','emp','wly','xxx'],
		['xxx','wly','emp','dng','stn','stn','dng','emp','dng','emp','dng','dng','dng','dng','emp','dng','dng','dng','emp','emp','dng','wly','xxx'],
		['xxx','col','wlx','wlx','drl','drr','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','sal','col','wlx','col','xxx'],
		['xxx','xxx','xxx','xxb','xxa','xxa','xxb','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','btn','dng','emp','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxb','wly','wlx','wlx','wlx','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxa','drn','dng','dng','emp','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxa','drs','dng','emp','dng','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxb','col','wlx','wlx','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
	]
	entities[0] = [Tags.et_salt_pillar, 18, 6]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()

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
