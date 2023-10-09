extends "res://scenes/floor/FloorAbstract.gd"

export (PackedScene) var falling_tile

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_crumble

func get_lifted(player):
	pass

func _on_Area2D_body_exited(body):
	call_deferred("fall")

func fall():
	var falling_floor = falling_tile.instance()
	CurrentMap.map_manager.place_floor_effect(falling_floor, iso_x, iso_y)
	CurrentMap.map_manager.replace(Tags.fl_empty, iso_x, iso_y)
	CurrentMap.map[iso_y][iso_x].crumbling_tile_active()

#ENTITIES
func unlift_rock():
	return entities.size() < 1
