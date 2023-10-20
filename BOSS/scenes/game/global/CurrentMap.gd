#SINGLETON

extends Node

var map_manager
var map_generator
var level_node
var rendered

var player_spawn
onready var map = {}

#func size_x():
#	return map[0].size()
#
#func size_y():
#	return map.size()

func generate_map(level, spawn_point):
	PlayerSingleton.remove_player()
	level_node.active_level.update_maps()
	record_entities()
	rendered.reset_rendered_elements()
	level_node.active_level = level
	load_level(level, spawn_point)
	map_generator.generate_map()
	level.create_static_entities()
	level.create_entities()
	PlayerSingleton.place_player(player_spawn)

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

#OPTIONAL STUFF
#func add_map_at(ins_map, x, y):
#	if x+ins_map[0].size() > size_x():
#		for sub_array in map:
#			sub_array.resize(x+ins_map[0].size())
#	if y+ins_map.size() > size_y():
#		for i in range(y+ins_map.size()-size_y()):
#			var nullArr = []
#			for j in range(max(x+ins_map[0].size(), size_x())):
#				nullArr.append(null)
#			map.append(nullArr) 
#	for iy in range(ins_map.size()):
#		for ix in range(ins_map[0].size()):
#			map[iy+y][ix+x] = ins_map[iy][ix]
#
#func convert_nulls():
#	for y in range(size_y()):
#		for x in range(size_x()):
#			if map[y][x] == null:
#				map[y][x] = Tags.fl_empty_no_access
