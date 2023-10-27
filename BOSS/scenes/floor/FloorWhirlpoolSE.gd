extends "res://scenes/floor/FloorWhirlpoolAbstract.gd"

func _ready():
	tag = Tags.fl_whirlpool_se
	lift_block = Tags.bl_empty
	whirlpool_direction = Vector2(1,0)
	whirlpool_player = Vector2(2,1)
	push_dir = "south_east"
	$Kinematic2D.tag = tag
	$WhirlpoolStartTimer.start()
