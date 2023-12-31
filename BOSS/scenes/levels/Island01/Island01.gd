extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner


var whirlpool = {}

func _ready():
	map_tag_name = "THE WHIRLPOOL"
	player_spawn = Vector2(11,52)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.island_bgm
	bg = "deep_blue"
	
	triggers[Vector2(18,0)] = ["generate_map", $"../Island02", Vector2(21,32)]
	triggers[Vector2(19,0)] = ["generate_map", $"../Island02", Vector2(22,32)]
	triggers[Vector2(10,26)] = ["generate_map", $"../../Dungeon01/Room01", Vector2(2,8)]
	triggers[Vector2(5,0)] = ["generate_map", $"../Island03", Vector2(9,15)]
	triggers[Vector2(6,0)] = ["generate_map", $"../Island03", Vector2(10,15)]
	triggers[Vector2(19,43)] = ["generate_map", $"../WaterTemple01", Vector2(15,5)]
	
	#whirlpool (15,7) (26,7) (15,19) (26,19)
	for y in range(7, 19):
		for x in range(15, 27):
			whirlpool[Vector2(x,y)] = map[Vector2(x,y)]


func stop_whirlpool():
	for v2 in whirlpool.keys():
		map[v2] = Tags.fl_water

func start_whirlpool():
	for v2 in whirlpool.keys():
		map[v2] = whirlpool[v2]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.island_bgm, 0.1)
