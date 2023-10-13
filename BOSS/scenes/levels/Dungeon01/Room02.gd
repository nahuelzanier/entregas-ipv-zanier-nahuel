extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "dungeon01_room02"
	player_spawn = Vector2(10,11)
	map = [
		['xxx','xxx','xxx','xxb','xxa','xxa','xxb','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','drl','drr','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxb','wly','dng','stn','emp','emp','stn','dng','dng','dng','dng','dng','emp','dng','dng','wly','xxx'],
		['xxa','drn','stn','emp','dng','dng','dng','dng','emp','dng','emp','dng','dng','emp','dng','wly','xxb'],
		['xxa','drs','stn','emp','dng','dng','emp','emp','emp','emp','dng','dng','dng','dng','stn','drn','xxa'],
		['xxb','wly','dng','dng','dng','dng','btn','dng','dng','dng','dng','dng','emp','dng','stn','drs','xxa'],
		['xxx','wly','h2o','emp','emp','emp','emp','emp','emp','emp','dng','emp','dng','emp','dng','wly','xxb'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','col','emp','dng','dng','emp','col','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','dng','dng','emp','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','emp','dng','dng','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','dng','dng','emp','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','stn','stn','dng','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','col','wlx','drl','drr','wlx','col','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxb','xxa','xxa','xxb','xxx','xxx','xxx','xxx']
	]
#	entities[0] = [Tags.et_trap_door, 4, 2]
#	entities[1] = [Tags.et_trap_door, 5, 2]
#	entities[2] = [Tags.et_trap_door, 6, 6]
#	entities[3] = [Tags.et_rock, 6, 5]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()
	c_map[1][4].switch_sprites()
	c_map[1][5].switch_sprites()

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
