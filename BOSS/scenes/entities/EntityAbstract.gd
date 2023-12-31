extends KinematicBody2D

onready var type_tag = Tags.g_entity
onready var tag
onready var block
var current_tile
onready var sprite = $Sprite

func _ready():
	update_tile()
	CurrentMap.map[current_tile].entities.append(self)

func update_tile():
	current_tile = Global._pos_to_iso(position)

func move(vector2):
	CurrentMap.map[current_tile].entities.erase(self)
	Global.move_to_coordinates(self, vector2)
	update_tile()
	CurrentMap.map[current_tile].entities.append(self)

func destroy_self():
	CurrentMap.map[current_tile].entities.erase(self)
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
	move(coords + direction)

func light_on_fire(): pass

func bottomless_pit(pit):
	var new_block = CurrentMap.map_manager.new_block(block)
	destroy_self()
	pit.falling_element.start_falling(new_block)

func player_collision(player):pass

func highlight(): pass
