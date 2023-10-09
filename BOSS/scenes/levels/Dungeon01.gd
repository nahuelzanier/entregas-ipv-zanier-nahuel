extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	player_spawn = Vector2(5,10)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx','xxx','xxx','xxx','col','wlx','col','xxx'],
		['xxx','wly','dng','dng','dng','dng','dng','dng','wly','xxx','xxx','xxx','xxx','wly','dng','wly','xxx'],
		['xxx','wly','emp','emp','dng','emp','dng','emp','wly','xxx','xxx','xxx','xxx','wly','dng','wly','xxx'],
		['xxx','wly','dng','emp','emp','dng','emp','dng','wly','xxx','xxx','xxx','xxx','wly','emp','wly','xxx'],
		['xxx','wly','dng','dng','emp','emp','dng','emp','wly','xxx','xxx','xxx','xxx','wly','emp','wly','xxx'],
		['xxx','wly','dng','emp','emp','dng','emp','emp','col','wlx','drl','drr','wlx','col','dng','wly','xxx'],
		['xxx','wly','emp','dng','dng','dng','dng','dng','dng','dng','dng','dng','dng','dng','dng','wly','xxx'],
		['xxx','wly','dng','emp','emp','dng','emp','emp','dng','emp','dng','dng','dng','emp','dng','wly','xxx'],
		['xxx','wly','dng','dng','dng','emp','dng','dng','dng','dng','dng','emp','emp','dng','dng','wly','xxx'],
		['xxx','wly','emp','emp','dng','dng','emp','dng','emp','dng','emp','dng','dng','emp','emp','wly','xxx'],
		['xxx','wly','dng','dng','dng','dng','dng','dng','dng','dng','dng','dng','dng','emp','emp','wly','xxx'],
		['xxx','col','wlx','wlx','drl','drr','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
	]

func create_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()
