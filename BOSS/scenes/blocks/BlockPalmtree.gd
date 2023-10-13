extends "res://scenes/blocks/BlockAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.bl_palmtree
	unlift = Tags.et_palmtree

func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	if tile.unlift_palmtree():
		player.unlift_entity(unlift)
