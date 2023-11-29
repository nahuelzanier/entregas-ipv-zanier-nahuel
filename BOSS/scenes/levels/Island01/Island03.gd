extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "SEASIDE CLIFFS"
	player_spawn = Vector2(7, 13)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.island_bgm
	bg = "deep_blue"

	triggers[Vector2(19,7)] = ["generate_map", $"../Island02", Vector2(6,29)]
	triggers[Vector2(19,8)] = ["generate_map", $"../Island02", Vector2(6,30)]
	triggers[Vector2(12,6)] = ["generate_map", $"../../SideAreas01/SideCave01", Vector2(8,12)]
	triggers[Vector2(9,16)] = ["generate_map", $"../Island01", Vector2(5,1)]
	triggers[Vector2(10,16)] = ["generate_map", $"../Island01", Vector2(6,1)]
	triggers[Vector2(5,10)] = ["generate_map", $"../../Tutorial01/Tutorial05", Vector2(12,9)]

func create_entities():
	.create_entities()
	var sign01 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign01.text = "TO THE VILLAGE"
	CurrentMap.map_manager.place_entity(sign01, Vector2(16,7))

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		if GlobalAudio.initial_delay:
			GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.island_bgm, 8)
			GlobalAudio.initial_delay = false
		else:
			GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.island_bgm, 0.1)
