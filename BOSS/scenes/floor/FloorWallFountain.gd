extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_fountain

func _process(delta): pass

func get_lifted(player): pass

func get_lifted_with_entity(player): pass

#TILES
func born_empty_tile(tile):
	CurrentMap.map_manager.replace(Tags.fl_water, tile.iso_x, tile.iso_y)

func unlift_wisp(player):pass
