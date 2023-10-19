extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	map_tag_name = "island 1-1"
	player_spawn = Vector2(12,22)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','xxx','xxx','xxx','xxx','xxx'],
		['xxx','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','def','xxx','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','def','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','cl2','xxx','xxx','xxx','xxx'],
		['xxx','def','def','def','def','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','cl2','xxx','xxx','xxx'],
		['xxx','def','def','def','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','clf','cl2','xxx','xxx'],
		['xxx','def','def','def','clf','clf','clf','clf','clf','clf','clf','clf','clf','bea','bea','bea','bea','bea','clf','clf','clf','clf','bea','bea','cl2','xxb'],
		['xxx','def','def','cl2','def','clf','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','xxa'],
		['xxx','def','def','clf','cl2','d2o','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','bea','xxa'],
		['xxx','xxx','cl2','def','clf','d2o','d2o','bea','bea','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','d2o','bea','bea','h2o','bea','bea','d2o','xxb'],
		['xxx','xxx','def','cl2','d2o','d2o','d2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','d2o','h2o','d2o','h2o','bea','bea','h2o','h2o','h2o','d2o','xxx'],
		['xxx','xxx','xxx','cl2','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','h2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','d2o','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
]

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()

func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(25,21), tag]:
			CurrentMap.call_deferred("generate_map", $"../Island02", Vector2(5,21))
		[Vector2(25,22), tag]:
			CurrentMap.call_deferred("generate_map", $"../Island02", Vector2(5,22))	
