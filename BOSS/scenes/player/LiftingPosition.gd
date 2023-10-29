extends Position2D

onready var block = $BlockEmpty
onready var player_position = position
onready var surfing_position = position + Vector2(0,-10)

func get_new_block(block_tag):
	var new_block = CurrentMap.map_manager.new_block(block_tag)
	self.block.queue_free()
	add_child(new_block)
	self.block = new_block
