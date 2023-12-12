extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "TUTORIAL - 3"
	player_spawn = Vector2(2,8)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.cave_bgm
	bg = "black"
	
	triggers[Vector2(3,14)] = ["generate_map", $"../Tutorial03", Vector2(5,1)]
	triggers[Vector2(21,6)] = ["generate_map", $"../Tutorial05", Vector2(2,9)]

func create_entities():
	.create_entities()
	var sign01 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign01.text = "BEWARE OF FIRE!!"
	CurrentMap.map_manager.place_entity(sign01, Vector2(2,11))
	var sign02 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign02.text = "WATER EATS SALT!"
	CurrentMap.map_manager.place_entity(sign02, Vector2(17,3))

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.cave_bgm, 0.1)
