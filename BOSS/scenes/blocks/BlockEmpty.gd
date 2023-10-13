extends "res://scenes/blocks/BlockAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.bl_empty
	unlift = Tags.fl_empty

func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	if tile.entities.size() == 0:
		tile.get_lifted(player)
	else:
		tile.get_lifted_with_entity(player)
