extends "res://scenes/floor/FloorAbstract.gd"

onready var button_counter = 1

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_trap_door
	if previous_tile == null:
		previous_tile = Tags.fl_empty

func _process(delta): pass

func get_lifted(player): pass

func get_lifted_with_entity(player): pass

func unlift_wisp(player):pass

func button_active_effect(button):pass

func button_inactive_effect(button):
	CurrentMap.map_manager.call_deferred("replace", previous_tile, iso_pos)
	CurrentMap.map_manager.call_deferred("create_entity", Tags.et_trap_door, iso_pos)

func allows_lifting():
	false
