extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_wand
	tag = Tags.et_wand_water
	block = Tags.bl_wand_water
	transform()

func transform():
	CurrentMap.map[current_tile].wand(self)

func wand_effect(tile_pos):
	CurrentMap.map_manager.replace(Tags.fl_water, tile_pos)
