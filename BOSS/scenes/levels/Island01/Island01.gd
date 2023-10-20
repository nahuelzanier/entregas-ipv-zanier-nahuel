extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner


var whirlpool = {}

func _ready():
	map_tag_name = "island 1-1"
	player_spawn = Vector2(11,52)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	
	#whirlpool (15,7) (26,7) (15,19) (26,19)
	for y in range(7, 20):
		for x in range(15, 27):
			whirlpool[Vector2(x,y)] = map[Vector2(x,y)]

func trigger_level_locations(iso_position, tag):
	if iso_position.y == 0 and tag == self.map_tag_name:
			CurrentMap.call_deferred("generate_map", $"../Island02", Vector2(iso_position.x,25))
	match [iso_position, self.map_tag_name]:
		[Vector2(10,26), tag]:
			CurrentMap.call_deferred("generate_map", $"../../Dungeon01/Room01", Vector2(2,8))
		_:
			pass

func stop_whirlpool():
	for v2 in whirlpool.keys():
		map[v2] = Tags.fl_water

func start_whirlpool():
	for v2 in whirlpool.keys():
		map[v2] = whirlpool[v2]
