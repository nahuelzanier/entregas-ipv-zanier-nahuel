extends "res://scenes/entities/EntityAbstract.gd"

onready var lighted = true

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_torch_on
	block = Tags.bl_empty

func unlift_wisp(player):
	player.pop_block()
	CurrentMap.map_manager.create_entity(Tags.et_fire_wisp, current_tile)

func get_lifted(player): pass

func light_on_fire(): pass

func become_possessed(wisp):pass

func highlight():
	if (CurrentMap.level_node.active_level.map_tag_name == "LIGHT ALL TORCHES"
	|| CurrentMap.level_node.active_level.map_tag_name == "SALT MINES"
	|| CurrentMap.level_node.active_level.map_tag_name == "DARK ROOM ?"
	|| CurrentMap.level_node.active_level.map_tag_name == "DARK ROOM ??"
	|| CurrentMap.level_node.active_level.map_tag_name == "JUNGLE ?"
	|| CurrentMap.level_node.active_level.map_tag_name == "JUNGLE ??"):
		$Sprite.play("highlight")
