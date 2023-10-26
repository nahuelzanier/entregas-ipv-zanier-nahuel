extends "res://scenes/entities/EntityAbstract.gd"

onready var lighted = true

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_torch_on
	block = Tags.bl_empty

func get_lifted(player): pass

func light_on_fire(): pass

func become_possessed(wisp):
	wisp.turn_into_fire_wisp()
