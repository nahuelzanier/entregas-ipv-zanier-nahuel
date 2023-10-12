extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_deep_water
	lift_block = Tags.bl_empty

func get_lifted(player):pass
	
#TILES
func born_empty_tile(tile):
	var isoCoords = Vector2(tile.iso_x, tile.iso_y)
	var crumbling_tile = tile.respawn_crumbling_tile
	$WaterGrowth.start()
	if crumbling_tile:
		CurrentMap.map[isoCoords.y][isoCoords.x].crumbling_tile_active()

func born_lava_tile(tile):
	var isoCoords = Vector2(tile.iso_x, tile.iso_y)
	var crumbling_tile = tile.respawn_crumbling_tile
	CurrentMap.map_manager.replace(Tags.fl_default, isoCoords.x, isoCoords.y)
	if crumbling_tile:
		CurrentMap.map[isoCoords.y][isoCoords.x].crumbling_tile_active()

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
		CurrentMap.map[iso_y][iso_x + i].born_water_tile(self)
		CurrentMap.map[iso_y + i][iso_x].born_water_tile(self)
