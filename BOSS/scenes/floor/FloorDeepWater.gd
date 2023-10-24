extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_deep_water
	lift_block = Tags.bl_empty
	$KinematicBody2D.tag = tag

func get_lifted(player):pass

#TILES
func born_empty_tile(tile):
	var isoCoords = tile.iso_pos
	var crumbling_tile = tile.respawn_crumbling_tile
	$WaterGrowth.start()
	if crumbling_tile:
		CurrentMap.map[isoCoords].crumbling_tile_active()

func born_lava_tile(tile):
	var isoCoords = tile.iso_pos
	var crumbling_tile = tile.respawn_crumbling_tile
	CurrentMap.map_manager.replace(Tags.fl_default, isoCoords.x, isoCoords.y)
	if crumbling_tile:
		CurrentMap.map[isoCoords].crumbling_tile_active()

func born_bottomless_tile(tile):
	var falling_tile = tile.falling_water.instance()
	tile.falling_element.add_child(falling_tile)
	tile.current_falling_effects.append(falling_tile)

#WISPS
func sleeping_wisp_is_on(wisp):
	wisp.turn_into_water_wisp()

func unlift_wisp(player):pass

func _on_WaterGrowth_timeout():
	for i in [1, -1]:
		CurrentMap.map[iso_pos + Vector2(i,0)].born_water_tile(self)
		CurrentMap.map[iso_pos + Vector2(0,i)].born_water_tile(self)
