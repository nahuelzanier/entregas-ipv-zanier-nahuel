extends "res://scenes/blocks/BlockAbstract.gd"

var text

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.bl_sign
	unlift = Tags.et_sign

func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	if tile.unlift_rock():
		if tile.sinks_rock():
			player.unlift_sign(unlift, text)
		else:
			player.unlift_sign(unlift, text)
		
