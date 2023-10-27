extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_trap_door

func _process(delta): pass

func get_lifted(player): pass

func get_lifted_with_entity(player): pass

func unlift_wisp(player):pass

func button_inactive_effect(button):
	CurrentMap.map_manager.call_deferred("replace", Tags.fl_empty, iso_pos)
	CurrentMap.map_manager.call_deferred("create_entity", Tags.et_trap_door, iso_pos)
