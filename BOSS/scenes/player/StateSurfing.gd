extends Node2D

onready var sprites = $SurfSprites

func process_state(): pass

func getInput(dir, tile):
	if tile.type_tag != Tags.g_whirlpool:
		var direction = dir
		if Input.is_action_pressed("move_up"):
			direction.y = -1
		if Input.is_action_pressed("move_down"):
			direction.y = 1
		if Input.is_action_pressed("move_left"):
			direction.x = -2
		if Input.is_action_pressed("move_right"):
			direction.x = 2
		sprites.update_sprite(direction.x, direction.y)
		return direction
	else:
		return Vector2.ZERO

func move_multiplier():
	return 1
