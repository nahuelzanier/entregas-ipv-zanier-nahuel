extends "res://scenes/blocks/BlockAbstract.gd"

var unlift_alt

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.bl_palmtree
	unlift = Tags.et_palmtree
	unlift_alt = Tags.et_palmtree_sink

func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	if tile.unlift_palmtree():
		if tile.sinks_palmtree():
			player.unlift_entity(unlift_alt)
		else:
			player.unlift_entity(unlift)
