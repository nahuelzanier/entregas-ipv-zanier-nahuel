extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_wall
	tag = Tags.fl_door_right

func get_lifted(player): pass

func create_detail():
	CurrentMap.map_manager.create_entity(Tags.et_door_right, iso_pos)

func switch_sprites():
	$Sprite.visible = !$Sprite.visible
	$Sprite2.visible = !$Sprite2.visible

