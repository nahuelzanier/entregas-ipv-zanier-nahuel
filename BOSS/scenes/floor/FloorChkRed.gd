extends "res://scenes/floor/FloorAbstract.gd"

var quake_wave
var quake = false

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_chkr_red
	lift_block = Tags.bl_chkr_red
	$DefaultEffectTimer.start()

func crumbling_tile_active():
	respawn_crumbling_tile = true

func create_detail():
	randomize()
	if randi()%10 == 0:
		CurrentMap.map_manager.create_entity(Tags.et_chkr_red, iso_pos)

func _on_DefaultEffectTimer_timeout():
	for i in [1, -1]:
		CurrentMap.map[iso_pos + Vector2(i,0)].born_default_tile(self)
		CurrentMap.map[iso_pos + Vector2(0,i)].born_default_tile(self)

#WISPS
func lava_wisp_is_on(wisp):
	var crumbling_tile = respawn_crumbling_tile
	CurrentMap.map_manager.replace(Tags.fl_lava, iso_pos)
	if crumbling_tile:
		CurrentMap.map[iso_pos].crumbling_tile_active()

func moving_lava_wisp(wisp):
	wisp.move(iso_pos)

func moving_sand_wisp(wisp):
	wisp.move(iso_pos)

func sand_wisp_is_on(wisp):
	CurrentMap.map_manager.replace(Tags.fl_beach, iso_pos)

#ENTITIES
func unlift_rock():
	return entities.size() < 1

func quake_start():
	CurrentMap.map[iso_pos + Vector2(0, 1)].quake(Vector2( 0, 1))
	CurrentMap.map[iso_pos + Vector2(0,-1)].quake(Vector2( 0,-1))
	CurrentMap.map[iso_pos + Vector2(1, 0)].quake(Vector2( 1, 0))
	CurrentMap.map[iso_pos + Vector2(-1,0)].quake(Vector2(-1, 0))

func quake(vector2):
	quake = true
	$Sprite/AnimationPlayer.play("QuakeDefault")
	$QuakeDamage.start()
	quake_wave = vector2
	$QuakeWave.start()

func _on_QuakeWave_timeout():
	CurrentMap.map[iso_pos + quake_wave].quake(quake_wave)

func _on_QuakeDamage_timeout():
	quake = false

func player_is_on(player):
	.player_is_on(player)
	if quake:
		player.queue_free()
		CurrentMap.map_manager.create_entity(Tags.et_player, CurrentMap.player_spawn)
	else:
		player.speed = player.default_speed
