extends TileMap

var map = {}
var tags = [
		Tags.et_stone_lid,
		Tags.et_trap_door,
		Tags.et_wall_x,
		Tags.et_wall_y,
		Tags.et_salt_tile,
		Tags.et_salt_pile,
		Tags.et_salt_pillar,
		Tags.et_rock,
		Tags.et_sinking_rock,
		Tags.et_palmtree,
		Tags.et_chkr_black,
		Tags.et_chkr_red,
		Tags.et_column,
		Tags.et_wisp,
		Tags.et_water_wisp,
		Tags.et_lava_wisp,
		Tags.et_sand_wisp,
		Tags.et_quake_wisp,
		Tags.et_stairs_up,
		Tags.et_door_left,
		Tags.et_door_right,
		Tags.et_door_north,
		Tags.et_door_south
]

func get_map():
	map_tiles()
	self.visible = false
	return map

func map_tiles():
	for v2 in get_used_cells():
		map[v2] = index_to_tag(get_cell(v2.x, v2.y))

func index_to_tag(tile_index):
	var ret
	match tile_index:
		0: ret=Tags.et_stone_lid
		1: ret=Tags.et_trap_door
		2: ret=Tags.et_wall_x
		3: ret=Tags.et_wall_y
		4: ret=Tags.et_salt_tile
		5: ret=Tags.et_salt_pile
		6: ret=Tags.et_salt_pillar
		7: ret=Tags.et_rock
		8: ret=Tags.et_sinking_rock
		9: ret=Tags.et_palmtree
		10: ret=Tags.et_chkr_black
		11: ret=Tags.et_chkr_red
		12: ret=Tags.et_column
		13: ret=Tags.et_wisp
		14: ret=Tags.et_water_wisp
		15: ret=Tags.et_lava_wisp
		16: ret=Tags.et_sand_wisp
		17: ret=Tags.et_quake_wisp
		18: ret=Tags.et_stairs_up
		19: ret=Tags.et_door_left
		20: ret=Tags.et_door_right
		21: ret=Tags.et_door_north
		22: ret=Tags.et_door_south
	return ret

