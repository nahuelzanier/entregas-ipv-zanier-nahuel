extends "res://scenes/floor/FloorAbstract.gd"

export (PackedScene) var crumbling_tile
export (PackedScene) var falling_water
export (PackedScene) var falling_lava
onready var falling_element = $FallingElements
onready var current_falling_effects = []

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_bottomless
	lift_block = Tags.bl_empty
	$KinematicBody2D.tag = tag

func _process(delta):
	if entities.size() > 0:
		for entity in entities:
			entity.bottomless_pit(self)

func _on_RespawnCrumblingTile_timeout():
	CurrentMap.map_manager.replace(Tags.fl_crumble, iso_pos)

func get_lifted(player):
	var block = CurrentMap.map_manager.new_block(player.block().tag)
	player.pop_block()
	falling_element.start_falling(block)

func bottomless_effect_update():
	for effect in current_falling_effects:
		effect.queue_free()
	current_falling_effects.clear()
	for i in [1, -1]:
		CurrentMap.map[iso_pos + Vector2(i,0)].born_bottomless_tile(self)
		CurrentMap.map[iso_pos + Vector2(0,i)].born_bottomless_tile(self)

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

func button_active_effect(button): 
	if entities.size() > 0:
		entities[0].button_active_effect(button)

func player_is_on(player):
	player.sink()
