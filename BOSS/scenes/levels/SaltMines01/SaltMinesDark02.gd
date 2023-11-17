extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "DARK ROOM ??"
	player_spawn = Vector2(10, 14)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.cave_bgm
	bg = "black"

	triggers[Vector2(14,0)] = ["generate_map", $"../../Island01/Island02", Vector2(11,4)]
	triggers[Vector2(9,13)] = ["generate_map", $"../SaltMines01_01", Vector2(32,32)]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.cave_bgm, 0.1)
