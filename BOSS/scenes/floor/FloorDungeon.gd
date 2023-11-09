extends "res://scenes/floor/FloorDefault.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_dungeon
	lift_block = Tags.bl_dungeon
	$DefaultEffectTimer.start()


