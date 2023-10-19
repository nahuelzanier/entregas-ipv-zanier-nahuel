extends "res://scenes/wisps/WispAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_wisp
	block = Tags.bl_wisp
	$TerrainTimer.start()
	$MoveTimer.start()
	update_tile()
	current_tile.entities.append(self)

func try_to_move():
	var iso_pos = Global._pos_to_iso(position)
	var x = iso_pos.x
	var y = iso_pos.y
	var positions = [Vector2(x+1,y), Vector2(x-1,y), Vector2(x,y+1), Vector2(x,y-1)]
	for pair in positions:
		CurrentMap.map[pair].moving_sleeping_wisp(self)

func update_tile():
	var iso_pos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[iso_pos]
	current_tile = on_tile

func go_to_sleep():
	pass

func move_away_from_each_other():
	randomize()
	var pool = [-2,-1,0,1,2]
	pool.shuffle()
	var iso_pos = Global._pos_to_iso(position)
	move(iso_pos + Vector2(pool[randi()%5], pool[randi()%5]) )

func get_lifted(player):
	if player.block_tag() == Tags.fl_empty:
		player.grab_entity_block(block)
		destroy_self()
	else:
		current_tile.get_lifted(player)
		update_tile()

func turn_into_water_wisp():
	CurrentMap.map_manager.replace_entity(self, Tags.et_water_wisp)

func turn_into_lava_wisp():
	CurrentMap.map_manager.replace_entity(self, Tags.et_lava_wisp)

func turn_into_sand_wisp():
	CurrentMap.map_manager.replace_entity(self, Tags.et_sand_wisp)

func _on_TerrainTimer_timeout():
	update_tile()
	current_tile.sleeping_wisp_is_on(self)

func _on_MoveTimer_timeout():
	try_to_move()
