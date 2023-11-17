extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "FISHER'S VILLA"
	player_spawn = Vector2(21.5, 32)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.island_bgm
	bg = "deep_blue"

	triggers[Vector2(21,33)] = ["generate_map", $"../Island01", Vector2(18,1)]
	triggers[Vector2(22,33)] = ["generate_map", $"../Island01", Vector2(19,1)]
	triggers[Vector2(5,30)] = ["generate_map", $"../Island03", Vector2(18,8)]
	triggers[Vector2(5,29)] = ["generate_map", $"../Island03", Vector2(18,7)]
	triggers[Vector2(28,12)] = ["generate_map", $"../../Furnace01/Furnace01", Vector2(2,20)]
	triggers[Vector2(26,17)] = ["generate_map", $"../../Dungeon02/Dungeon02_01", Vector2(26,18)]
	triggers[Vector2(25,23)] = ["generate_map", $"../../Dungeon02/Dungeon02_01", Vector2(25,24)]
	triggers[Vector2(15,18)] = ["generate_map", $"../../Dungeon02/Dungeon02_01", Vector2(16,18)]
	triggers[Vector2(3,21)] = ["generate_map", $"../../Dungeon02/Dungeon02_01", Vector2(3,21)]
	triggers[Vector2(33,15)] = ["generate_map", $"../Jungle01", Vector2(1,11)]
	triggers[Vector2(33,16)] = ["generate_map", $"../Jungle01", Vector2(1,12)]
	triggers[Vector2(33,17)] = ["generate_map", $"../Jungle01", Vector2(1,13)]
	triggers[Vector2(8,6)] = ["generate_map", $"../../SaltMines01/SaltMines01_01", Vector2(5,48)]
	triggers[Vector2(21,0)] = ["generate_map", $"../../Canyon01/Canyon01_03", Vector2(29,31)]
	triggers[Vector2(22,0)] = ["generate_map", $"../../Canyon01/Canyon01_03", Vector2(30,31)]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.island_bgm, 0.1)
