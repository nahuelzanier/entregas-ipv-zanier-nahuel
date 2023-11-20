extends "res://scenes/entities/EntityAbstract.gd"

onready var highlight = false
onready var lighted = false

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_torch
	block = Tags.bl_empty

func get_lifted(player): pass

func light_on_fire():
	GlobalAudio.sfx_player.play_sound(GlobalAudio.sfx_player.flame)
	CurrentMap.map_manager.replace_entity(self, Tags.et_torch_on)

func highlight():
	if (CurrentMap.level_node.active_level.map_tag_name == "LIGHT ALL TORCHES"
	|| CurrentMap.level_node.active_level.map_tag_name == "SALT MINES"
	|| CurrentMap.level_node.active_level.map_tag_name == "DARK ROOM ?"
	|| CurrentMap.level_node.active_level.map_tag_name == "DARK ROOM ??"
	|| CurrentMap.level_node.active_level.map_tag_name == "JUNGLE ?"
	|| CurrentMap.level_node.active_level.map_tag_name == "JUNGLE ??"):
		$Sprite.play("highlight")
