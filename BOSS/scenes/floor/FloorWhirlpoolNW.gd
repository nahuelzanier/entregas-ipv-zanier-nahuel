extends "res://scenes/floor/FloorWhirlpoolAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_whirlpool_nw
	lift_block = Tags.bl_empty
	whirlpool_direction = Vector2(-1,0)
	$WhirlpoolStartTimer.start()
