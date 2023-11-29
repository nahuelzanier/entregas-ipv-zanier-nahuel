extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "THE DRAIN - 1"
	player_spawn = Vector2(2,8)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.cave_bgm
	bg = "black"
	
	triggers[Vector2(10,5)] = ["generate_map", $"../Room02", Vector2(10.5,12)]
	triggers[Vector2(11,5)] = ["generate_map", $"../Room02", Vector2(10.5,12)]
	triggers[Vector2(2,7)] = ["generate_map", $"../../Island01/Island01", Vector2(10,25)]

func create_entities():
	.create_entities()
	var sign01 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign01.text = "WHIRLPOOL DRAIN"
	CurrentMap.map_manager.place_entity(sign01, Vector2(9,7))

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.cave_bgm, 0.1)
