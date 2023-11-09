extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_wall
	tag = Tags.fl_empty_no_access
	lift_block = Tags.bl_empty

func _process(delta): pass

func get_lifted(player): pass

func get_lifted_with_entity(player): pass

#PLAYER
func unlift_wisp(player):pass

func player_is_on(player): pass

func _on_Trigger_body_entered(body):
	if body.tag == Tags.et_player:
		CurrentMap.trigger_level_locations(iso_pos, map_tag)

func wand(wand):pass
