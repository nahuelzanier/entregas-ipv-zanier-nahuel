extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "CANYON - 2"
	player_spawn = Vector2(6,35)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.canyon_bgm
	bg = "deep_blue"

	triggers[Vector2(5,35)] = ["generate_map", $"../../Canyon01/Canyon01_01", Vector2(13,5)]
	triggers[Vector2(8,5)] = ["generate_map", $"../../Canyon01/Canyon01_03", Vector2(4,29)]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.canyon_bgm, 0.1)
