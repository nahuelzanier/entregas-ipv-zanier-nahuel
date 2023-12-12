extends "res://scenes/entities/EntityAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_stone_lid
	block = Tags.bl_stone_lid
	highlight()


func highlight():
	$HighlightTimer.start()

func _on_HighlightTimer_timeout():
	if (CurrentMap.level_node.active_level.map_tag_name == "STRANGE ISLAND"
	 || CurrentMap.level_node.active_level.map_tag_name == "FISHER'S VILLA"):
		$Sprite.play("highlight")
