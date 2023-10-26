extends RigidBody2D

export var speed = 220
export var default_speed = 220
onready var type_tag = Tags.g_player

onready var lift_position = $LiftingPosition
onready var feet_position = $FeetPosition
onready var highlight = $Highlight
onready var highlight_timer = $HighlightTimer

onready var sprites = $PlayerSprites
onready var state = $States/StatePlayer

var current_tile
var previous_tile
var current_map

onready var is_surfing = false
onready var direction = Vector2.ZERO
onready var tag = Tags.et_player

func _ready():
	PlayerSingleton.player == self
	$PositionTimer.start()
	$TerrainTimer.start()
	update_tile()
	contact_monitor = true
	contacts_reported = 1

func _physics_process(delta):
	rotation = 0
	var grab = grab_coords()
	highlight.global_position = Global._iso_to_pos(grab) + Vector2(0,7)
	apply_central_impulse(direction.normalized()*speed*state.move_multiplier())

func _on_PositionTimer_timeout():
	direction = state.getInput(direction, current_tile)
#	direction = Vector2.ZERO
#	if Input.is_action_pressed("move_up"):
#		direction.y = -1
#	if Input.is_action_pressed("move_down"):
#		direction.y = 1
#	if Input.is_action_pressed("move_left"):
#		direction.x = -2
#	if Input.is_action_pressed("move_right"):
#		direction.x = 2
	sprites.update_sprite(direction.x, direction.y)

func grab_coords():
	return (Global._pos_to_iso(position + Vector2(0,6)) + sprites.sprite.grab)

func lift():
	if !is_surfing:
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
	if current_map == CurrentMap.level_node.active_level.map_tag_name:
		previous_tile = current_tile
		var iso_pos = Global._pos_to_iso(position + Vector2(0,6))
		var on_tile = CurrentMap.map[iso_pos]
		current_tile = on_tile
	else:
		current_map = CurrentMap.level_node.active_level.map_tag_name
		update_tile()
		

func move_away_from_each_other():
	pass

func _on_TerrainTimer_timeout():
	update_tile()
	current_tile.player_is_on(self)

func _on_Player_body_entered(body):
	body.player_collision(self)

func disable_collisions():
	$CollisionPolygon2D.disabled = true
func enable_collisions():
	$CollisionPolygon2D.disabled = false

func start_surfing(palmtree):
	is_surfing = true
	sprites.hide()
	sprites = $SurfSprites
	sprites.show()
	state = $States/StateSurfing
	Global.move_to_coordinates(self, palmtree.current_tile.iso_pos)
	call_deferred("disable_collisions")

func stop_surfing(tile):
	is_surfing = false
	sprites.hide()
	sprites = $PlayerSprites
	sprites.show()
	state = $States/StatePlayer
	Global.move_to_coordinates(self, tile.iso_pos)
	call_deferred("enable_collisions")
	CurrentMap.map_manager.create_entity(Tags.et_palmtree_sink, previous_tile.iso_pos)

func whirlpool(whirlpool):
	sprites.update_sprite(whirlpool.whirlpool_player.x, whirlpool.whirlpool_player.y)
	apply_central_impulse(whirlpool.whirlpool_player*400)

func die():
	Global.move_to_coordinates(self, CurrentMap.player_spawn)
