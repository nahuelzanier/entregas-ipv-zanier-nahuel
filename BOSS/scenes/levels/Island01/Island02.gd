extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "island 1-1"
	player_spawn = Vector2(12,22)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','xxx'],
		['xxx','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','xxx','clf','clf','clf','clf','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','xxx','xxx','clf','clf','clf','clf','clf','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx'],
		['xxx','xxx','xxx','xxx','clf','clf','clf','clf','clf','clf','def','def','def','def','bea','bea','def','def','def','def','bea','bea','bea','def','xxx'],
		['xxx','xxx','xxx','xxx','xxb','clf','clf','clf','clf','clf','clf','clf','bea','bea','bea','h2o','bea','def','def','def','def','bea','bea','def','xxx'],
		['xxx','xxx','xxx','xxx','xxa','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','h2o','bea','wlx','col','bea','bea','bea','bea','bea','xxx'],
		['xxx','xxx','xxx','xxx','xxa','bea','bea','bea','bea','bea','bea','col','bea','col','bea','h2o','bea','bea','wly','bea','bea','bea','bea','bea','xxx'],
		['xxx','xxx','xxx','xxx','xxb','d2o','bea','bea','h2o','h2o','h2o','wly','stn','wly','h2o','h2o','h2o','d2o','wly','bea','h2o','bea','bea','h2o','xxx'],
		['xxx','xxx','xxx','xxx','xxx','d2o','h2o','h2o','h2o','h2o','h2o','wly','stn','wly','d2o','wly','d2o','h2o','wly','bea','h2o','h2o','h2o','h2o','xxx'],
		['xxx','xxx','xxx','xxx','xxx','d2o','d2o','d2o','d2o','d2o','d2o','wly','stn','wly','d2o','wly','d2o','d2o','wly','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxb','xxa','xxb','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()

func trigger_level_locations(iso_position, tag):
	if iso_position.y == 26 and tag == self.map_tag_name:
			CurrentMap.call_deferred("generate_map", $"../Island01", Vector2(iso_position.x,1))
	match [iso_position, self.map_tag_name]:
		[Vector2(4,21), tag]:
			CurrentMap.call_deferred("generate_map", $"../Island03", Vector2(24,21))
		[Vector2(4,22), tag]:
			CurrentMap.call_deferred("generate_map", $"../Island03", Vector2(24,22))	
