extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "TUTORIAL - 4"
	player_spawn = Vector2(2,8)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.side_bgm
	bg = "black"
	
	triggers[Vector2(1,9)] = ["generate_map", $"../Tutorial04", Vector2(20,6)]
	triggers[Vector2(13,9)] = ["generate_map", $"../../Island01/Island03", Vector2(6,10)]

func create_entities():
	.create_entities()
	var sign01 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign01.text = "FIND THE 7 WANDS"
	CurrentMap.map_manager.place_entity(sign01, Vector2(7,8))
	var sign02 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign02.text = "NOW EXPLORE!!"
	CurrentMap.map_manager.place_entity(sign02, Vector2(11,8))
	
func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.side_area, 0.1)
