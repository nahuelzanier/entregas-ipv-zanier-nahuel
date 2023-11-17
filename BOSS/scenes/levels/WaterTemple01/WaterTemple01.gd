extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner
onready var path_lit = false

func _ready():
	map_tag_name = "WATER TEMPLE"
	player_spawn = Vector2(15,5)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.side_bgm
	bg = "black"

	triggers[Vector2(15,4)] = ["generate_map", $"../Island01", Vector2(19,42)]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.side_area, 0.1)
