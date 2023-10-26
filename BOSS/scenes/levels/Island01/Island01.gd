extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner


var whirlpool = {}

func _ready():
	map_tag_name = "island 1-1"
	player_spawn = Vector2(11,52)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	
	triggers[Vector2(18,0)] = ["generate_map", $"../Island02", Vector2(21,32)]
	triggers[Vector2(19,0)] = ["generate_map", $"../Island02", Vector2(22,32)]
	triggers[Vector2(10,26)] = ["generate_map", $"../../Dungeon01/Room01", Vector2(2,8)]
	
	#whirlpool (15,7) (26,7) (15,19) (26,19)
	for y in range(7, 20):
		for x in range(15, 27):
			whirlpool[Vector2(x,y)] = map[Vector2(x,y)]


func stop_whirlpool():
	for v2 in whirlpool.keys():
		map[v2] = Tags.fl_water

func start_whirlpool():
	for v2 in whirlpool.keys():
		map[v2] = whirlpool[v2]
