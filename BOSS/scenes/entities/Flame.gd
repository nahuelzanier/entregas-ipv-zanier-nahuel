extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_flame
	block = Tags.bl_empty
	$BurnOut.start()
	$SpreadFire.start()
	GlobalAudio.sfx_player.play_sound(GlobalAudio.sfx_player.flame)

func _on_BurnOut_timeout():
	destroy_self()
	CurrentMap.map[current_tile].burn_out()

func _on_SpreadFire_timeout():
	for i in [1, -1]:
		CurrentMap.map[current_tile + Vector2(i,0)].light_on_fire()
		CurrentMap.map[current_tile + Vector2(0,i)].light_on_fire()

func become_possessed(wisp):
	wisp.turn_into_fire_wisp()

func player_collision(player):
	player.take_damage(global_position.direction_to(player.global_position).normalized())
