extends Node2D

onready var sprites = $SpritesCoconut
onready var east = $SpritesCoconut/East
onready var west = $SpritesCoconut/West


func process_state(): pass

func getInput(dir, tile_pos, block_tag):
	return Vector2.ZERO

func move_multiplier():
	return 0

func lifting_sprites():pass
	
func unlifting_sprites():pass

func drink_coconut(direction):
	if direction.x >= 0:
		west.hide()
		east.show()
		east.drink_coconut()
	elif direction.x < 0:
		east.hide()
		west.show()
		west.drink_coconut()

func stop_animation():
	east.playing = false
	west.playing = false
