extends RigidBody2D

export var speed = 220
export var default_speed = 220
onready var sprites = $PlayerSprites
onready var lift_position = $LiftingPosition
onready var feet_position = $FeetPosition
onready var highlight = $Highlight
onready var highlight_timer = $HighlightTimer
onready var state = $StatesPlayer
var current_tile
onready var direction = Vector2.ZERO
onready var tag = Tags.et_player

func _ready():
	$PositionTimer.start()
	$TerrainTimer.start()
	update_tile()

func _physics_process(delta):
	if Input.is_action_just_released("grab"):
		call_deferred("lift")
	rotation = 0
	var grab = grab_coords()
	highlight.global_position = Global._iso_to_pos(grab) + Vector2(0,7)
	apply_central_impulse(direction.normalized()*speed*state.current_state.move_multiplier)

func _on_PositionTimer_timeout():
	direction = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		direction.y = -1
	if Input.is_action_pressed("move_down"):
		direction.y = 1
	if Input.is_action_pressed("move_left"):
		direction.x = -2
	if Input.is_action_pressed("move_right"):
		direction.x = 2
	sprites.update_sprite(direction.x, direction.y)

func grab_coords():
	return (Global._pos_to_iso(position + Vector2(0,6)) + sprites.sprite.grab)

func lift():
	lift_position.block.lift(self)

func block():
	return lift_position.block

func block_tag_proper():
	return lift_position.block.tag

func block_tag():  #the entity it unlifts to
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

func update_tile():
	var iso_pos = Global._pos_to_iso(position + Vector2(0,6))
	var on_tile = CurrentMap.map[iso_pos]
	current_tile = on_tile

func move_away_from_each_other():
	pass

func _on_TerrainTimer_timeout():
	update_tile()
	current_tile.player_is_on(self)

