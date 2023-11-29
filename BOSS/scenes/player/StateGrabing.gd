extends Node
onready var move_multiplier = 0
onready var current_index = 0
onready var directions = [
	Vector2(2,1),
	Vector2(2,0),
	Vector2(2,-1),
	Vector2(0,-1),
	Vector2(-2,-1),
	Vector2(-2,0),
	Vector2(-2,1),
	Vector2(0,1)
]

func grab_index_update(direction):
	if direction < 0:
		current_index += 1
	elif direction > 0:
		current_index -= 1
	current_index = current_index%directions.size()

func sprite_direction(direction):
	return directions[current_index]
