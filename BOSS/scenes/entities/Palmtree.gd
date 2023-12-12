extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_palmtree
	block = Tags.bl_palmtree
	highlight()

func grow_coconut():
	CurrentMap.map_manager.replace_entity(self, Tags.et_palmtree_coconut)

func become_possessed(wisp):
	wisp.destroy_self()
	grow_coconut()

func highlight():
	$HighlightTimer.start()

func _on_HighlightTimer_timeout():
	if CurrentMap.level_node.active_level.map_tag_name == "CASTAWAY":
		$Sprite.play("highlight")

