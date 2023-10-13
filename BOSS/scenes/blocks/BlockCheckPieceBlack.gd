extends "res://scenes/blocks/BlockAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.bl_chkr_blpiece
	unlift = Tags.et_chkr_black

func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	if tile.unlift_rock():
		player.unlift_entity(unlift)
