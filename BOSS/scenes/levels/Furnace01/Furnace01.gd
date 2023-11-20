extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

var torches = [Vector2(12,9), Vector2(16,9), Vector2(14,6), Vector2(13,3), Vector2(15,3),
Vector2(20,16), Vector2(23,16), Vector2(20,26), Vector2(23,26), Vector2(24,20), Vector2(24,22),
Vector2(28,22), Vector2(28,20)]

func _ready():
	map_tag_name = "LIGHT ALL TORCHES"
	player_spawn = Vector2(2, 20)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()
	bgm = GlobalAudio.jungle_bgm
	bg = "red"

	triggers[Vector2(2,19)] = ["generate_map", $"../../Island01/Island02", Vector2(28,11)]

func update_maps():
	var all_lit = true
	for v in torches:
		all_lit = all_lit && entities[v] == Tags.et_torch_on
	if all_lit:
		$"../../Island01/Jungle01".light_the_path()
		$"../../Island01/Jungle02".light_the_path()
		$"../../Island01/Jungle03".light_the_path()

func play_bgm():
	GlobalAudio.update_bgm(bgm)
	if GlobalAudio.previous_bgm != GlobalAudio.ongoing_bgm:
		GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.jungle_bgm, 0.1)
