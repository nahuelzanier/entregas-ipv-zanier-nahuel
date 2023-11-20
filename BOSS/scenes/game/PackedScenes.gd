extends Node
#UI
export (PackedScene) var ui_arrow
#FLOORS
export (PackedScene) var floorDefault
export (PackedScene) var floorEmpty
export (PackedScene) var floor_empty_no_access
export (PackedScene) var floor_empty_access
export (PackedScene) var floor_empty_access_water
export (PackedScene) var floor_empty_blocked
export (PackedScene) var waterFloor
export (PackedScene) var deep_water
export (PackedScene) var fountainFloor
export (PackedScene) var crumbleFloor
export (PackedScene) var lavaFloor
export (PackedScene) var sandBeach
export (PackedScene) var checker_black
export (PackedScene) var checker_red
export (PackedScene) var bottomless
export (PackedScene) var floor_dungeon
export (PackedScene) var floor_stone
export (PackedScene) var floor_salt
export (PackedScene) var floor_trap_door
export (PackedScene) var floor_button
export (PackedScene) var whirlpool_ne
export (PackedScene) var whirlpool_nw
export (PackedScene) var whirlpool_sw
export (PackedScene) var whirlpool_se
export (PackedScene) var stairs_down
export (PackedScene) var stairs_up
export (PackedScene) var cliff
export (PackedScene) var cliff_side
export (PackedScene) var cliff_back
export (PackedScene) var oil_tile
export (PackedScene) var oil_fountain
#ENTITIES
export (PackedScene) var block_holder
export (PackedScene) var emptyEntity
export (PackedScene) var palmtree
export (PackedScene) var palmtree_sunk
export (PackedScene) var palmtree_coco
export (PackedScene) var wall_y
export (PackedScene) var wall_x
export (PackedScene) var player
export (PackedScene) var rock
export (PackedScene) var rock_sinking
export (PackedScene) var columnBody
export (PackedScene) var checker_piece_black
export (PackedScene) var checker_piece_red
export (PackedScene) var door_left
export (PackedScene) var door_right
export (PackedScene) var door_north
export (PackedScene) var door_south
export (PackedScene) var salt_pillar
export (PackedScene) var salt_pile
export (PackedScene) var salt_tile
export (PackedScene) var trap_door
export (PackedScene) var wispBase
export (PackedScene) var wispWater
export (PackedScene) var wisp_lava
export (PackedScene) var wisp_quake
export (PackedScene) var wisp_sand
export (PackedScene) var wisp_fire
export (PackedScene) var stone_lid
export (PackedScene) var entity_stairs_up
export (PackedScene) var entity_flame
export (PackedScene) var entity_torch
export (PackedScene) var entity_torch_on
export (PackedScene) var wand_mineral
export (PackedScene) var wand_water
export (PackedScene) var wand_void
export (PackedScene) var heart
export (PackedScene) var sign_board
#BLOCKS
export (PackedScene) var block_empty
export (PackedScene) var block_palmtree
export (PackedScene) var block_default
export (PackedScene) var block_rock
export (PackedScene) var block_wisp
export (PackedScene) var block_chkbl
export (PackedScene) var block_chkrd
export (PackedScene) var block_chk_piece_black
export (PackedScene) var block_chk_piece_red
export (PackedScene) var block_dungeon
export (PackedScene) var block_salt
export (PackedScene) var block_button
export (PackedScene) var block_water_wisp
export (PackedScene) var block_stone_lid
export (PackedScene) var block_wand_mineral
export (PackedScene) var block_wand_water
export (PackedScene) var block_wand_void
export (PackedScene) var block_heart
export (PackedScene) var block_player
export (PackedScene) var block_sign

var tile_dict = {}
var entities_dict = {}
var block_dict = {}

