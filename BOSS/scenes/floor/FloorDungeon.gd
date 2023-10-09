extends "res://scenes/floor/FloorAbstract.gd"

var quake_wave_x
var quake_wave_y
var quake = false

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_dungeon
	lift_block = Tags.bl_dungeon
	$DefaultEffectTimer.start()

func crumbling_tile_active():
	respawn_crumbling_tile = true

func create_detail():
	randomize()
	if randi()%20 == 0:
		CurrentMap.map_manager.create_entity(Tags.et_rock, iso_x, iso_y)

func _on_DefaultEffectTimer_timeout():
	for i in [1, -1]:
		CurrentMap.map[iso_y][iso_x + i].born_default_tile(self)
		CurrentMap.map[iso_y + i][iso_x].born_default_tile(self)


#WISPS
func lava_wisp_is_on(wisp):
	var crumbling_tile = respawn_crumbling_tile
	CurrentMap.map_manager.replace(Tags.fl_lava, iso_x, iso_y)
	if crumbling_tile:
		CurrentMap.map[iso_y][iso_x].crumbling_tile_active()

func moving_lava_wisp(wisp):
	wisp.move(iso_x, iso_y)

func moving_sand_wisp(wisp):
	wisp.move(iso_x, iso_y)

func sand_wisp_is_on(wisp):
	CurrentMap.map_manager.replace(Tags.fl_beach, iso_x, iso_y)

#ENTITIES
func unlift_rock():
	return entities.size() < 1

func quake_start():
	CurrentMap.map[iso_y+1][iso_x].quake(0, 1)
	CurrentMap.map[iso_y-1][iso_x].quake(0,-1)
	CurrentMap.map[iso_y][iso_x+1].quake(1, 0)
	CurrentMap.map[iso_y][iso_x-1].quake(-1,0)

func quake(dir_x, dir_y):
	quake = true
	$Sprite/AnimationPlayer.play("QuakeDefault")
	$QuakeDamage.start()
	quake_wave_x = dir_x
	quake_wave_y = dir_y
	$QuakeWave.start()

func _on_QuakeWave_timeout():
	CurrentMap.map[iso_y+quake_wave_y][iso_x+quake_wave_x].quake(quake_wave_x, quake_wave_y)

func _on_QuakeDamage_timeout():
	quake = false

func player_is_on(player):
	if quake:
		player.queue_free()
		CurrentMap.map_manager.create_entity(Tags.et_player, CurrentMap.player_spawn.x, CurrentMap.player_spawn.y)
	else:
		player.speed = player.default_speed


