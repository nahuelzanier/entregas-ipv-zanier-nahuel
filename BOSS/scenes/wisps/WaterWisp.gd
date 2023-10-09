extends "res://scenes/wisps/WispAbstract.gd"

onready var on_land = false

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_water_wisp
	$MoveTimer.start()
	$TerrainTimer.start()
	update_tile()
	current_tile.entities.append(self)

func try_to_move():
	var iso_pos = Global._pos_to_iso(position)
	var x = iso_pos.x
	var y = iso_pos.y
	var positions = [[x+1,y],[x-1,y],[x,y+1],[x,y-1]]
	randomize()
	positions.shuffle()
	for pair in positions:
		CurrentMap.map[pair[1]][pair[0]].moving_water_wisp(self)

func _on_MoveTimer_timeout():
	try_to_move()
	
func _on_TerrainTimer_timeout():
	update_tile()
	current_tile.water_wisp_is_on(self)
