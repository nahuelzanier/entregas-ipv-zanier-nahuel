extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_door_south
	block = Tags.bl_empty

func get_lifted(player):
	pass
