extends "res://scenes/blocks/BlockAbstract.gd"

func _ready():
	type_tag = Tags.g_player
	tag = Tags.bl_player
	unlift = Tags.fl_empty

func lift(player): pass
