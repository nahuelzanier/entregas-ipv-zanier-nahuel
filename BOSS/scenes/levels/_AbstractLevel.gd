extends Node

var map_tag_name
var player_spawn = Vector2(2,7)
onready var entities = {}
var map = {}

func create_static_entities():
	pass

func create_entities():
	for k in entities.keys():
		CurrentMap.map_manager.create_entity(entities[k], k)
	entities = {}

func update_maps():pass

func trigger_level_locations(iso_position, tag): pass
