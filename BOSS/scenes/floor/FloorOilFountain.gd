extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_oil_fountain
	lift_block = Tags.bl_empty

func get_lifted(player):pass

func on_born():
	$OilGrowth.start()

func _on_OilGrowth_timeout():
	for i in [1, -1]:
		CurrentMap.map[iso_pos + Vector2(i,0)].born_oil_tile(self)
		CurrentMap.map[iso_pos + Vector2(0,i)].born_oil_tile(self)

#TILES
func born_empty_tile(tile):
	var isoCoords = tile.iso_pos
	var crumbling_tile = tile.respawn_crumbling_tile
	$OilGrowth.start()
	if crumbling_tile:
		CurrentMap.map[isoCoords].crumbling_tile_active()

func born_lava_tile(tile): pass

func _on_RespawnCrumblingTile_timeout():
	CurrentMap.map_manager.replace(Tags.fl_crumble, iso_pos)

func born_bottomless_tile(tile): pass
#	var falling_tile = tile.falling_water.instance()
#	tile.falling_element.add_child(falling_tile)
#	tile.current_falling_effects.append(falling_tile)

#WISPS
func sleeping_wisp_is_on(wisp): pass
#	wisp.turn_into_water_wisp()

func moving_water_wisp(wisp): pass
#	wisp.move(iso_pos)
#	wisp.on_land = false

func water_wisp_is_on(wisp): pass

func lava_wisp_is_on(wisp): pass
#	wisp.go_to_sleep()

#ENTITIES
func unlift_rock():
	return entities.size() < 1

func sinks_rock():
	return false
	
#PLAYER
func player_is_on(player):
	.player_is_on(player)
	player.speed = player.default_speed/2

func button_active_effect(button): 
	if entities.size() > 0:
		entities[0].button_active_effect(button)

func light_on_fire():
	if entities.size() == 0:
		CurrentMap.map_manager.create_entity(Tags.et_flame, iso_pos)
	else:
		entities[0].light_on_fire()

func wand(wand):pass
