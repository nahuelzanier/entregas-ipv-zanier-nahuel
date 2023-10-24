extends KinematicBody2D

onready var type_tag = Tags.g_entity
onready var tag
onready var block
var current_tile
onready var sprite = $Sprite

func _ready():
	update_tile()
	current_tile.entities.append(self)

func update_tile():
	var iso_pos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[iso_pos]
	current_tile = on_tile

func destroy_self():
	update_tile()
	current_tile.entities.erase(self)
	self.queue_free()

func move_away_from_each_other():
	pass

func get_lifted(player):
	if player.block_tag() == Tags.fl_empty:
		player.grab_entity_block(block)
		destroy_self()

func unlift_wisp(player): pass

func become_possessed(wisp): pass

func water_wisp_effect(): pass

func button_active_effect(button): pass
func button_inactive_effect(button): pass

func whirlpool(direction):
	var coords = Global._pos_to_iso(position)
	update_tile()
	current_tile.entities.erase(self)
	Global.move_to_coordinates(self, coords + direction)
	update_tile()
	current_tile.entities.append(self)

func light_on_fire(): pass
