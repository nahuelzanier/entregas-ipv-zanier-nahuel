extends "res://scenes/entities/EntityAbstract.gd"

onready var lighted = false

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_torch
	block = Tags.bl_empty

func get_lifted(player): pass

func light_on_fire():
	CurrentMap.map_manager.replace_entity(self, Tags.et_torch_on)
