extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_beach
	lift_block = Tags.bl_empty

func _on_SandFillTimer_timeout():
	for i in [1, -1]:
		CurrentMap.map[iso_pos + Vector2(i,0)].born_beach_tile(self)
		CurrentMap.map[iso_pos + Vector2(0,i)].born_beach_tile(self)

func create_detail():
	randomize()
	if randi()%10 == 0:
		CurrentMap.map_manager.create_entity(Tags.et_palmtree, iso_pos)

#WISPS
func sleeping_wisp_is_on(wisp):
	wisp.turn_into_sand_wisp()

func moving_sand_wisp(wisp):
	wisp.move(iso_pos)

func sand_wisp_is_on(wisp):
	pass

#TILES
func born_empty_tile(tile):
	var isoCoords = tile.iso_pos
	var crumbling_tile = tile.respawn_crumbling_tile
	$SandFillTimer.start()
	if crumbling_tile:
		CurrentMap.map[isoCoords].crumbling_tile_active()

#PLAYER
func player_is_on(player):
	player.speed = player.default_speed*3/4

#ENTITIES
func unlift_rock():
	return entities.size() < 1

func unlift_palmtree():
	return entities.size() < 1

