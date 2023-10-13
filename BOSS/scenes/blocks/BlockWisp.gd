extends "res://scenes/blocks/BlockAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.bl_wisp
	unlift = Tags.et_wisp

func lift(player):
	var tile = CurrentMap.map_manager.get_tile(player.grab_coords())
	tile.unlift_wisp(player)
