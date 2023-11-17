extends "res://scenes/entities/EntityAbstract.gd"

onready var coconut = $Coconut

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_palmtree_coconut
	block = Tags.bl_palmtree
	highlight()

func get_lifted(player):
	if player.block_tag() == Tags.fl_empty:
		player.drink_coconut()
		CurrentMap.map_manager.replace_entity(self, Tags.et_palmtree)

func highlight():
	if CurrentMap.level_node.active_level.map_tag_name == "SEASIDE CLIFFS":
		$HighlightTimer.start()


func _on_HighlightTimer_timeout():
	$Coconut.play("highlight")
