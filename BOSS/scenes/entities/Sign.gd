extends "res://scenes/entities/EntityAbstract.gd"

onready var text

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_sign
	block = Tags.bl_sign


func _on_Area2D_body_entered(body):
	if body.type_tag == Tags.g_player:
		PlayerSingleton.topUI.set_label(text)


func _on_Area2D_body_exited(body):
	if body.type_tag == Tags.g_player:
		PlayerSingleton.topUI.set_label(CurrentMap.level_node.active_level.map_tag_name)

func get_lifted(player):
	if player.block_tag() == Tags.fl_empty:
		player.grab_sign(block, text)
		destroy_self()
