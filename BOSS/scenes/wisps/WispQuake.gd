extends "res://scenes/wisps/WispAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_quake_wisp
	$QuakeTimer.start()
	update_tile()
	CurrentMap.map[current_tile].entities.append(self)

func get_lifted(player):
	if player.block_tag() == Tags.fl_empty:
		player.set_lift_position(Tags.bl_rock)
		CurrentMap.map_manager.replace_entity(self, Tags.et_wisp)

func _on_QuakeTimer_timeout():
	$AnimationPlayer.play("QuakeAttack")
	update_tile()
	CurrentMap.map[current_tile].quake_start()
	
