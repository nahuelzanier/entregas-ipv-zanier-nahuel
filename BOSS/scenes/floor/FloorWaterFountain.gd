extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_water
	lift_block = Tags.bl_empty
	$Kinematic2D.tag = tag

func get_lifted(player):
	pass

func on_born():
	$WaterGrowth.start()

func _on_WaterGrowth_timeout():
	for i in [1, -1]:
		CurrentMap.map[iso_pos + Vector2(i, 0)].born_water_tile(self)
		CurrentMap.map[iso_pos + Vector2(0, i)].born_water_tile(self)

#TILES
func born_empty_tile(tile):
	$WaterGrowth.start()

func born_lava_tile(tile):
	var isoCoords = tile.iso_pos
	CurrentMap.map_manager.replace(Tags.fl_default, isoCoords)

func born_bottomless_tile(tile):pass

#WISPS
func sleeping_wisp_is_on(wisp):
	wisp.turn_into_water_wisp()

func moving_water_wisp(wisp):
	wisp.move(iso_pos)
	wisp.on_land = false

func water_wisp_is_on(wisp): pass

func lava_wisp_is_on(wisp):
	wisp.go_to_sleep()
	
#ENTITIES
func unlift_rock():
	return entities.size() < 1

func sinks_rock():
	return true	
	
#PLAYER
func player_is_on(player):
	player.speed = player.default_speed/4

func mineral_wand():pass
