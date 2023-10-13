extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "dungeon01_room01"
	player_spawn = Vector2(2,10)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx','xxx','xxx','xxx','col','wlx','col','xxx'],
		['xxx','wly','dng','dng','dng','dng','dng','dng','wly','xxx','xxx','xxx','xxx','wly','dng','wly','xxx'],
		['xxx','wly','emp','emp','dng','emp','dng','emp','wly','xxx','xxx','xxx','xxx','wly','dng','wly','xxx'],
		['xxx','wly','dng','emp','emp','dng','emp','dng','wly','xxx','xxx','xxx','xxx','wly','emp','wly','xxx'],
		['xxx','wly','dng','dng','emp','emp','dng','emp','wly','xxb','xxa','xxa','xxb','wly','emp','wly','xxx'],
		['xxx','wly','dng','emp','emp','dng','emp','emp','col','wlx','drl','drr','wlx','col','dng','wly','xxx'],
		['xxx','wly','wlx','col','dng','dng','dng','dng','dng','dng','stn','stn','dng','dng','dng','wly','xxx'],
		['xxx','wly','stn','wly','emp','dng','emp','emp','dng','emp','dng','dng','dng','emp','dng','wly','xxx'],
		['xxx','wly','_-T','wly','dng','emp','dng','dng','dng','dng','dng','emp','emp','dng','dng','wly','xxx'],
		['xxx','wly','dng','emp','dng','dng','emp','dng','emp','dng','emp','dng','dng','emp','emp','wly','xxx'],
		['xxx','wly','dng','dng','emp','emp','dng','dng','dng','dng','dng','dng','dng','emp','emp','wly','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
	]
	entities[0] = [Tags.et_rock, 2, 2]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()
	c_map[6][10].switch_sprites()
	c_map[6][11].switch_sprites()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(10,5), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(10.5,12))
		[Vector2(11,5), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(10.5,12))
		[Vector2(2,9), tag]:
			CurrentMap.call_deferred("generate_map", $"../../Island01/Island01", Vector2(6,14))
		_:
			pass
