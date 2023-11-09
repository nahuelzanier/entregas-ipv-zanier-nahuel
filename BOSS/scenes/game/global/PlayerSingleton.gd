extends Node

var player
var player_exists = false
var last_spawn_point
var topUI
var game
var start_max_hearts = 3
var start_current_hearts = 2
var max_hearts = start_max_hearts
var current_hearts = start_current_hearts

func remove_player():
	if player_exists:
		CurrentMap.rendered.entities.remove_child(player)

func place_player(iso_position, map_name):
	if player_exists:
		CurrentMap.map_manager.place_entity(player, iso_position)
		topUI.set_label(map_name)
	else:
		player_exists = true
		player = CurrentMap.map_manager.new_entity(Tags.et_player)
		CurrentMap.map_manager.place_entity(player, iso_position)
		topUI.set_label(map_name)
		max_hearts = start_max_hearts
		current_hearts = start_current_hearts
		update_hearts()

func update_hearts():
	topUI.update_hearts(current_hearts, max_hearts-current_hearts)

func damage(amount):
	current_hearts -= amount
	update_hearts()
	if current_hearts == 0:
		player.queue_free()
		player_exists = false
		game.game_over()
		topUI.set_label("OUCH...")
	
func increase_max_hearts():
	max_hearts += 1
	update_hearts()
	
func recover_life():
	current_hearts = min(max_hearts, current_hearts+1)
	update_hearts()
