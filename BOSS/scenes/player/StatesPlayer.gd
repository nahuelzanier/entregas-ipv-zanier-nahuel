extends Node2D

onready var current_state = $StateMoving
onready var highlight = $"../../Highlight"
onready var highlight_timer = $"../../HighlightTimer"
onready var sprites = $PlayerSprites
onready var sprites_lift = $PlayerSpritesLift
onready var direction = Vector2.ZERO

onready var feet_position = $"../../FeetPosition"

signal lift
signal damage

func process_state():
	if Input.is_action_just_pressed("grab"):
		highlight_timer.start()
	if Input.is_action_pressed("grab"):
		current_state = $StateGrabing
	if Input.is_action_just_released("grab"):
		emit_signal("lift")
		current_state = $StateMoving
		highlight.visible = false
		highlight_timer.stop()
	if Input.is_action_just_pressed("move_left"):
		current_state.grab_index_update(-1)
	if Input.is_action_just_pressed("move_right"):
		current_state.grab_index_update(1)
	if Input.is_action_just_pressed("damage_player"):
		emit_signal("damage")

func getInput(dir, tile_pos, block_tag):
	direction = Vector2.ZERO
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction.x = 2*direction.x
	
	var spr_dir = current_state.sprite_direction(direction)
	sprites.update_sprite(spr_dir.x, spr_dir.y)
	sprites_lift.update_sprite(spr_dir.x, spr_dir.y)
	return direction

func move_multiplier():
	return current_state.move_multiplier

func _on_HighlightTimer_timeout():
	highlight.visible = true

func lifting_sprites():
	sprites.hide()
	sprites_lift.show()

func unlifting_sprites():
	sprites_lift.hide()
	sprites.show()

func drink_coconut():pass

func update_sprites():pass






