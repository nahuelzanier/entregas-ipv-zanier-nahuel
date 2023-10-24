extends TileMap

var map = {}
var tags = [
		Tags.fl_default,
		Tags.fl_bottomless,
		Tags.fl_button,
		Tags.fl_chkr_black,
		Tags.fl_chkr_red,
		Tags.fl_cliff_side,
		Tags.fl_cliff_back,
		Tags.fl_cliff,
		Tags.fl_crumble,
		Tags.fl_deep_water,
		Tags.fl_dungeon,
		Tags.fl_lava,
		Tags.fl_empty_access,
		Tags.fl_empty_blocked,
		Tags.fl_empty_no_access,
		Tags.fl_empty,
		Tags.fl_salt,
		Tags.fl_beach,
		Tags.fl_stairs_down,
		Tags.fl_trap_door,
		Tags.fl_stone,
		Tags.fl_water,
		Tags.fl_fountain,
		Tags.fl_whirlpool_ne,
		Tags.fl_whirlpool_nw,
		Tags.fl_whirlpool_se,
		Tags.fl_whirlpool_sw,
		Tags.fl_stairs_up,
		Tags.fl_oil,
		Tags.fl_oil_fountain
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
		
