extends Node2D

var iso_x
var iso_y
onready var type_tag
onready var tag
onready var lift_block
var respawn_crumbling_tile = false
var entities

func _process(delta):
	if entities.size() > 1:
		scramble_entities()

func has_entities():
	return entities.size() > 0

func scramble_entities():
	for entity in entities:
		entity.move_away_from_each_other()

func get_lifted(player):
	var crumbler = respawn_crumbling_tile
	var pos = Vector2(iso_x, iso_y)
	player.grab_floor_block(lift_block)
	if crumbler:
		CurrentMap.map[pos.y][pos.x].crumbling_tile_active()
	
func get_lifted_with_entity(player):
	entities[0].get_lifted(player)

func on_born():pass

func crumbling_tile_active():
	respawn_crumbling_tile = true
	$RespawnCrumblingTile.start()

func destroy_self():
	self.queue_free()

func create_detail():
	pass

func switch_sprites():
	pass

#TILES
func born_default_tile(tile): pass

func born_empty_tile(tile): pass

func born_water_tile(tile): pass

func born_lava_tile(tile): pass

func born_beach_tile(tile): pass

func born_bottomless_tile(tile): pass

#WISPS
func sleeping_wisp_is_on(wisp): pass

func moving_sleeping_wisp(wisp):
	if entities.size() > 0:
		entities[0].become_possessed(wisp)

func moving_water_wisp(wisp): pass

func water_wisp_is_on(wisp):
	if wisp.on_land:
		wisp.go_to_sleep()
	else:
		wisp.on_land = true
		wisp.try_to_move()

func moving_lava_wisp(wisp): pass

func lava_wisp_is_on(wisp): pass

func quake_wisp_is_on(wisp): pass

func moving_sand_wisp(wisp): pass

func sand_wisp_is_on(wisp):
	wisp.go_to_sleep()

#PLAYER
func player_is_on(player):
	player.speed = player.default_speed

#ENTITIES
func unlift_rock():
	return false

func sinks_rock():
	return false

func unlift_wisp(player):
	if entities.size() > 0:
		entities[0].unlift_wisp(player)
	else:
		player.unlift_entity(Tags.et_wisp)

func unlift_palmtree():
	return false

func quake_start(): pass
func quake(dir_x, dir_y): pass