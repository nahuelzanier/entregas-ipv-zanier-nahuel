extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "SALT MINES"
	player_spawn = Vector2(4, 48)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.cave_bgm
	bg = "black"
	
	triggers[Vector2(6,47)] = ["generate_map", $"../../Island01/Island02", Vector2(9,7)]
	triggers[Vector2(14,6)] = ["generate_map", $"../../Island01/Island02", Vector2(11,4)]
	triggers[Vector2(24,10)] = ["generate_map", $"../SaltMinesDark01", Vector2(10,14)]
	triggers[Vector2(33,32)] = ["generate_map", $"../SaltMinesDark02", Vector2(10,14)]
	triggers[Vector2(3,4)] = ["generate_map", $"../SaltMines01_04", Vector2(11,17)]

func create_entities():
	.create_entities()
	var sign01 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign01.text = "TORCH AHEAD"
	CurrentMap.map_manager.place_entity(sign01, Vector2(3,49))
	var sign02 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign02.text = "LIGHTS THE WHOLE MINE"
	CurrentMap.map_manager.place_entity(sign02, Vector2(3,2))

func update_maps():
	if (entities[Vector2(10,3)] == Tags.et_torch_on
	 && entities[Vector2(10,2)] == Tags.et_torch_on):
		triggers[Vector2(24,10)] = ["generate_map", $"../SaltMines01_02", Vector2(21,17)]
		triggers[Vector2(33,32)] = ["generate_map", $"../SaltMines01_03", Vector2(27,18)]

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.cave_bgm, 0.1)