func _ready():
	tile_dict[Tags.fl_default] = floorDefault
	tile_dict[Tags.fl_empty] = floorEmpty
	tile_dict[Tags.fl_empty_no_access] = floor_empty_no_access
	tile_dict[Tags.fl_empty_access] = floor_empty_access
	tile_dict[Tags.fl_empty_access_water] = floor_empty_access_water
	tile_dict[Tags.fl_empty_blocked] = floor_empty_blocked
	tile_dict[Tags.fl_water] = waterFloor
	tile_dict[Tags.fl_deep_water] = deep_water
	tile_dict[Tags.fl_fountain] = fountainFloor
	tile_dict[Tags.fl_crumble] = crumbleFloor
	tile_dict[Tags.fl_lava] = lavaFloor
	tile_dict[Tags.fl_beach] = sandBeach
	tile_dict[Tags.fl_chkr_black] = checker_black
	tile_dict[Tags.fl_chkr_red] = checker_red
	tile_dict[Tags.fl_bottomless] = bottomless
	tile_dict[Tags.fl_dungeon] = floor_dungeon
	tile_dict[Tags.fl_stone] = floor_stone
	tile_dict[Tags.fl_salt] = floor_salt
	tile_dict[Tags.fl_trap_door] = floor_trap_door
	tile_dict[Tags.fl_button] = floor_button
	tile_dict[Tags.fl_whirlpool_ne] = whirlpool_ne
	tile_dict[Tags.fl_whirlpool_nw] = whirlpool_nw
	tile_dict[Tags.fl_whirlpool_sw] = whirlpool_sw
	tile_dict[Tags.fl_whirlpool_se] = whirlpool_se
	tile_dict[Tags.fl_stairs_down] = stairs_down
	tile_dict[Tags.fl_stairs_up] = stairs_up
	tile_dict[Tags.fl_cliff] = cliff
	tile_dict[Tags.fl_cliff_side] = cliff_side
	tile_dict[Tags.fl_cliff_back] = cliff_back
	tile_dict[Tags.fl_oil] = oil_tile
	tile_dict[Tags.fl_oil_fountain] = oil_fountain
	entities_dict[Tags.et_block_holder] = block_holder
	entities_dict[Tags.et_empty] = emptyEntity
	entities_dict[Tags.et_palmtree] = palmtree
	entities_dict[Tags.et_palmtree_sink] = palmtree_sunk
	entities_dict[Tags.et_palmtree_coconut] = palmtree_coco
	entities_dict[Tags.et_wall_y] = wall_y
	entities_dict[Tags.et_wall_x] = wall_x
	entities_dict[Tags.et_player] = player
	entities_dict[Tags.et_rock] = rock
	entities_dict[Tags.et_sinking_rock] = rock_sinking
	entities_dict[Tags.et_column] = columnBody
	entities_dict[Tags.et_chkr_black] = checker_piece_black
	entities_dict[Tags.et_chkr_red] = checker_piece_red
	entities_dict[Tags.et_door_left] = door_left
	entities_dict[Tags.et_door_right] = door_right
	entities_dict[Tags.et_door_north] = door_north
	entities_dict[Tags.et_door_south] = door_south
	entities_dict[Tags.et_salt_pillar] = salt_pillar
	entities_dict[Tags.et_salt_pile] = salt_pile
	entities_dict[Tags.et_salt_tile] = salt_tile
	entities_dict[Tags.et_wisp] = wispBase
	entities_dict[Tags.et_water_wisp] = wispWater
	entities_dict[Tags.et_lava_wisp] = wisp_lava
	entities_dict[Tags.et_quake_wisp] = wisp_quake
	entities_dict[Tags.et_sand_wisp] = wisp_sand
	entities_dict[Tags.et_fire_wisp] = wisp_fire
	entities_dict[Tags.et_trap_door] = trap_door
	entities_dict[Tags.et_stone_lid] = stone_lid
	entities_dict[Tags.et_stairs_up] = entity_stairs_up
	entities_dict[Tags.et_flame] = entity_flame
	entities_dict[Tags.et_torch] = entity_torch
	entities_dict[Tags.et_torch_on] = entity_torch_on
	entities_dict[Tags.et_wand_mineral] = wand_mineral
	entities_dict[Tags.et_wand_water] = wand_water
	entities_dict[Tags.et_wand_void] = wand_void
	entities_dict[Tags.et_heart] = heart
	entities_dict[Tags.et_sign] = sign_board
	entities_dict[Tags.ui_arrow] = ui_arrow
	block_dict[Tags.bl_empty] = block_empty
	block_dict[Tags.bl_palmtree] = block_palmtree
	block_dict[Tags.bl_default] = block_default
	block_dict[Tags.bl_rock] = block_rock
	block_dict[Tags.bl_wisp] = block_wisp
	block_dict[Tags.bl_chkr_black] = block_chkbl
	block_dict[Tags.bl_chkr_red] = block_chkrd
	block_dict[Tags.bl_chkr_blpiece] = block_chk_piece_black
	block_dict[Tags.bl_chkr_rdpiece] = block_chk_piece_red
	block_dict[Tags.bl_dungeon] = block_dungeon
	block_dict[Tags.bl_salt] = block_salt
	block_dict[Tags.bl_button] = block_button
	block_dict[Tags.bl_wisp_water] = block_water_wisp
	block_dict[Tags.bl_stone_lid] = block_stone_lid
	block_dict[Tags.bl_wand_mineral] = block_wand_mineral
	block_dict[Tags.bl_wand_water] = block_wand_water
	block_dict[Tags.bl_wand_void] = block_wand_void
	block_dict[Tags.bl_heart] = block_heart
	block_dict[Tags.bl_player] = block_player
	block_dict[Tags.bl_sign] = block_sign

func generate_floor_tile(tile, vector2):
	if tile != null:
		var new_floor = tile_dict[tile].instance()
		new_floor.iso_pos = vector2
		new_floor.entities = []
		Global.move_to_coordinates(new_floor, vector2)
		return new_floor

func generate_player(vector2):
	var new_player = entities_dict[Tags.et_player].instance()
	Global.move_to_coordinates(new_player, vector2)
	return new_player

func generate_entity(entity, vector2):
	var new_entity = entities_dict[entity].instance()
	Global.move_to_coordinates(new_entity, vector2)
	return new_entity

func new_entity(entity_tag):
	return entities_dict[entity_tag].instance()

func new_block(block_tag):
	return block_dict[block_tag].instance()

