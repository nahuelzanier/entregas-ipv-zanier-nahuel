extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner
onready var time_lapse = $"../../TimeLapse"

func _ready():
	map_tag_name = "CASTAWAY"
	player_spawn = Vector2(8,8)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

	triggers[Vector2(6,0)] = ["generate_map", $"../Island01/Island03", Vector2(7,13)]
	triggers[Vector2(7,0)] = ["generate_map", $"../Island01/Island03", Vector2(7,13)]

func create_entities():
	.create_entities()
	var sign01 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign01.text = "HOLD SPACE TO PICK UP OBJECTS"
	CurrentMap.map_manager.place_entity(sign01, Vector2(7,9))
	var sign02 = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign02.text = "HOP ON A PALMTREE AND SURF AWAY"
	CurrentMap.map_manager.place_entity(sign02, Vector2(6,4))

func trigger_level_locations(iso_position, tag):
	.trigger_level_locations(iso_position, tag)
	time_lapse.time_lapse_effect()
