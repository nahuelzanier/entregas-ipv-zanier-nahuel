extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_lava
	lift_block = Tags.bl_empty

func get_lifted(player):
	pass

func on_born():
	$LavaGrowth.start()

func _on_LavaGrowth_timeout():
	for i in [1, -1]:
		CurrentMap.map[iso_pos + Vector2(i,0)].born_lava_tile(self)
		CurrentMap.map[iso_pos + Vector2(0,i)].born_lava_tile(self)

func _on_RespawnCrumblingTile_timeout():
	CurrentMap.map_manager.replace(Tags.fl_crumble, iso_pos)
	
#TILES
func born_empty_tile(tile):
	var isoCoords = tile.iso_pos
	var crumbling_tile = tile.respawn_crumbling_tile
	$LavaGrowth.start()
	if crumbling_tile:
		CurrentMap.map[isoCoords].crumbling_tile_active()

func born_water_tile(tile):
	var isoCoords = tile.iso_pos
	var crumbling_tile = tile.respawn_crumbling_tile
	CurrentMap.map_manager.replace(Tags.fl_default, iso_pos)
	if crumbling_tile:
		CurrentMap.map[isoCoords].crumbling_tile_active()

func born_bottomless_tile(tile):
	var falling_tile = tile.falling_lava.instance()
	tile.falling_element.add_child(falling_tile)
	tile.current_falling_effects.append(falling_tile)

#WISPS
func water_wisp_is_on(wisp):
	wisp.go_to_sleep()

func sleeping_wisp_is_on(wisp):
	wisp.turn_into_lava_wisp()
	
func moving_lava_wisp(wisp):
	wisp.move(iso_pos)

#ENTITIES
func unlift_rock():
	return entities.size() < 1

func sinks_rock():
	return true

#PLAYER
func player_is_on(player):
	.player_is_on(player)
	player.queue_free()
	CurrentMap.map_manager.create_entity(Tags.et_player, CurrentMap.player_spawn)
