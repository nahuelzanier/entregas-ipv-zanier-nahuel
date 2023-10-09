extends Node2D

onready var floor_map = $Floor
onready var entities = $Entities
export (PackedScene) var ysort_floor
export (PackedScene) var ysort_entities

func _ready():
	CurrentMap.rendered = self

func reset_rendered_elements():
	floor_map.queue_free()
	entities.queue_free()
	var floor_map_inst = ysort_floor.instance()
	var entities_inst = ysort_entities.instance()
	add_child(floor_map_inst)
	add_child(entities_inst)
	floor_map = floor_map_inst
	entities = entities_inst
