extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_salt
	lift_block = Tags.bl_salt

func _process(delta):
	pass

func on_born():
	for i in [1, -1]:
		CurrentMap.map[iso_pos + Vector2(i,0)].born_salt_tile(self)
		CurrentMap.map[iso_pos + Vector2(0,i)].born_salt_tile(self)

func moving_water_wisp(wisp):
	if entities.size()==0:
		wisp.move(iso_pos)
		wisp.on_land = false
	else:
		entities[0].water_wisp_effect()
		
func born_lava_tile(tile):
	CurrentMap.map_manager.replace(Tags.fl_lava, iso_pos)

func water_wisp_is_on(wisp):
	CurrentMap.map_manager.replace(Tags.fl_water, iso_pos)


