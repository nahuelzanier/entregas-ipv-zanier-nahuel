extends TileMap

var map = {}

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
		0: ret=Tags.fl_default
		1: ret=Tags.fl_bottomless
		2: ret=Tags.fl_button
		3: ret=Tags.fl_chkr_black
		4: ret=Tags.fl_chkr_red
		5: ret=Tags.fl_cliff_side
		6: ret=Tags.fl_cliff
		7: ret=Tags.fl_cliff_back
		8: ret=Tags.fl_crumble
		9: ret=Tags.fl_deep_water
		10: ret=Tags.fl_dungeon
		11: ret=Tags.fl_lava
		12: ret=Tags.fl_empty_access
		13: ret=Tags.fl_empty_blocked
		14: ret=Tags.fl_empty_no_access
		15: ret=Tags.fl_empty
		16: ret=Tags.fl_salt
		17: ret=Tags.fl_beach
		18: ret=Tags.fl_stairs_down
		19: ret=Tags.fl_trap_door
		20: ret=Tags.fl_stone
		21: ret=Tags.fl_water
		22: ret=Tags.fl_fountain
		23: ret=Tags.fl_whirlpool_ne
		24: ret=Tags.fl_whirlpool_nw
		25: ret=Tags.fl_whirlpool_se
		26: ret=Tags.fl_whirlpool_sw
	return ret
		
