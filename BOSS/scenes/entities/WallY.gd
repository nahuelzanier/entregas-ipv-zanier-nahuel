extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_wall
	tag = Tags.et_wall_y
	block = Tags.bl_empty

func get_lifted(player):pass
