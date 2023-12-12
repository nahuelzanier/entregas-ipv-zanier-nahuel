#SINGLETON

extends Node

var map_manager
var map_generator
var level_node
var rendered
var backgrounds
var checkpoint_map
onready var first_checkpoint = false

var player_spawn
onready var map = {}

func checkpoint_map():
	generate_map(checkpoint_map, checkpoint_map.player_spawn)

func update_checkpoint(level):
	if level.is_checkpoint():
		checkpoint_map = level
		first_checkpoint = true

func generate_map(level, spawn_point):
	update_checkpoint(level)
	GlobalAudio.ambient_player.ambient_stop()
	PlayerSingleton.remove_player()
	record_entities()
	level_node.active_level.update_maps()
	rendered.reset_rendered_elements()
	level_node.active_level = level
	load_level(level, spawn_point)
	map_generator.generate_map()
	level.create_entities()
	backgrounds.apply_bg(level_node.active_level.bg)
	PlayerSingleton.place_player(player_spawn, level_node.active_level.map_tag_name)
	level_node.active_level.start_audio()

func trigger_level_locations(iso_position, map_tag):
	level_node.active_level.trigger_level_locations(iso_position, map_tag)

func load_level(level, spawn_point):
	player_spawn = spawn_point
	update_map(level.map)

func update_map(dict):
	map = {}
	for vector2 in dict.keys():
		map[vector2] = dict[vector2]

func record_entities():
	var rec_ent = {}
	for v2 in map.keys():
		var tile = map[v2]
		if tile.entities.size() > 0:
			rec_ent[tile.iso_pos] = tile.entities[0].tag
	level_node.active_level.entities = rec_ent
