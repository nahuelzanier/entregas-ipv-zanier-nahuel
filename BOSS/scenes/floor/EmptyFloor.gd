extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_empty
	lift_block = Tags.bl_empty

func on_born():
	for i in [1, -1]:
		CurrentMap.map[iso_pos + Vector2(i,0)].born_empty_tile(self)
		CurrentMap.map[iso_pos + Vector2(0,i)].born_empty_tile(self)

func _on_RespawnCrumblingTile_timeout():
	CurrentMap.map_manager.replace(Tags.fl_crumble, iso_pos)

#TILES
func born_water_tile(tile):
	var crumbling_tile = respawn_crumbling_tile
	CurrentMap.map_manager.replace(Tags.fl_water, iso_pos)
	if crumbling_tile:
		CurrentMap.map[iso_pos].crumbling_tile_active()

func born_lava_tile(tile):
	var crumbling_tile = respawn_crumbling_tile
	CurrentMap.map_manager.replace(Tags.fl_lava, iso_pos)
	if crumbling_tile:
		CurrentMap.map[iso_pos].crumbling_tile_active()

func born_beach_tile(tile):
	var crumbling_tile = respawn_crumbling_tile
	CurrentMap.map_manager.replace(Tags.fl_beach, iso_pos)
	if crumbling_tile:
		CurrentMap.map[iso_pos].crumbling_tile_active()

func button_active_effect(button): 
	if entities.size() > 0:
		entities[0].button_active_effect(button)
