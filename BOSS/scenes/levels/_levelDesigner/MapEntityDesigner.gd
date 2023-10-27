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
		Tags.et_door_south,
		Tags.et_fire_wisp,
		Tags.et_flame,
		Tags.et_torch,
		Tags.et_torch_on,
		Tags.et_palmtree_sink,
		Tags.et_wand_mineral
]

func get_map():
	map_tiles()
	self.visible = false
	return map

func map_tiles():
	for v2 in get_used_cells():
		map[v2] = index_to_tag(get_cell(v2.x, v2.y))

func index_to_tag(tile_index):
	return tags[tile_index]

