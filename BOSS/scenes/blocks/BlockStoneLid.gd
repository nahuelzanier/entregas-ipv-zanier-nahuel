extends "res://scenes/blocks/BlockAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.bl_stone_lid
	unlift = Tags.et_stone_lid

func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	if tile.unlift_rock():
		player.unlift_entity(unlift)
		
