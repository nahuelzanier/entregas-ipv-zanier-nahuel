extends Node2D

onready var current_state = $StateMoving
onready var highlight = $"../../Highlight"
onready var highlight_timer = $"../../HighlightTimer"
onready var sprites = $PlayerSprites
onready var sprites_lift = $PlayerSpritesLift

signal lift

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

func getInput(dir, tile_pos, block_tag):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		direction.y = -1
	if Input.is_action_pressed("move_down"):
		direction.y = 1
	if Input.is_action_pressed("move_left"):
		direction.x = -2
	if Input.is_action_pressed("move_right"):
		direction.x = 2
	sprites.update_sprite(direction.x, direction.y)
	sprites_lift.update_sprite(direction.x, direction.y)
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
