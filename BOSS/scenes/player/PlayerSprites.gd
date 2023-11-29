extends Node2D

onready var sprite = $S
onready var state_grabing = $"../StateGrabing"

func update_sprite(x, y):
	sprite.hide()
	if x==0 && y<0:
		sprite = $N
		state_grabing.current_index = 3
	if x==0 && y>0:
		sprite = $S
		state_grabing.current_index = 7
	if x<0 && y==0:
		sprite = $W
		state_grabing.current_index = 5
	if x>0 && y==0:
		sprite = $E
		state_grabing.current_index = 1
	if x<0 && y<0:
		sprite = $NW
		state_grabing.current_index = 4
	if x<0 && y>0:
		sprite = $SW
		state_grabing.current_index = 6
	if x>0 && y<0:
		sprite = $NE
		state_grabing.current_index = 2
	if x>0 && y>0:
		sprite = $SE
		state_grabing.current_index = 0
	sprite.show()
	if x!=0 || y!=0:
		sprite.animate_walk()
	else:
		sprite.stop_walk_anim()
