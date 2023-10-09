extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_rock
	block = Tags.bl_rock


func turn_into_quake_wisp():
	CurrentMap.map_manager.replace_entity(self, Tags.et_quake_wisp)

func unlift_wisp(player):
	player.set_lift_position(Tags.bl_empty)
	turn_into_quake_wisp()

func become_possessed(wisp):
	wisp.destroy_self()
	turn_into_quake_wisp()
