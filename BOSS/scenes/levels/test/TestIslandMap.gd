extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	player_spawn = Vector2(46,40)
	map = [
		['col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col'],
		['wly','def','def','def','def','def','def','def','def','def','def','def','def','def','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','wly'],
		['wly','def','def','def','def','chr','chb','chr','chb','chr','chb','chr','chb','def','h2o','h2o','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','h2o','wly'],
		['wly','def','def','def','def','chb','chr','chb','chr','chb','chr','chb','chr','def','h2o','bea','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','wly'],
		['wly','def','def','def','def','chr','chb','chr','chb','chr','chb','chr','chb','def','h2o','bea','bea','bea','h2o','h2o','bea','bea','bea','bea','bea','h2o','h2o','h2o','h2o','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','wly'],
		['wly','def','def','def','def','chb','chr','chb','chr','chb','chr','chb','chr','def','h2o','bea','bea','h2o','h2o','bea','bea','bea','bea','bea','bea','bea','bea','h2o','h2o','bea','bea','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','wly'],
		['wly','wlx','wlx','col','def','chr','chb','chr','chb','chr','chb','chr','chb','def','h2o','bea','h2o','h2o','h2o','h2o','h2o','h2o','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','wly'],
		['wly','def','emp','wly','def','chb','chr','chb','chr','chb','chr','chb','chr','def','h2o','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','bea','bea','bea','bea','bea','bea','bea','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','h2o','wly'],
		['wly','emp','def','wly','def','chr','chb','chr','chb','chr','chb','chr','chb','def','h2o','h2o','bea','h2o','col','wlx','wlx','wlx','wlx','col','def','def','def','bea','bea','bea','bea','def','def','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','h2o','wly'],
		['wly','def','emp','wly','def','chb','chr','chb','chr','chb','chr','chb','chr','def','h2o','bea','bea','h2o','wly','def','def','def','def','wly','def','def','def','def','bea','emp','def','def','def','def','bea','bea','h2o','bea','bea','h2o','h2o','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','wly'],
		['wly','emp','def','wly','def','def','def','def','def','def','def','def','def','def','h2o','bea','bea','def','wly','emp','def','def','def','emp','def','def','emp','def','def','def','def','def','emp','def','bea','bea','h2o','bea','bea','h2o','bea','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','wly'],
		['wly','def','wlx','col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','h2o','bea','bea','emp','wly','emp','def','def','def','wly','def','def','def','emp','def','emp','def','def','emp','emp','def','bea','bea','bea','bea','bea','bea','bea','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','wly'],
		['wly','emp','def','def','def','def','def','def','def','def','emp','def','emp','def','h2o','bea','bea','def','col','wlx','wlx','wlx','wlx','col','def','def','emp','def','def','def','emp','def','emp','emp','def','def','def','def','bea','bea','bea','bea','bea','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','wly'],
		['wly','emp','emp','def','emp','def','def','def','def','def','def','emp','emp','def','h2o','h2o','h2o','def','emp','def','def','emp','emp','def','def','def','def','def','emp','def','def','def','def','def','emp','def','def','emp','def','def','def','def','def','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','wly'],
		['wly','def','emp','def','def','def','def','col','wlx','def','wlx','wlx','wlx','col','h2o','h2o','h2o','def','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','def','def','def','def','emp','def','emp','def','def','def','def','def','def','def','bea','h2o','h2o','h2o','h2o','h2o','h2o','wly'],
		['wly','def','wlx','wlx','col','wlx','emp','wly','def','emp','def','wly','xxx','wly','h2o','h2o','h2o','h2o','def','def','def','def','emp','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','def','def','def','emp','def','def','def','def','bea','h2o','h2o','h2o','h2o','h2o','wly'],
		['wly','def','emp','emp','wly','emp','def','wly','def','emp','def','wly','xxx','wly','h2o','h2o','h2o','h2o','def','def','emp','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','def','def','def','emp','emp','def','def','def','def','bea','bea','h2o','h2o','h2o','wly'],
		['wly','def','emp','def','wly','def','emp','wly','def','emp','def','wly','xxx','wly','h2o','h2o','h2o','h2o','def','emp','def','emp','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','def','def','def','def','def','def','def','emp','def','bea','bea','bea','h2o','wly'],
		['wly','def','emp','def','wly','emp','emp','wly','emp','emp','emp','wly','xxx','wly','h2o','h2o','h2o','h2o','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','def','def','emp','emp','def','def','emp','def','def','bea','bea','h2o','wly'],
		['wly','emp','wlx','wlx','wly','def','def','wly','def','emp','def','wly','xxx','wly','h2o','h2o','h2o','h2o','h2o','emp','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','emp','def','def','def','def','def','def','def','def','bea','h2o','h2o','wly'],
		['wly','def','emp','def','wly','emp','def','col','wlx','wlx','wlx','col','xxx','wly','h2o','h2o','h2o','h2o','h2o','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','def','def','def','def','def','bea','bea','h2o','h2o','wly'],
		['wly','def','emp','emp','wly','def','def','def','def','wly','xxx','xxx','xxx','wly','h2o','h2o','h2o','h2o','def','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','def','def','emp','def','emp','def','bea','bea','h2o','h2o','wly'],
		['wly','emp','emp','emp','wly','def','emp','emp','def','wly','xxx','xxx','xxx','wly','h2o','bea','bea','def','emp','def','def','emp','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','emp','emp','def','def','def','emp','def','def','bea','bea','h2o','h2o','wly'],
		['wly','def','wlx','wlx','wly','emp','emp','def','emp','wly','xxx','xxx','xxx','wly','h2o','bea','bea','def','def','def','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','emp','emp','def','def','def','def','def','def','bea','bea','h2o','h2o','wly'],
		['wly','h2o','h2o','h2o','col','wlx','wlx','wlx','wlx','col','xxx','xxx','xxx','wly','h2o','h2o','bea','bea','def','def','emp','def','def','def','def','emp','emp','emp','lav','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','def','def','def','def','emp','def','def','def','bea','bea','bea','h2o','wly'],
		['wly','h2o','h2o','h2o','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','bea','bea','def','emp','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','emp','emp','emp','def','def','emp','def','def','bea','bea','h2o','h2o','wly'],
		['wly','h2o','h2o','h2o','wly','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','bea','bea','bea','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','emp','emp','emp','def','def','emp','def','def','bea','bea','h2o','h2o','wly'],
		['col','wlx','wlx','wlx','col','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','bea','bea','bea','def','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','emp','def','def','def','emp','def','def','bea','bea','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','h2o','bea','bea','bea','def','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','def','def','def','def','def','def','bea','bea','h2o','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','h2o','bea','bea','bea','def','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','emp','emp','emp','def','def','def','def','def','bea','h2o','h2o','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','h2o','h2o','bea','bea','def','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','def','def','def','def','def','def','emp','def','def','bea','h2o','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','h2o','h2o','bea','bea','def','def','def','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','cru','emp','emp','emp','def','emp','def','def','emp','emp','def','def','def','bea','bea','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','h2o','h2o','bea','bea','def','emp','def','emp','def','def','emp','emp','emp','emp','emp','emp','emp','cru','def','def','def','def','emp','emp','emp','emp','def','def','def','def','bea','h2o','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','h2o','h2o','bea','bea','def','def','emp','def','emp','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','emp','col','def','col','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','h2o','bea','bea','bea','def','def','def','def','emp','def','def','def','emp','emp','def','def','def','emp','emp','def','def','emp','def','def','def','def','def','def','def','def','def','bea','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','bea','bea','h2o','bea','bea','def','bea','def','def','def','def','emp','def','def','emp','def','def','def','def','def','def','bea','bea','bea','def','bea','bea','bea','def','col','bea','col','bea','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','bea','bea','bea','h2o','bea','h2o','bea','bea','bea','def','emp','def','def','def','def','emp','def','def','bea','emp','def','bea','bea','def','bea','bea','bea','bea','bea','bea','h2o','bea','bea','bea','bea','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','bea','bea','bea','h2o','bea','h2o','h2o','bea','bea','def','def','emp','def','emp','def','def','emp','def','bea','bea','bea','bea','bea','bea','bea','bea','bea','h2o','bea','bea','bea','bea','bea','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','bea','bea','bea','bea','h2o','h2o','bea','bea','emp','def','bea','bea','def','emp','def','def','def','bea','bea','bea','h2o','bea','bea','h2o','bea','h2o','h2o','h2o','bea','h2o','h2o','h2o','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','bea','h2o','h2o','bea','bea','h2o','h2o','h2o','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','col','h2o','col','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','bea','bea','h2o','bea','bea','bea','bea','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','wly','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','col','h2o','col','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','h2o','h2o','h2o','wly'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col']
	]

func create_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag != Tags.g_wall:
				if randi()%10 == 0:
					CurrentMap.map_manager.create_entity(Tags.et_wisp, x, y)
			else:
				c_map[y][x].create_detail()
