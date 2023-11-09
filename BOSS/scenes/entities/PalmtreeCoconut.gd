extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_palmtree_coconut
	block = Tags.bl_palmtree

func get_lifted(player):
	if player.block_tag() == Tags.fl_empty:
		player.drink_coconut()
		CurrentMap.map_manager.replace_entity(self, Tags.et_palmtree)
