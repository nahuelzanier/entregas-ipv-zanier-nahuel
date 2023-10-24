extends Node

onready var rendered = $"../../Rendered"
onready var packed_scenes = $PackedScenes
#onready var creator = $MapArrayCreator

func _ready():
	CurrentMap.map_generator = self

#func generate_map(detail = false):
#	for y in range(CurrentMap.size_y()):
#		for x in range(CurrentMap.size_x()):
#			var new_floor = packed_scenes.generate_floor_tile(CurrentMap.map[y][x], x, y)
#			CurrentMap.map[y][x] = new_floor
#			rendered.floor_map.add_child(new_floor)
#	for y in range(CurrentMap.size_y()):
#		for x in range(CurrentMap.size_x()):
#			CurrentMap.map[y][x].on_born()
#	if detail:
#		for y in range(CurrentMap.size_y()):
#			for x in range(CurrentMap.size_x()):
#				CurrentMap.map[y][x].create_detail()

func generate_map(detail = false):
	var keys = CurrentMap.map.keys()
	for vector2 in keys:
		var new_floor = packed_scenes.generate_floor_tile(CurrentMap.map[vector2], vector2)
		CurrentMap.map[vector2] = new_floor
		rendered.floor_map.add_child(new_floor)
	for vector2 in keys:
		CurrentMap.map[vector2].on_born()
#
#func generate_entity(entity, x, y):
#	var new_entity = packed_scenes.generate_entity(entity, x, y)
#	rendered.entities.add_child(new_entity)

#func generate_test():
#	generate_floor_map(current_map)
#	generate_entity(Tags.et_player, 5, 14)
#	CurrentMap.player_spawn = Vector2(5,14)
#	generate_entity(Tags.et_wisp, 7, 2)
#	generate_entity(Tags.et_water_wisp, 6, 6)
#	generate_entity(Tags.et_water_wisp, 6, 7)
#	generate_entity(Tags.et_water_wisp, 7, 7)

#func generate_island():
#	CurrentMap.map = island_map
#	generate_map()
#	randomize()
#	for y in range(island_map.size()):
#		for x in range(island_map[y].size()):
#			if island_map[y][x].type_tag != Tags.g_wall:
#				if randi()%50 == 0:
#					generate_entity(Tags.et_wisp, x, y)
#
#func random_map(xsize, ysize):
#	var tags_sel = ['h2o', 'bea', 'def', 'emp', 'lav', 'cru']
#	var map_rand = []
#	for y in ysize:
#		var map_row = []
#		for x in xsize:
#			if y==0 || x==0 || y==ysize-1 || x==xsize-1:
#				map_row.append('xxx')
#			else:
#				map_row.append(tags_sel[randi()%tags_sel.size()])
#		map_rand.append(map_row)
#	generate_floor_map(map_rand)
#	randomize()
#	for y in range(map_rand.size()):
#		for x in range(map_rand[y].size()):
#			if map_rand[y][x].type_tag != Tags.g_wall:
#				if randi()%2 == 0:
#					generate_entity(Tags.et_wisp, x, y)
#	generate_entity(Tags.et_player, randi()%xsize, randi()%ysize)
#	CurrentMap.player_spawn = Vector2(randi()%xsize, randi()%ysize)

#var map01 = [
#	['col','wlx','wlx','col'],
#	['wly','def','def','wly'],
#	['wly','def','def','wly'],
#	['col','wlx','wlx','col']
#]
#
#func test_creator():
#	CurrentMap.update_map(map01)
#	CurrentMap.add_map_at(map01, 5, 0)
#	CurrentMap.add_map_at(map01, 0, 5)
#	CurrentMap.add_map_at(map01, 5, 5)
#	CurrentMap.map[1][1] = 'pla'
#	CurrentMap.convert_nulls()
#	generate_map()
