extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner
onready var path_lit = false

func _ready():
	map_tag_name = "JUNGLE ???"
	player_spawn = Vector2(1,12)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.jungle_bgm
	bg = "green"
	
	triggers[Vector2(0,11)] = ["generate_map", $"../Island02", Vector2(32,15)]
	triggers[Vector2(0,12)] = ["generate_map", $"../Island02", Vector2(32,16)]
	triggers[Vector2(0,13)] = ["generate_map", $"../Island02", Vector2(32,17)]
	
	triggers[Vector2(12,0)] = ["generate_map", $"../Jungle01", Vector2(12,25)]
	triggers[Vector2(13,0)] = ["generate_map", $"../Jungle01", Vector2(13,25)]
	triggers[Vector2(14,0)] = ["generate_map", $"../Jungle01", Vector2(14,25)]
	
	triggers[Vector2(26,11)] = ["generate_map", $"../Jungle01", Vector2(1,11)]
	triggers[Vector2(26,12)] = ["generate_map", $"../Jungle01", Vector2(1,12)]
	triggers[Vector2(26,13)] = ["generate_map", $"../Jungle01", Vector2(1,13)]
	
	triggers[Vector2(12,26)] = ["generate_map", $"../Jungle01", Vector2(12,1)]
	triggers[Vector2(13,26)] = ["generate_map", $"../Jungle01", Vector2(13,1)]
	triggers[Vector2(14,26)] = ["generate_map", $"../Jungle01", Vector2(14,1)]

func light_the_path():
	if !path_lit:
		path_lit = true
		randomize()
		var path = randi()%3
		if path == 0:
			entities[Vector2(12,1)] = Tags.et_torch_on
			entities[Vector2(14,1)] = Tags.et_torch_on
			triggers[Vector2(12,0)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(14,56)]
			triggers[Vector2(13,0)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(15,56)]
			triggers[Vector2(14,0)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(16,56)]
			$"../../Volcano01/Volcano01_01".volcano_return_path(Vector2(13,1))
		elif path == 1:
			entities[Vector2(25,11)] = Tags.et_torch_on
			entities[Vector2(25,13)] = Tags.et_torch_on
			triggers[Vector2(26,11)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(14,56)]
			triggers[Vector2(26,12)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(15,56)]
			triggers[Vector2(26,13)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(16,56)]
			$"../../Volcano01/Volcano01_01".volcano_return_path(Vector2(25,12))
		elif path == 2:
			entities[Vector2(12,25)] = Tags.et_torch_on
			entities[Vector2(14,25)] = Tags.et_torch_on
			triggers[Vector2(12,26)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(14,56)]
			triggers[Vector2(13,26)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(15,56)]
			triggers[Vector2(14,26)] = ["generate_map", $"../../Volcano01/Volcano01_01", Vector2(16,56)]
			$"../../Volcano01/Volcano01_01".volcano_return_path(Vector2(13,25))

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.jungle_bgm, 0.1)
