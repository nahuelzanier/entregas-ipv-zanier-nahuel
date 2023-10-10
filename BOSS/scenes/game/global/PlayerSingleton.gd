extends Node

var player
var player_exists = false
var last_spawn_point

func remove_player():
	if player_exists:
		CurrentMap.rendered.entities.remove_child(player)

func place_player(iso_position):
	if player_exists:
		CurrentMap.map_manager.place_entity(player, iso_position.x, iso_position.y)
	else:
		player_exists = true
		player = CurrentMap.map_manager.new_entity(Tags.et_player)
		CurrentMap.map_manager.place_entity(player, iso_position.x, iso_position.y)
