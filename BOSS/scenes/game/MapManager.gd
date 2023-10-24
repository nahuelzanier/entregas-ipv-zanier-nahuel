extends Node

export (PackedScene) var discard_object
onready var rendered = $"../Rendered"
onready var packed_scenes = $MapGenerator/PackedScenes

func _ready():
	CurrentMap.map_manager = self

func get_tile(vector2):
	return CurrentMap.map[vector2]

#func replace(tile_name, x, y):
#	if x<CurrentMap.size_x() && y<CurrentMap.size_y() && x>=0 && y>=0:
#		var old_tile = CurrentMap.map[y][x]
#		var old_entities = []
#		for e in old_tile.entities:
#			old_entities.append(e)		
#		var new_tile = packed_scenes.generate_floor_tile(tile_name, x, y)
#		for e in old_entities:
#			new_tile.entities.append(e)
#		CurrentMap.map[y][x] = new_tile
#		old_tile.destroy_self()
#		rendered.floor_map.add_child(new_tile)
#		new_tile.on_born()
#		CurrentMap.level_node.active_level.map[y][x] = tile_name

func replace(tile_name, vector2):
	var old_tile = CurrentMap.map[vector2]
	var old_entities = []
	for e in old_tile.entities:
		old_entities.append(e)
	var new_tile = packed_scenes.generate_floor_tile(tile_name, vector2)
	new_tile.previous_tile = old_tile.tag
	for e in old_entities:
		new_tile.entities.append(e)
	CurrentMap.map[vector2] = new_tile
	old_tile.destroy_self()
	rendered.floor_map.add_child(new_tile)
	new_tile.on_born()
	CurrentMap.level_node.active_level.map[vector2] = tile_name

func replace_entity(entity, entity_tag):
	var et_pos = Global._pos_to_iso(entity.position)
	var tile = CurrentMap.map[et_pos]
	entity.destroy_self()
	var new_entity = packed_scenes.generate_entity(entity_tag, et_pos)
	new_entity.update_tile()
	rendered.entities.add_child(new_entity)

func create_entity(entity_tag, vector2):
	var new_entity = packed_scenes.generate_entity(entity_tag, vector2)
	Global.move_to_coordinates(new_entity, vector2)
	rendered.entities.add_child(new_entity)

func new_block_with_position(block_tag, vector2):
	var block = packed_scenes.new_block(block_tag)
	place_entity(block, vector2)
	return block

func new_entity(entity_tag):
	return packed_scenes.new_entity(entity_tag)

func new_block(block_tag):
	return packed_scenes.new_block(block_tag)

func place_entity(entity, vector2):
	Global.move_to_coordinates(entity, vector2)
	rendered.entities.add_child(entity)
	
func place_floor_effect(floor_effect, vector2):
	Global.move_to_coordinates(floor_effect, vector2)
	rendered.floor_map.add_child(floor_effect)
