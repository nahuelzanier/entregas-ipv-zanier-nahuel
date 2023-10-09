extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	player_spawn = Vector2(10,11)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','drl','drr','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxx','wly','dng','dng','dng','emp','dng','dng','dng','dng','dng','dng','emp','dng','dng','wly','xxx'],
		['xxx','wly','dng','emp','dng','dng','dng','dng','emp','dng','emp','dng','dng','emp','dng','wly','xxx'],
		['xxx','wly','emp','dng','dng','dng','emp','emp','emp','emp','dng','dng','dng','dng','emp','wly','xxx'],
		['xxx','wly','dng','emp','dng','dng','dng','dng','dng','dng','dng','dng','emp','dng','emp','wly','xxx'],
		['xxx','wly','emp','dng','dng','emp','dng','emp','dng','dng','dng','emp','dng','emp','dng','wly','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','col','emp','dng','dng','emp','col','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','dng','dng','emp','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','emp','dng','dng','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','dng','dng','emp','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','dng','dng','dng','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','col','wlx','drl','drr','wlx','col','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
	]

func create_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()

func trigger_level_locations(iso_position):
	match iso_position:
		Vector2(10,12):
			CurrentMap.generate_map($"../Dungeon01", Vector2(10,7))
		Vector2(11,12):
			CurrentMap.generate_map($"../Dungeon01", Vector2(11,7))
