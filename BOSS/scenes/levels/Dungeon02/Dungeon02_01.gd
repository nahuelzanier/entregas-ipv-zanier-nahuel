extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "WATERWAY"
	player_spawn = Vector2(11, 28)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.cave_bgm
	bg = "black"

	triggers[Vector2(26,17)] = ["generate_map", $"../../Island01/Island02", Vector2(25,17)]
	triggers[Vector2(25,23)] = ["generate_map", $"../../Island01/Island02", Vector2(25,22)]
	triggers[Vector2(15,18)] = ["generate_map", $"../../Island01/Island02", Vector2(16,18)]
	triggers[Vector2(10,25)] = ["generate_map", $"../Dungeon02_02", Vector2(10,8)]
	triggers[Vector2(3,20)] = ["generate_map", $"../../Island01/Island02", Vector2(3,20)]
	triggers[Vector2(4,21)] = ["generate_map", $"../Dungeon02_02", Vector2(6,9)]

func create_entities():
	.create_entities()
	var sign01 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign01.text = "WRONG WAY!"
	CurrentMap.map_manager.place_entity(sign01, Vector2(21,7))

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.cave_bgm, 0.1)
