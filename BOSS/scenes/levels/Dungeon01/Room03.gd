extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "dungeon01_room03"
	player_spawn = Vector2(15,13)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','wly','stn','stn','stn','stn','stn','stn','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','wly','stn','h2o','h2o','h2o','h2o','stn','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','wly','stn','h2o','h2o','h2o','h2o','stn','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','wly','stn','h2o','h2o','h2o','h2o','stn','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','wly','stn','h2o','h2o','h2o','h2o','stn','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','wly','stn','stn','stn','stn','stn','stn','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','wly','sal','sal','dng','dng','dng','dng','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','wly','sal','dng','dng','dng','dng','dng','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','wly','dng','col','dng','dng','col','dng','wly','xxx','xxx','xxx','xxx','col','wlx','col','xxx'],
		['xxx','wly','dng','dng','dng','dng','dng','dng','wly','xxx','xxx','xxx','xxx','wly','dng','wly','xxb'],
		['xxx','wly','emp','emp','dng','emp','dng','emp','wly','xxx','xxx','xxx','xxx','wly','stn','drn','xxa'],
		['xxx','wly','dng','emp','emp','dng','emp','dng','wly','xxx','xxx','xxx','xxx','wly','stn','drs','xxa'],
		['xxx','wly','dng','dng','emp','emp','dng','emp','wly','xxx','xxx','xxx','xxx','wly','emp','wly','xxb'],
		['xxx','wly','dng','col','emp','dng','emp','emp','col','wlx','wlx','wlx','wlx','col','dng','wly','xxx'],
		['xxx','wly','emp','dng','dng','dng','dng','dng','dng','dng','emp','emp','dng','dng','dng','wly','xxx'],
		['xxx','wly','dng','emp','emp','dng','emp','emp','dng','emp','dng','dng','dng','emp','dng','wly','xxx'],
		['xxx','wly','dng','dng','dng','emp','dng','dng','dng','dng','dng','emp','emp','dng','dng','wly','xxx'],
		['xxx','wly','emp','emp','dng','dng','emp','dng','emp','dng','emp','dng','dng','emp','emp','wly','xxx'],
		['xxx','wly','dng','dng','emp','emp','dng','dng','dng','dng','dng','dng','dng','emp','emp','wly','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
	]
	entities[0] = [Tags.et_water_wisp, 4, 4]
	entities[1] = [Tags.et_water_wisp, 5, 4]
	entities[2] = [Tags.et_water_wisp, 4, 5]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(16,12), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(1,3.5))
		[Vector2(16,13), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(1,3.5))
		_:
			pass
