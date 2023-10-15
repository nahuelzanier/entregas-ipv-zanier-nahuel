extends "res://scenes/floor/FloorWhirlpoolAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_whirlpool_se
	lift_block = Tags.bl_empty
	whirlpool_direction = Vector2(0,1)
	$WhirlpoolStartTimer.start()
