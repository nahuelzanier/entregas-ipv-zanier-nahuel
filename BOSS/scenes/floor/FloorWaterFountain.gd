extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_water
	lift_block = Tags.bl_empty

func get_lifted(player):
	pass

func on_born():
	$WaterGrowth.start()

func _on_WaterGrowth_timeout():
	for i in [1, -1]:
		CurrentMap.map[iso_y][iso_x + i].born_water_tile(self)
		CurrentMap.map[iso_y + i][iso_x].born_water_tile(self)

#TILES
func born_empty_tile(tile):
	$WaterGrowth.start()

func born_lava_tile(tile):
	var isoCoords = Vector2(tile.iso_x, tile.iso_y)
	CurrentMap.map_manager.replace(Tags.fl_default, isoCoords.x, isoCoords.y)

func born_bottomless_tile(tile):pass

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
	
#PLAYER
func player_is_on(player):
	player.speed = player.default_speed/4
