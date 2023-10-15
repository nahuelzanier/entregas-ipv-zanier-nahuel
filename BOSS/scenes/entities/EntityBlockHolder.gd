extends "res://scenes/entities/EntityAbstract.gd"

var held_block

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_block_holder
	block = Tags.bl_empty
	held_block = CurrentMap.map_manager.new_block(Tags.bl_empty)

func _process(delta):
	current_tile.block_holder(self)

func get_lifted(player):
	if player.block_tag() == Tags.fl_empty:
		player.grab_entity_block(block)
		destroy_self()
		
func set_block(set_block):
	self.block = set_block
	held_block = CurrentMap.map_manager.new_block(set_block)
	$BlockPosition.add_child(held_block)

func unlift():
	return held_block.unlift
