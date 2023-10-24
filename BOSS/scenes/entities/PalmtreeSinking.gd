extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_palmtree_sink
	block = Tags.bl_palmtree

func player_collision(player):
	player.start_surfing(self)
	destroy_self()
