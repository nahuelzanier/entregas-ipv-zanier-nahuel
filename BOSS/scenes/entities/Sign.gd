extends "res://scenes/entities/EntityAbstract.gd"

onready var text

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_sign
	block = Tags.bl_sign
	highlight()

func _on_Area2D_body_entered(body):
	if body.type_tag == Tags.g_player:
		PlayerSingleton.set_label(text)

func _on_Area2D_body_exited(body):
	if body.type_tag == Tags.g_player:
		PlayerSingleton.default_label()

func get_lifted(player):pass

func highlight():
	if (CurrentMap.level_node.active_level.map_tag_name == "CASTAWAY"
	|| CurrentMap.level_node.active_level.map_tag_name == "STRANGE ISLAND"):
		$Sprite.play("highlight")
