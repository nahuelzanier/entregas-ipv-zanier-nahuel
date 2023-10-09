#SINGLETON

extends Node

var map_manager
var map_generator
var level_node
var rendered

var player_spawn
onready var map = []

func size_x():
	return map[0].size()
	
func size_y():
	return map.size()

func generate_map(level, spawn_point):
	rendered.reset_rendered_elements()
	load_level(level, spawn_point)
	map_generator.generate_map()
	level.create_entities()
	level_node.active_level = level

func trigger_level_locations(iso_position):
	level_node.active_level.trigger_level_locations(iso_position)

func load_level(level, spawn_point):
	player_spawn = spawn_point
	update_map(level.map)

func update_map(array):
	var arr = []
	for y in range(array.size()):
		var arr_y = []
		for x in range(array[y].size()):
			arr_y.append(array[y][x])
		arr.append(arr_y)
	map = arr

#OPTIONAL STUFF
#func set_player_spawn_(x, y):
#	map[y][x] = Tags.et_player

func add_map_at(ins_map, x, y):
	if x+ins_map[0].size() > size_x():
		for sub_array in map:
			sub_array.resize(x+ins_map[0].size())
	if y+ins_map.size() > size_y():
		for i in range(y+ins_map.size()-size_y()):
			var nullArr = []
			for j in range(max(x+ins_map[0].size(), size_x())):
				nullArr.append(null)
			map.append(nullArr) 
	for iy in range(ins_map.size()):
		for ix in range(ins_map[0].size()):
			map[iy+y][ix+x] = ins_map[iy][ix]

func convert_nulls():
	for y in range(size_y()):
		for x in range(size_x()):
			if map[y][x] == null:
				map[y][x] = Tags.fl_empty_no_access
