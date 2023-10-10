extends Node

var player_spawn = Vector2(2,7)
onready var entities = {}
var map

func create_static_entities():
	pass

func create_entities():
	for k in entities.keys():
		CurrentMap.map_manager.create_entity(entities[k][0], entities[k][1], entities[k][2])
	entities = {}

func trigger_level_locations(iso_position): pass
