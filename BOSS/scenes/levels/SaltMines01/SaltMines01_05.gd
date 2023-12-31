extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "MINERAL SHRINE"
	player_spawn = Vector2(6, 24)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.side_bgm
	bg = "black"

	triggers[Vector2(5,0)] = ["generate_map", $"../../Canyon01/Canyon01_01", Vector2(5,22)]
	triggers[Vector2(6,0)] = ["generate_map", $"../../Canyon01/Canyon01_01", Vector2(5,22)]
	triggers[Vector2(7,0)] = ["generate_map", $"../../Canyon01/Canyon01_01", Vector2(5,22)]
	triggers[Vector2(5,25)] = ["generate_map", $"../SaltMines01_04", Vector2(11,4)]
	triggers[Vector2(6,25)] = ["generate_map", $"../SaltMines01_04", Vector2(11,4)]
	triggers[Vector2(7,25)] = ["generate_map", $"../SaltMines01_04", Vector2(11,4)]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.side_area, 0.1)
