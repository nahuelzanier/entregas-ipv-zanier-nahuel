extends "res://scenes/floor/FloorDefault.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_chkr_black
	lift_block = Tags.bl_chkr_black
	$DefaultEffectTimer.start()

