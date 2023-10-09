extends Node2D

onready var floor_map = $"../Map/Floor"
onready var entities = $"../Map/Entities"
onready var packed_scenes = $MapGenerator/PackedScenes

func _ready():
	CurrentMap.map_manager = self

func get_tile(vector2):
	return CurrentMap.map[vector2.y][vector2.x]

func replace(tile_name, x, y):
	if x<CurrentMap.size_x() && y<CurrentMap.size_y() && x>=0 && y>=0:
		var old_tile = CurrentMap.map[y][x]
		var old_entities = []
		for e in old_tile.entities:
			old_entities.append(e)		
		var new_tile = packed_scenes.generate_floor_tile(tile_name, x, y)
		for e in old_entities:
			new_tile.entities.append(e)
		CurrentMap.map[y][x] = new_tile
		old_tile.destroy_self()
		floor_map.add_child(new_tile)
		new_tile.on_born()

func replace_entity(entity, entity_tag):
	var et_pos = Global._pos_to_iso(entity.position)
	var tile = CurrentMap.map[et_pos.y][et_pos.x]
	entity.destroy_self()
	var new_entity = packed_scenes.generate_entity(entity_tag, et_pos.x, et_pos.y)
	new_entity.update_tile()
	entities.add_child(new_entity)

func create_entity(entity_tag, iso_x, iso_y):
	var new_entity = packed_scenes.generate_entity(entity_tag, iso_x, iso_y)
	Global.move_to_coordinates(new_entity, iso_x, iso_y)
	entities.add_child(new_entity)

func new_block_with_position(block_tag, iso_x, iso_y):
	var block = packed_scenes.new_block(block_tag)
	place_entity(block, iso_x, iso_y)
	return block

func new_entity(entity_tag):
	return packed_scenes.new_entity(entity_tag)

func new_block(block_tag):
	return packed_scenes.new_block(block_tag)

func place_entity(entity, iso_x, iso_y):
	Global.move_to_coordinates(entity, iso_x, iso_y)
	entities.add_child(entity)
	
func place_floor_effect(floor_effect, iso_x, iso_y):
	Global.move_to_coordinates(floor_effect, iso_x, iso_y)
	floor_map.add_child(floor_effect)
