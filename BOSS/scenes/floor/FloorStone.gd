extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_stone

func _process(delta): pass

func get_lifted(player): pass

func get_lifted_with_entity(player): pass

func unlift_wisp(player):pass
