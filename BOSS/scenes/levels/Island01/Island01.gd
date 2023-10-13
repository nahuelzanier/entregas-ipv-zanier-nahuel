extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "island 1-1"
	player_spawn = Vector2(14,42)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','VVV','<<<','<<<','<<<','<<<','<<<','<<<','<<<','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','VVV','VVV','<<<','<<<','<<<','<<<','<<<','AAA','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','VVV','VVV','VVV','<<<','<<<','<<<','AAA','AAA','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','VVV','VVV','VVV','VVV','<<<','AAA','AAA','AAA','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','wly','emp','h2o','h2o','VVV','VVV','VVV','btm','AAA','AAA','AAA','AAA','h2o','h2o','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','def','wly','stn','h2o','h2o','VVV','VVV','>>>','>>>','AAA','AAA','AAA','AAA','h2o','h2o','col','wlx','col','bea','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','def','wly','stn','h2o','h2o','VVV','>>>','>>>','>>>','>>>','AAA','AAA','AAA','h2o','h2o','wly','btm','wly','bea','bea','h2o','h2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','def','wly','stn','h2o','h2o','>>>','>>>','>>>','>>>','>>>','>>>','AAA','AAA','h2o','h2o','wly','btm','wly','bea','bea','h2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','def','col','wlx','h2o','h2o','>>>','>>>','>>>','>>>','>>>','>>>','>>>','AAA','h2o','h2o','col','wlx','col','bea','bea','h2o','h2o','d2o','xxx'],
		['xxx','d2o','h2o','def','def','def','def','def','h2o','h2o','h2o','h2o','h2o','h2o','def','col','h2o','h2o','def','wly','bea','bea','bea','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','def','stn','stn','stn','def','h2o','h2o','h2o','h2o','def','h2o','h2o','def','wlx','wlx','col','def','def','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','def','stn','T-_','stn','def','def','def','h2o','def','def','def','h2o','def','def','def','def','bea','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','def','def','stn','stn','stn','def','def','def','col','def','def','def','col','def','def','def','bea','bea','bea','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','def','def','def','def','def','def','stn','def','def','def','emp','emp','bea','bea','bea','bea','bea','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','def','def','def','def','def','def','emp','emp','def','def','emp','emp','def','bea','bea','bea','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','h2o','def','def','def','def','h2o','col','def','def','def','col','def','def','def','def','def','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','h2o','stn','def','def','emp','stn','def','def','def','def','def','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','stn','def','def','def','emp','def','def','def','def','def','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','col','def','def','def','col','def','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','d2o','d2o','h2o','h2o','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','emp','emp','def','def','def','def','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','emp','emp','emp','def','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','emp','emp','emp','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','def','def','def','emp','emp','def','def','def','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','def','emp','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','h2o','h2o','def','emp','emp','def','def','def','def','def','def','def','bea','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','h2o','def','def','def','def','def','def','def','def','def','def','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','def','emp','def','def','def','def','def','def','def','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','h2o','h2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','def','emp','def','col','wlx','wlx','col','bea','bea','bea','bea','bea','bea','bea','def','def','def','def','bea','bea','h2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','h2o','def','def','wly','h2o','h2o','wly','bea','bea','bea','bea','bea','bea','bea','def','col','wlx','col','def','bea','h2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','h2o','h2o','def','wly','h2o','h2o','wly','def','bea','bea','bea','h2o','h2o','bea','bea','bea','def','wly','def','bea','h2o','d2o','xxx'],
		['xxx','d2o','h2o','h2o','h2o','h2o','h2o','h2o','wly','h2o','h2o','wly','def','def','bea','bea','bea','h2o','bea','def','col','wlx','col','bea','bea','h2o','d2o','xxx'],
		['xxx','d2o','d2o','h2o','h2o','h2o','h2o','h2o','col','h2o','h2o','wly','def','emp','def','bea','bea','h2o','bea','bea','def','def','def','bea','bea','h2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','wly','def','def','def','bea','bea','h2o','h2o','bea','bea','def','def','bea','bea','h2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','col','def','emp','def','bea','bea','bea','bea','h2o','bea','def','bea','bea','h2o','h2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','def','bea','bea','bea','h2o','bea','bea','bea','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','def','bea','bea','h2o','h2o','h2o','def','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','bea','h2o','h2o','h2o','def','h2o','h2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
]
	entities[0] = [Tags.et_stone_lid, 6, 15]
	var i = 100000
	for y in map.size():
		for x in map[y].size():
			if map[y][x] == Tags.fl_beach:
				if randi()%10 == 0:
					entities[i] = [Tags.et_palmtree, x, y]
					i += 1
			if map[y][x] == Tags.fl_default:
				if randi()%20 == 0:
					entities[i] = [Tags.et_rock, x, y]
					i += 1

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(6,15), tag]:
			CurrentMap.call_deferred("generate_map", $"../../Dungeon01/Room01", Vector2(2,10))
		_:
			pass

func stop_whirlpool():
	for y in range(4, 13, 1):
		for x in range(9, 17, 1):
			map[y][x] = Tags.fl_water
		
func start_whirlpool():
	var whirlpool = [
		['VVV','<<<','<<<','<<<','<<<','<<<','<<<','<<<'],
		['VVV','VVV','<<<','<<<','<<<','<<<','<<<','AAA'],
		['VVV','VVV','VVV','<<<','<<<','<<<','AAA','AAA'],
		['VVV','VVV','VVV','VVV','<<<','AAA','AAA','AAA'],
		['VVV','VVV','VVV','btm','AAA','AAA','AAA','AAA'],
		['VVV','VVV','>>>','>>>','AAA','AAA','AAA','AAA'],
		['VVV','>>>','>>>','>>>','>>>','AAA','AAA','AAA'],
		['>>>','>>>','>>>','>>>','>>>','>>>','AAA','AAA'],
		['>>>','>>>','>>>','>>>','>>>','>>>','>>>','AAA']]
	for y in range(4, 13, 1):
		for x in range(9, 17, 1):
			map[y][x] = whirlpool[y-4][x-9]
