extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "MAYBE LOOK AROUND?"
	player_spawn = Vector2(27, 18)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.cave_bgm
	bg = "black"
	
	triggers[Vector2(31,4)] = ["generate_map", $"../../Island01/Island02", Vector2(11,4)]
	triggers[Vector2(26,17)] = ["generate_map", $"../SaltMines01_01", Vector2(32,32)]
	triggers[Vector2(4,16)] = ["generate_map", $"../SaltMines01_04", Vector2(19,24)]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.cave_bgm, 0.1)
