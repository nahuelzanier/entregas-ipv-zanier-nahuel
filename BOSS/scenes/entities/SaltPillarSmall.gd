extends "res://scenes/entities/SaltPillar.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_salt_tile
	block = Tags.bl_salt
	current_size = 0
