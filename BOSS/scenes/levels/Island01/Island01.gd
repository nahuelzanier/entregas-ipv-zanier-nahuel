extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "island 1-1"
	player_spawn = Vector2(6,10)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','VVV','<<<','<<<','<<<','<<<','<<<','<<<','<<<','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','VVV','VVV','<<<','<<<','<<<','<<<','<<<','AAA','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','VVV','VVV','VVV','<<<','<<<','<<<','AAA','AAA','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','VVV','VVV','VVV','VVV','<<<','AAA','AAA','AAA','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','def','def','h2o','h2o','VVV','VVV','VVV','btm','AAA','AAA','AAA','AAA','h2o','h2o','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','def','def','def','h2o','h2o','VVV','VVV','>>>','>>>','AAA','AAA','AAA','AAA','h2o','h2o','def','def','def','bea','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','def','def','def','h2o','h2o','VVV','>>>','>>>','>>>','>>>','AAA','AAA','AAA','h2o','h2o','def','def','def','bea','bea','h2o','h2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','def','def','def','h2o','h2o','>>>','>>>','>>>','>>>','>>>','>>>','AAA','AAA','h2o','h2o','def','def','def','bea','bea','h2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','def','def','def','h2o','h2o','>>>','>>>','>>>','>>>','>>>','>>>','>>>','AAA','h2o','h2o','def','def','def','bea','bea','h2o','h2o','d2o','xxx'],
		['xxx','d2o','h2o','def','def','def','def','def','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','bea','bea','bea','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','def','def','def','def','def','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','def','def','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','bea','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','bea','h2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','def','def','def','def','def','def','def','def','def','def','def','def','bea','bea','bea','bea','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','bea','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','def','def','def','def','def','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','def','def','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','d2o','d2o','h2o','h2o','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','def','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','emp','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','h2o','h2o','def','emp','emp','def','def','def','def','def','def','def','bea','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','def','def','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','def','emp','def','def','def','def','def','def','def','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','h2o','h2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','def','emp','def','col','wlx','wlx','col','bea','bea','bea','bea','bea','bea','bea','def','def','def','def','bea','bea','h2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','h2o','def','def','wly','h2o','h2o','wly','bea','bea','bea','bea','bea','bea','bea','def','col','wlx','col','def','bea','h2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','h2o','h2o','def','wly','h2o','h2o','wly','def','bea','bea','bea','h2o','h2o','bea','bea','bea','def','wly','def','bea','h2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','h2o','h2o','h2o','wly','h2o','h2o','wly','def','def','bea','bea','bea','h2o','bea','def','col','wlx','col','bea','bea','h2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','h2o','h2o','h2o','col','h2o','h2o','wly','def','emp','def','bea','bea','h2o','bea','bea','def','def','def','bea','bea','h2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','wly','def','def','emp','bea','bea','h2o','h2o','bea','bea','def','def','bea','bea','h2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','col','def','emp','def','bea','bea','bea','bea','h2o','bea','def','bea','bea','h2o','h2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','def','bea','bea','bea','h2o','bea','bea','bea','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','def','bea','bea','h2o','h2o','h2o','def','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','bea','h2o','h2o','h2o','def','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
]
	entities[0] = [Tags.et_rock, 8, 15]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()

func trigger_level_locations(iso_position, tag): pass
