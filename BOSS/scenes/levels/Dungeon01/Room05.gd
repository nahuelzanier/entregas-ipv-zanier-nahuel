extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "dungeon01_room05"
	player_spawn = Vector2(10.5,23)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','col','stn','stn','stn','stn','stn','stn','wly','xxx'],
		['xxx','wly','h2o','h2o','h2o','h2o','emp','emp','emp','btm','btm','btm','btm','stn','wly','xxx'],
		['xxx','wly','h2o','h2o','h2o','h2o','emp','emp','emp','btm','btm','btm','btm','stn','wly','xxx'],
		['xxx','wly','h2o','h2o','h2o','h2o','emp','emp','emp','btm','btm','btm','btm','stn','wly','xxx'],
		['xxx','wly','h2o','h2o','h2o','h2o','emp','emp','emp','btm','btm','btm','btm','stn','wly','xxx'],
		['xxx','wly','h2o','h2o','h2o','h2o','emp','emp','emp','btm','btm','btm','btm','stn','wly','xxx'],
		['xxx','wly','h2o','h2o','h2o','h2o','emp','emp','emp','btm','btm','btm','btm','stn','wly','xxx'],
		['xxx','wly','h2o','h2o','h2o','h2o','emp','emp','emp','btm','btm','btm','btm','stn','wly','xxx'],
		['xxx','wly','h2o','h2o','h2o','h2o','stn','stn','stn','btm','btm','btm','btm','stn','wly','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','col','stn','stn','stn','stn','stn','stn','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','emp','emp','dng','emp','stn','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','dng','dng','dng','dng','dng','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','emp','emp','dng','emp','emp','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','dng','dng','emp','dng','emp','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','dng','emp','emp','emp','emp','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','emp','dng','emp','dng','emp','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','dng','dng','dng','emp','dng','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','emp','emp','dng','emp','emp','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','dng','dng','emp','dng','dng','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','emp','dng','dng','dng','dng','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','dng','stn','stn','dng','dng','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','col','wlx','wlx','drl','drr','wlx','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxb','xxa','xxa','xxb','xxx','xxx','xxx']
	]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(10,24), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(4.5,1))
		[Vector2(11,24), tag]:
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(4.5,1))
		_:
			pass
