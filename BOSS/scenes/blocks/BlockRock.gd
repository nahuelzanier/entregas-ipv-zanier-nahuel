extends "res://scenes/blocks/BlockAbstract.gd"

var unlift_alt

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.bl_rock
	unlift = Tags.et_rock
	unlift_alt = Tags.et_sinking_rock

func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	if tile.unlift_rock():
		if tile.sinks_rock():
			player.unlift_entity(unlift_alt)
		else:
			player.unlift_entity(unlift)
		
