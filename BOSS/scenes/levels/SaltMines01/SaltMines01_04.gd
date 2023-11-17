extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "SALT STORAGE"
	player_spawn = Vector2(12, 17)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.cave_bgm
	bg = "black"
	
	triggers[Vector2(11,16)] = ["generate_map", $"../SaltMines01_01", Vector2(3,3)]
	triggers[Vector2(20,10)] = ["generate_map", $"../SaltMines01_02", Vector2(7,6)]
	triggers[Vector2(21,10)] = ["generate_map", $"../SaltMines01_02", Vector2(7,6)]
	triggers[Vector2(22,10)] = ["generate_map", $"../SaltMines01_02", Vector2(7,6)]
	triggers[Vector2(20,24)] = ["generate_map", $"../SaltMines01_03", Vector2(5,16)]
	triggers[Vector2(20,25)] = ["generate_map", $"../SaltMines01_03", Vector2(5,16)]
	triggers[Vector2(20,26)] = ["generate_map", $"../SaltMines01_03", Vector2(5,16)]
	triggers[Vector2(11,3)] = ["generate_map", $"../SaltMines01_05", Vector2(6,24)]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.cave_bgm, 0.1)
