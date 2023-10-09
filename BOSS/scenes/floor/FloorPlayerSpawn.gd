extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_player

func _process(delta): pass

func get_lifted(player): pass

func get_lifted_with_entity(player): pass

func create_detail():
	CurrentMap.map_manager.create_entity(Tags.et_player, iso_x, iso_y)
	CurrentMap.player_spawn = Vector2(iso_x,iso_y)

func unlift_wisp(player):pass
