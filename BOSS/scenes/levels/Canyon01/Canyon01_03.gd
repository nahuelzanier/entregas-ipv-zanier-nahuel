extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "RIVER'S END"
	player_spawn = Vector2(4,29)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.island_bgm
	bg = "deep_blue"
	
	triggers[Vector2(3,29)] = ["generate_map", $"../../Canyon01/Canyon01_02", Vector2(8,6)]
	triggers[Vector2(29,32)] = ["generate_map", $"../../Island01/Island02", Vector2(21,1)]
	triggers[Vector2(30,32)] = ["generate_map", $"../../Island01/Island02", Vector2(22,1)]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.island_bgm, 0.1)
