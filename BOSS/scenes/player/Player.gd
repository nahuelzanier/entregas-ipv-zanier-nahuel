extends RigidBody2D

export var speed = 220
export var default_speed = 220
onready var type_tag = Tags.g_player
onready var tag = Tags.et_player

onready var lift_position = $LiftingPosition
onready var feet_position = $FeetPosition
onready var highlight = $Highlight
onready var highlight_timer = $HighlightTimer

onready var state = $States/StatePlayer

var current_tile
var previous_tile
var current_map

onready var is_surfing = false
onready var direction = Vector2.ZERO

func _ready():
	PlayerSingleton.player == self
	$PositionTimer.start()
	$TerrainTimer.start()
	update_tile()
	contact_monitor = true
	contacts_reported = 1

func _physics_process(delta):
	rotation = 0
	state.process_state()
	var grab = grab_coords()
	highlight.global_position = Global._iso_to_pos(grab) + Vector2(0,7)
	apply_central_impulse(direction.normalized()*speed*state.move_multiplier())

func _on_PositionTimer_timeout():
	direction = state.getInput(direction, current_tile)

func update_tile():
	previous_tile = current_tile
	var iso_pos = Global._pos_to_iso(position + Vector2(0,6))
	current_tile = CurrentMap.map[iso_pos]

func move_away_from_each_other():
	pass

func _on_TerrainTimer_timeout():
	update_tile()
	current_tile.player_is_on(self)

func _on_Player_body_entered(body):
	body.player_collision(self)


# GRAB MECHANICS
func grab_coords():
	return (Global._pos_to_iso(position + Vector2(0,6)) + state.sprites.sprite.grab)

func lift():
	lift_position.block.lift(self)

func block():
	return lift_position.block

func block_tag_proper():
	return lift_position.block.tag

func block_tag():
	return lift_position.block.unlift

func grab_floor_block(block):
	var grab = grab_coords()
	CurrentMap.map_manager.replace(block_tag(), grab)
	lift_position.get_new_block(block)

func grab_entity_block(block):
	lift_position.get_new_block(block)

func set_lift_position(block_tag):
	lift_position.get_new_block(block_tag)

func unlift_entity_at(entity_tag, vector2):
	CurrentMap.map_manager.create_entity(entity_tag, vector2)
	lift_position.get_new_block(Tags.bl_empty)

func unlift_entity(entity_tag):
	var grab = grab_coords()
	unlift_entity_at(entity_tag, grab)

func pop_block():
	var tag = lift_position.block.tag
	lift_position.get_new_block(Tags.bl_empty)
	return tag


# DAMAGE
func die():
	Global.move_to_coordinates(self, CurrentMap.player_spawn)


# SURF
func start_surfing(palmtree):
	is_surfing = true
	lift_position.position = lift_position.surfing_position
	state.sprites.hide()
	state = $States/StateSurfing
	state.sprites.show()
	collision_layer = 2
	collision_mask = 2
	Global.move_to_coordinates(self, palmtree.current_tile.iso_pos)

func stop_surfing(tile):
	is_surfing = false
	lift_position.position = lift_position.player_position
	state.sprites.hide()
	state = $States/StatePlayer
	state.sprites.show()
	collision_layer = 1
	collision_mask = 1
	Global.move_to_coordinates(self, tile.iso_pos)
	CurrentMap.map_manager.create_entity(Tags.et_palmtree_sink, previous_tile.iso_pos)

func whirlpool(whirlpool):
	if previous_tile.push_dir != current_tile.push_dir:
		global_position = whirlpool.center.global_position
	state.sprites.update_sprite(whirlpool.whirlpool_player.x, whirlpool.whirlpool_player.y)
	apply_central_impulse(whirlpool.whirlpool_player*600)
