extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_wand
	tag = Tags.et_wand_mineral
	block = Tags.bl_wand_mineral
	CurrentMap.map_manager.replace(Tags.fl_salt, current_tile.iso_pos)
