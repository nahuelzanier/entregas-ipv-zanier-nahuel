extends RigidBody2D

export var speed = 220
export var default_speed = 220
onready var type_tag = Tags.g_player
onready var tag = Tags.et_player

onready var lift_position = $LiftingPosition
onready var feet_position = $FeetPosition
onready var highlight = $Highlight
onready var highlight_perma = $HighlightPerma

onready var highlight_timer = $HighlightTimer

onready var states = $States
onready var state = $States/StatePlayer

onready var invincible = false

var current_tile
var previous_tile
var current_map

onready var is_surfing = false
onready var is_lifting = false
onready var can_sink = true
onready var direction = Vector2.ZERO

func _ready():
	PlayerSingleton.player == self
	PlayerSingleton.update_hearts()
	$PositionTimer.start()
	$TerrainTimer.start()
	update_tile()
	contact_monitor = true
	contacts_reported = 1
	player_fall()

func _physics_process(delta):
	rotation = 0
	state.process_state()
	var grab = grab_coords()
	highlight_perma.global_position = Global._iso_to_pos(grab) + Vector2(0,7)
	highlight.global_position = Global._iso_to_pos(grab) + Vector2(0,7)
	apply_central_impulse(direction.normalized()*speed*state.move_multiplier())

func _on_PositionTimer_timeout():
	if block_tag() == Tags.fl_empty:
		states.unlifting_sprites()
		is_lifting = false
	else:
		states.lifting_sprites()
		is_lifting = true
	direction = state.getInput(direction, current_tile, block_tag())

func update_tile():
	previous_tile = current_tile
	current_tile = Global._pos_to_iso(position + Vector2(0,6))

func move_away_from_each_other():
	pass

func _on_TerrainTimer_timeout():
	update_tile()
	CurrentMap.map[current_tile].player_is_on(self)

func _on_Player_body_entered(body):
	body.player_collision(self)

# GRAB MECHANICS
func grab_coords():
	return (Global._pos_to_iso(position + Vector2(0,6)) + state.sprites.sprite.grab)

func lift():
	GlobalAudio.sfx_player.play_sound(GlobalAudio.sfx_player.pick_up)
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

func reset_player():
	if is_surfing:
		is_surfing = false
		lift_position.position = lift_position.player_position
		state.hide()
		state = $States/StatePlayer
		state.show()
		collision_layer = 1
		collision_mask = 1
	pop_block()

func unlift_sign(unlift, lifted_text):
	var sign_unlifted = CurrentMap.map_manager.new_entity(Tags.et_sign)
	sign_unlifted.text = lifted_text
	CurrentMap.map_manager.place_entity(sign_unlifted, grab_coords())
	lift_position.get_new_block(Tags.bl_empty)

func grab_sign(block, text):
	lift_position.get_sign_block(block, text)

# DAMAGE
func take_damage(vector2):
	if !invincible:
		GlobalAudio.sfx_player.play_sound(GlobalAudio.sfx_player.hurt)
		invincible = true
		$InmunityTimer.start()
		$DamagedTimer.start()
		PlayerSingleton.damage(1)
		apply_central_impulse(vector2*3000)

func _on_DamagedTimer_timeout():
	state.visible = !state.visible

func _on_InmunityTimer_timeout():
	invincible = false
	state.visible = true
	$DamagedTimer.stop()

func drink_coconut():
	var direction = state.sprites.sprite.grab
	state.hide()
	state = $States/StateCoconut
	state.show()
	state.drink_coconut(direction)

func _coconut_animation_finished():
	state.stop_animation()
	state.hide()
	state = $States/StatePlayer
	state.show()
	PlayerSingleton.recover_life()

func sink():
	direction = Vector2.ZERO
	if can_sink:
		can_sink = false
		hide()
		var block_holder = CurrentMap.map_manager.new_entity(Tags.et_block_holder)
		CurrentMap.map_manager.place_entity(block_holder, current_tile)
		block_holder.set_block(Tags.bl_player)
		PlayerSingleton.topUI.set_label("BYEEEEEEEE...")
		$SinkTimer.start()

func _on_SinkTimer_timeout():
	position = Global._iso_to_pos(CurrentMap.player_spawn)
	PlayerSingleton.topUI.set_label(CurrentMap.level_node.active_level.map_tag_name)
	player_fall()
	show()
	take_damage(Vector2.ZERO)
	is_surfing = false
	lift_position.position = lift_position.player_position
	collision_layer = 1
	collision_mask = 1
	can_sink = true

# SURF
func start_surfing(palmtree):
	highlight_perma.hide()
	GlobalAudio.sfx_player.play_sound(GlobalAudio.sfx_player.hop)
	is_surfing = true
	lift_position.position = lift_position.surfing_position
	state.hide()
	state = $States/StateSurfing
	state.show()
	collision_layer = 2
	collision_mask = 2
	Global.move_to_coordinates(self, palmtree.current_tile)

func stop_surfing_ingore_palmtree():
	highlight_perma.show()
	is_surfing = false
	lift_position.position = lift_position.player_position
	state.hide()
	state = $States/StatePlayer
	state.show()
	collision_layer = 1
	collision_mask = 1

func stop_surfing(tile):
	highlight_perma.show()
	GlobalAudio.sfx_player.play_sound(GlobalAudio.sfx_player.hop)
	is_surfing = false
	lift_position.position = lift_position.player_position
	state.hide()
	state = $States/StatePlayer
	state.show()
	collision_layer = 1
	collision_mask = 1
	Global.move_to_coordinates(self, tile.iso_pos)
	CurrentMap.map_manager.create_entity(Tags.et_palmtree_sink, previous_tile)

func whirlpool(whirlpool):
	if CurrentMap.map[previous_tile].push_dir != CurrentMap.map[current_tile].push_dir:
		global_position = whirlpool.center.global_position
	state.update_sprites(whirlpool.whirlpool_player.x, whirlpool.whirlpool_player.y)
	apply_central_impulse(whirlpool.whirlpool_player*600)

#FALL
func player_fall():
	highlight_perma.hide()
	state.hide()
	state = $States/StateFallen
	state.show()
	state.player_fall()

func _on_fall_animation_finished():
	highlight_perma.show()
	state.stop_animation()
	state.hide()
	state = $States/StatePlayer
	state.show()
