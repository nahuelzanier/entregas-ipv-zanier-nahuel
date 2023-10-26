extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_wall
	tag = Tags.fl_empty_no_access
	lift_block = Tags.bl_empty

func _process(delta): pass

func get_lifted(player): pass

func get_lifted_with_entity(player): pass

#PLAYER
func player_is_on(player):
	player.die()

func unlift_wisp(player):pass
