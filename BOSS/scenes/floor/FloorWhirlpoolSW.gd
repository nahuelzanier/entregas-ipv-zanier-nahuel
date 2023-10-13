extends "res://scenes/floor/FloorAbstract.gd"

onready var whirlpool_direction = Vector2(0,1)

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_whirlpool_se
	lift_block = Tags.bl_empty
	$WhirlpoolStartTimer.start()

func get_lifted(player):
	CurrentMap.map_manager.create_entity(Tags.et_block_holder, iso_x, iso_y)
	entities[0].set_block(player.block_tag_proper())
	player.pop_block()

func on_born():
	$WaterGrowth.start()

func _on_WaterGrowth_timeout():
	for i in [1, -1]:
		CurrentMap.map[iso_y][iso_x + i].born_water_tile(self)
		CurrentMap.map[iso_y + i][iso_x].born_water_tile(self)

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

func _on_RespawnCrumblingTile_timeout():
	CurrentMap.map_manager.replace(Tags.fl_crumble, iso_x, iso_y)

func born_bottomless_tile(tile):
	var falling_tile = tile.falling_water.instance()
	tile.falling_element.add_child(falling_tile)
	tile.current_falling_effects.append(falling_tile)

#WISPS
func sleeping_wisp_is_on(wisp):
	wisp.turn_into_water_wisp()

func moving_water_wisp(wisp):
	wisp.move(iso_x, iso_y)
	wisp.on_land = false

func water_wisp_is_on(wisp): pass

func lava_wisp_is_on(wisp):
	wisp.go_to_sleep()
	
#ENTITIES
func unlift_rock():
	return entities.size() < 1

func sinks_rock():
	return true	

func block_holder(block_holder):pass

#PLAYER
func player_is_on(player):
	player.speed = player.default_speed/4

func button_active_effect(button): 
	if entities.size() > 0:
		entities[0].button_active_effect(button)

func _on_WhirlpoolTimer_timeout():
	if entities.size() > 0:
		entities[0].whirlpool(whirlpool_direction)

func _on_WhirlpoolStartTimer_timeout():
	if entities.size() > 0:
		$WhirlpoolTimer.start()
