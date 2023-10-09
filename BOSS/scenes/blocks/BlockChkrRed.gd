extends "res://scenes/blocks/BlockAbstract.gd"

func _ready():
	tag = Tags.bl_chkr_red
	unlift = Tags.fl_chkr_red

func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	if tile.entities.size() == 0:
		tile.get_lifted(player)
	else:
		tile.get_lifted_with_entity(player)
