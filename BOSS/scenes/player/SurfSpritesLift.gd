extends Node2D

onready var sprite = $SSE

func update_sprite(x, y):
	sprite.hide()
	if x<0 && y<0:
		sprite = $SNW
	if x<0 && y>0:
		sprite = $SSW
	if x>0 && y<0:
		sprite = $SNE
	if x>0 && y>0:
		sprite = $SSE
	sprite.show()
