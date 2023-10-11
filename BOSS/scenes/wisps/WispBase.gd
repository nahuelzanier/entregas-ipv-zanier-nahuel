extends "res://scenes/wisps/WispAbstract.gd"

onready var block = Tags.bl_wisp

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_wisp
	$TerrainTimer.start()
	$MoveTimer.start()
	update_tile()
	current_tile.entities.append(self)

func try_to_move():
	var iso_pos = Global._pos_to_iso(position)
	var x = iso_pos.x
	var y = iso_pos.y
	var positions = [[x+1,y],[x-1,y],[x,y+1],[x,y-1]]
	for pair in positions:
		CurrentMap.map[pair[1]][pair[0]].moving_sleeping_wisp(self)

func update_tile():
	var iso_pos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[iso_pos.y][iso_pos.x]
	current_tile = on_tile

func go_to_sleep():
	pass

func move_away_from_each_other():
	randomize()
	var pool = [-2,-1,0,1,2]
	pool.shuffle()
	var iso_pos = Global._pos_to_iso(position)
	move(iso_pos.x+pool[randi()%5], iso_pos.y+pool[randi()%5])

func get_lifted(player):
	if player.block_tag() == Tags.fl_empty:
		player.grab_entity_block(block)
		destroy_self()
	else:
		current_tile.get_lifted(player)

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