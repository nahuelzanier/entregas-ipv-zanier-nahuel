extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_wall
	tag = Tags.fl_door_south

func get_lifted(player): pass

func create_detail():
	CurrentMap.map_manager.create_entity(Tags.et_door_south, iso_x, iso_y)

func switch_sprites():
	$Sprite.visible = !$Sprite.visible
	$Sprite2.visible = !$Sprite2.visible