extends "res://scenes/floor/FloorAbstract.gd"

onready var disolving = false

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_salt
	lift_block = Tags.bl_salt

func _process(delta):
	pass

func moving_water_wisp(wisp):
	if entities.size()==0:
		wisp.move(iso_x, iso_y)
		wisp.on_land = false
	else:
		entities[0].water_wisp_effect()
		

func water_wisp_is_on(wisp):
	if disolving:
		CurrentMap.map_manager.replace(Tags.fl_water, iso_x, iso_y)
	else:
		disolving = true

