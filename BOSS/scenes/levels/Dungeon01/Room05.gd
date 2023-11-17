extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "THE DRAIN - 5"
	player_spawn = Vector2(10,23)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.cave_bgm
	bg = "black"

	triggers[Vector2(10,24)] = ["generate_map", $"../Room04", Vector2(4.5,1)]
	triggers[Vector2(11,24)] = ["generate_map", $"../Room04", Vector2(4.5,1)]

func update_maps():
	if (map[Vector2(8,3)] != Tags.fl_water
	 && map[Vector2(8,5)] != Tags.fl_water
	 && map[Vector2(8,7)] != Tags.fl_water
	 && map[Vector2(8,9)] != Tags.fl_water
	):
		$"../../Island01/Island01".stop_whirlpool()
	else:
		$"../../Island01/Island01".start_whirlpool()

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.cave_bgm, 0.1)
