extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	player_spawn = Vector2(4.5,6)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxx','wly','dng','emp','dng','dng','dng','emp','dng','dng','dng','dng','emp','dng','dng','emp','dng','emp','dng','emp','h2o','wly','xxx'],
		['xxx','wly','dng','dng','dng','dng','dng','emp','dng','dng','dng','dng','emp','dng','dng','emp','dng','dng','dng','dng','emp','wly','xxx'],
		['xxx','wly','dng','emp','dng','dng','dng','emp','dng','dng','dng','dng','emp','dng','dng','dng','dng','dng','emp','dng','emp','wly','xxx'],
		['xxx','wly','emp','dng','stn','stn','dng','emp','dng','emp','dng','dng','dng','dng','emp','dng','dng','dng','dng','emp','dng','wly','xxx'],
		['xxx','col','wlx','wlx','drl','drr','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','emp','col','wlx','col','xxx'],
		['xxx','xxx','xxx','xxb','xxa','xxa','xxb','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxb','wly','sal','dng','emp','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxa','drn','emp','dng','dng','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxa','drs','dng','dng','emp','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxb','wly','dng','emp','dng','wly','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','col','wlx','wlx','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
	]
	entities[0] = [Tags.et_salt_pillar, 18, 7]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()

func trigger_level_locations(iso_position):
	match iso_position:
		Vector2(4,7):
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(4.5,1))
		Vector2(5,7):
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(4.5,1))
		Vector2(16,8):
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(15,3.5))
		Vector2(16,9):
			CurrentMap.call_deferred("generate_map", $"../Room02", Vector2(15,3.5))
		_:
			pass
