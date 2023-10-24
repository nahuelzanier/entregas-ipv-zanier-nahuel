extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_trap_door
	block = Tags.bl_empty


func get_lifted(player):
	update_tile()
	current_tile.get_lifted(player)
	update_tile()

func button_active_effect(button):
	destroy_self()
	CurrentMap.map_manager.call_deferred("replace", Tags.fl_trap_door, current_tile.iso_pos)
	
func bottomless_pit(pit):pass
