extends "res://scenes/blocks/BlockAbstract.gd"


func _ready():
	type_tag = Tags.g_wand
	tag = Tags.bl_wand_mineral
	unlift = Tags.et_wand_mineral
	
func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	if tile.unlift_wand():
		player.unlift_entity(unlift)
