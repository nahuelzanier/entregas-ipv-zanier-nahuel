extends Node2D

onready var sprites = $SurfSprites
onready var sprites_lift = $SurfSpritesLift

func process_state(): pass

func getInput(dir, tile_pos, block_tag):
	if CurrentMap.map[tile_pos].type_tag != Tags.g_whirlpool:
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
		sprites_lift.update_sprite(direction.x, direction.y)
		return direction
	else:
		return Vector2.ZERO

func update_sprites(x, y):
	sprites.update_sprite(x, y)
	sprites_lift.update_sprite(x, y)

func move_multiplier():
	return 1

func lifting_sprites():
	sprites.hide()
	sprites_lift.show()
	
func unlifting_sprites():
	sprites_lift.hide()
	sprites.show()

func drink_coconut(): pass
