extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "THANKS FOR PLAYING!!"
	player_spawn = Vector2(26,25)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.side_bgm
	bg = "red"

	triggers[Vector2(26,27)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(13,18)]


func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.side_area, 0.1)
