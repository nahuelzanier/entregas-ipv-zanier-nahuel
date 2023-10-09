extends Node2D
#FLOORS
export (PackedScene) var wallBase_y
export (PackedScene) var wallBase_x
export (PackedScene) var floorDefault
export (PackedScene) var floorEmpty
export (PackedScene) var floor_empty_no_access
export (PackedScene) var waterFloor
export (PackedScene) var fountainFloor
export (PackedScene) var crumbleFloor
export (PackedScene) var lavaFloor
export (PackedScene) var sandBeach
export (PackedScene) var columnBase
export (PackedScene) var player_spawn
export (PackedScene) var checker_black
export (PackedScene) var checker_red
export (PackedScene) var bottomless
export (PackedScene) var tile_door_left
export (PackedScene) var tile_door_right
export (PackedScene) var floor_dungeon
#ENTITIES
export (PackedScene) var emptyEntity
export (PackedScene) var palmtree
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
export (PackedScene) var wispBase
export (PackedScene) var wispWater
export (PackedScene) var wisp_lava
export (PackedScene) var wisp_quake
export (PackedScene) var wisp_sand
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

var tile_dict = {}
var entities_dict = {}
var block_dict = {}

func _ready():
	tile_dict[Tags.fl_wall_y] = wallBase_y
	tile_dict[Tags.fl_wall_x] = wallBase_x
	tile_dict[Tags.fl_default] = floorDefault
	tile_dict[Tags.fl_empty] = floorEmpty
	tile_dict[Tags.fl_empty_no_access] = floor_empty_no_access
	tile_dict[Tags.fl_water] = waterFloor
	tile_dict[Tags.fl_fountain] = fountainFloor
	tile_dict[Tags.fl_crumble] = crumbleFloor
	tile_dict[Tags.fl_lava] = lavaFloor
	tile_dict[Tags.fl_beach] = sandBeach
	tile_dict[Tags.fl_column] = columnBase
	tile_dict[Tags.fl_player] = player_spawn
	tile_dict[Tags.fl_chkr_black] = checker_black
	tile_dict[Tags.fl_chkr_red] = checker_red
	tile_dict[Tags.fl_bottomless] = bottomless
	tile_dict[Tags.fl_door_left] = tile_door_left
	tile_dict[Tags.fl_door_right] = tile_door_right
	tile_dict[Tags.fl_dungeon] = floor_dungeon
	entities_dict[Tags.et_empty] = emptyEntity
	entities_dict[Tags.et_palmtree] = palmtree
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
	entities_dict[Tags.et_wisp] = wispBase
	entities_dict[Tags.et_water_wisp] = wispWater
	entities_dict[Tags.et_lava_wisp] = wisp_lava
	entities_dict[Tags.et_quake_wisp] = wisp_quake
	entities_dict[Tags.et_sand_wisp] = wisp_sand
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

func generate_floor_tile(tile, x, y):
	if tile != null:
		var new_floor = tile_dict[tile].instance()
		new_floor.iso_x = x
		new_floor.iso_y = y
		new_floor.entities = []
		Global.move_to_coordinates(new_floor, x, y)
		return new_floor

func generate_player(x, y):
	var new_player = entities_dict[Tags.et_player].instance()
	Global.move_to_coordinates(new_player, x, y)
	return new_player

func generate_entity(entity, x, y):
	var new_entity = entities_dict[entity].instance()
	Global.move_to_coordinates(new_entity, x, y)
	return new_entity

func new_entity(entity_tag):
	return entities_dict[entity_tag].instance()

func new_block(block_tag):
	return block_dict[block_tag].instance()

