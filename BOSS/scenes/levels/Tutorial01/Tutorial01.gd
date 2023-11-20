extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner
onready var time_lapse = $"../../../TimeLapse"

func _ready():
	map_tag_name = "STRANGE ISLAND"
	player_spawn = Vector2(11,16)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.island_bgm
	bg = "deep_blue"

	triggers[Vector2(10,12)] = ["generate_map", $"../Tutorial02", Vector2(2,10)]

func create_entities():
	.create_entities()
	var sign01 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign01.text = "HOLD BUTTON FOR PICKING UP!"
	CurrentMap.map_manager.place_entity(sign01, Vector2(9,13))

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		if GlobalAudio.initial_delay:
			GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.island_bgm, 8)
			GlobalAudio.initial_delay = false
		else:
			GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.island_bgm, 0.1)
