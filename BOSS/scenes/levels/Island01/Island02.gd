extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "island 1-2"
	player_spawn = Vector2(21.5, 32)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()


func trigger_level_locations(iso_position, tag):
	match [iso_position, self.map_tag_name]:
		[Vector2(28,12), tag]:
			CurrentMap.call_deferred("generate_map", $"../../Furnace01/Furnace01", Vector2(2,20))
		_:
			pass
