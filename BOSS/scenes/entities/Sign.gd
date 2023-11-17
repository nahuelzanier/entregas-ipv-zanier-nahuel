extends "res://scenes/entities/EntityAbstract.gd"

onready var text

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_sign
	block = Tags.bl_sign


func _on_Area2D_body_entered(body):
	if body.type_tag == Tags.g_player:
		PlayerSingleton.game.call(text)

func _on_Area2D_body_exited(body):
	if body.type_tag == Tags.g_player:
		PlayerSingleton.game.call(text)

func get_lifted(player):pass
