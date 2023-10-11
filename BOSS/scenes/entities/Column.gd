extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_wall
	tag = Tags.et_column
	block = Tags.bl_empty


func get_lifted(player): pass
