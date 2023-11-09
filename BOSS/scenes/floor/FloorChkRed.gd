extends "res://scenes/floor/FloorDefault.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_chkr_red
	lift_block = Tags.bl_chkr_red
	$DefaultEffectTimer.start()
