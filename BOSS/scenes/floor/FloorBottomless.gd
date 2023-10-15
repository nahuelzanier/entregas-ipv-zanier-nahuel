extends "res://scenes/floor/FloorAbstract.gd"

export (PackedScene) var falling_water
export (PackedScene) var falling_lava
onready var falling_element = $FallingElements
onready var current_falling_effects = []

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_bottomless
	lift_block = Tags.bl_empty

func _process(delta):
	if entities.size()>0:
		var block = CurrentMap.map_manager.new_block(entities[0].block)
		entities[0].destroy_self()
		falling_element.start_falling(block)

func _on_RespawnCrumblingTile_timeout():
	CurrentMap.map_manager.replace(Tags.fl_crumble, iso_x, iso_y)

func get_lifted(player):
	var block = CurrentMap.map_manager.new_block(player.block().tag)
	player.pop_block()
	falling_element.start_falling(block)

func bottomless_effect_update():
	for effect in current_falling_effects:
		effect.queue_free()
	current_falling_effects.clear()
	for i in [1, -1]:
		CurrentMap.map[iso_y][iso_x + i].born_bottomless_tile(self)
		CurrentMap.map[iso_y + i][iso_x].born_bottomless_tile(self)

#TILES
func born_water_tile(tile):
	bottomless_effect_update()

func born_lava_tile(tile):
	bottomless_effect_update()

func born_default_tile(tile):
	bottomless_effect_update()

#ENTITIES
func unlift_rock():
	return entities.size() == 0

func unlift_palmtree():
	return entities.size() == 0

func block_holder(block_holder):pass
