extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_wall
	tag = Tags.fl_door_right

func get_lifted(player): pass

func create_detail():
	CurrentMap.map_manager.create_entity(Tags.et_door_right, iso_x, iso_y)
