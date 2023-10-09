extends KinematicBody2D

onready var type_tag 
onready var tag
onready var block
var current_tile
onready var sprite = $Sprite

func _ready():
	update_tile()
	current_tile.entities.append(self)

func update_tile():
	var iso_pos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[iso_pos.y][iso_pos.x]
	current_tile = on_tile

func destroy_self():
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
