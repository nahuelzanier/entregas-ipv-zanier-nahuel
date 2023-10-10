extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	player_spawn = Vector2(4.5,12)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx','xxx','xxx','xxx','col','wlx','col','xxx'],
		['xxx','wly','dng','dng','dng','dng','dng','dng','wly','xxx','xxx','xxx','xxx','wly','dng','wly','xxx'],
		['xxx','wly','emp','emp','dng','emp','dng','emp','wly','xxx','xxx','xxx','xxx','wly','dng','wly','xxx'],
		['xxx','wly','dng','emp','emp','dng','emp','dng','wly','xxx','xxx','xxx','xxx','wly','emp','wly','xxx'],
		['xxx','wly','dng','dng','emp','emp','dng','emp','wly','xxb','xxa','xxa','xxb','wly','emp','wly','xxx'],
		['xxx','wly','dng','emp','emp','dng','emp','emp','col','wlx','drl','drr','wlx','col','dng','wly','xxx'],
		['xxx','wly','emp','dng','dng','dng','dng','dng','dng','dng','stn','stn','dng','dng','dng','wly','xxx'],
		['xxx','wly','dng','emp','emp','dng','emp','emp','dng','emp','dng','dng','dng','emp','dng','wly','xxx'],
		['xxx','wly','dng','dng','dng','emp','dng','dng','dng','dng','dng','emp','emp','dng','dng','wly','xxx'],
		['xxx','wly','emp','emp','dng','dng','emp','dng','emp','dng','emp','dng','dng','emp','emp','wly','xxx'],
		['xxx','wly','dng','dng','stn','stn','dng','dng','dng','dng','dng','dng','dng','emp','emp','wly','xxx'],
		['xxx','col','wlx','wlx','drl','drr','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
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

func trigger_level_locations(iso_position):
	match iso_position:
		Vector2(10,5):
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(10.5,12))
		Vector2(11,5):
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(10.5,12))
		_:
			pass
