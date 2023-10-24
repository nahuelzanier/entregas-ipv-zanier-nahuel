extends Area2D

onready var type_tag
onready var tag
var current_tile
var block

func try_to_move(): pass

func move(vector2):
	update_tile()
	current_tile.entities.erase(self)
#	var x_pos = max(min(vector2.x, CurrentMap.size_x()-2), 1)
#	var y_pos = max(min(vector2.y, CurrentMap.size_y()-2), 1)
	Global.move_to_coordinates(self, vector2)
	update_tile()
	current_tile.entities.append(self)

func move_whirlpool(direction):
	var coords = Global._pos_to_iso(position)
	update_tile()
	current_tile.entities.erase(self)
	Global.move_to_coordinates(self, coords + direction)
	update_tile()
	current_tile.entities.append(self)

func update_tile():
	var iso_pos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[iso_pos]
	current_tile = on_tile

func go_to_sleep():
	CurrentMap.map_manager.replace_entity(self, Tags.et_wisp)

func move_away_from_each_other():
	try_to_move()

func destroy_self():
	update_tile()
	current_tile.entities.erase(self)
	self.queue_free()

func get_lifted(player):
	update_tile()
	current_tile.get_lifted(player)

func unlift_wisp(player): pass

func become_possessed(wisp):pass

func water_wisp_effect():pass
func button_active_effect(button): pass
func button_inactive_effect(button): pass

func whirlpool(direction):
	move_whirlpool(direction)
func set_block(block_tag):pass
func light_on_fire():pass
