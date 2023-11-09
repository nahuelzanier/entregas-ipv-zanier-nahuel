extends Node2D

onready var sprites = $FallenSprites

func process_state(): pass

func getInput(dir, tile_pos, block_tag):
	return Vector2.ZERO

func move_multiplier():
	return 0

func lifting_sprites():pass
	
func unlifting_sprites():pass

func player_fall():
	sprites.play("fall")

func stop_animation():
	sprites.stop()

func update_sprites(x, y):pass
