extends Node2D

var map_tag_name
var player_spawn = Vector2(2,7)
onready var map = {}
onready var entities = {}
onready var triggers = {}

func create_entities():
	for k in entities.keys():
		CurrentMap.map_manager.create_entity(entities[k], k)

func update_maps():pass

func trigger_level_locations(iso_position, tag):
	if tag == self.map_tag_name:
		CurrentMap.call_deferred(triggers[iso_position][0], triggers[iso_position][1], triggers[iso_position][2])
