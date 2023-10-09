extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_wall
	tag = Tags.fl_wall_x

func _process(delta): pass

func get_lifted(player): pass

func get_lifted_with_entity(player): pass

func create_detail():
	CurrentMap.map_manager.create_entity(Tags.et_wall_x, iso_x, iso_y)

func unlift_wisp(player):pass
