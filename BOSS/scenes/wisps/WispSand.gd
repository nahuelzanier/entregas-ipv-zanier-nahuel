extends "res://scenes/wisps/WispAbstract.gd"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_sand_wisp
	$TerrainTimer.start()
	$MoveTimer.start()
	update_tile()
	CurrentMap.map[current_tile].entities.append(self)

func try_to_move():
	var iso_pos = Global._pos_to_iso(position)
	var x = iso_pos.x
	var y = iso_pos.y
	var positions = [Vector2(x+1,y), Vector2(x-1,y), Vector2(x,y+1), Vector2(x,y-1)]
	randomize()
	positions.shuffle()
	for pair in positions:
		CurrentMap.map[pair].moving_sand_wisp(self)

func _on_MoveTimer_timeout():
	try_to_move()

func _on_TerrainTimer_timeout():
	update_tile()
	CurrentMap.map[current_tile].sand_wisp_is_on(self)
