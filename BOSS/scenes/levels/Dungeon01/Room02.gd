extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	player_spawn = Vector2(10,11)
	map = [
		['xxx','xxx','xxx','xxb','xxa','xxa','xxb','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','drl','drr','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxb','wly','dng','dng','stn','stn','dng','dng','dng','dng','dng','dng','emp','dng','dng','wly','xxb'],
		['xxa','drn','stn','emp','dng','dng','dng','dng','emp','dng','emp','dng','dng','emp','dng','drn','xxa'],
		['xxa','drs','stn','emp','dng','dng','emp','emp','emp','emp','dng','dng','dng','dng','emp','drs','xxa'],
		['xxb','wly','dng','emp','dng','dng','dng','dng','dng','dng','dng','dng','emp','dng','emp','wly','xxb'],
		['xxx','wly','emp','dng','dng','emp','dng','emp','dng','dng','dng','emp','dng','emp','dng','wly','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','col','emp','dng','dng','emp','col','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','dng','dng','emp','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','emp','dng','dng','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','dng','dng','dng','emp','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','emp','stn','stn','dng','wly','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','col','wlx','drl','drr','wlx','col','xxx','xxx','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxb','xxa','xxa','xxb','xxx','xxx','xxx','xxx']
	]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()
	c_map[1][4].switch_sprites()
	c_map[1][5].switch_sprites()

func trigger_level_locations(iso_position):
	match iso_position:
		Vector2(10,13):
			CurrentMap.call_deferred("generate_map", $"../Room01", Vector2(10.5,6))
		Vector2(11,13):
			CurrentMap.call_deferred("generate_map", $"../Room01", Vector2(10.5,6))
		Vector2(0,3):
			CurrentMap.call_deferred("generate_map", $"../Room03", Vector2(15,12.5))
		Vector2(0,4):
			CurrentMap.call_deferred("generate_map", $"../Room03", Vector2(15,12.5))
		Vector2(4,0):
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(4.5,6))
		Vector2(5,0):
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(4.5,6))
		Vector2(16,3):
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(17,8.5))
		Vector2(16,4):
			CurrentMap.call_deferred("generate_map", $"../Room04", Vector2(17,8.5))
		_:
			pass
