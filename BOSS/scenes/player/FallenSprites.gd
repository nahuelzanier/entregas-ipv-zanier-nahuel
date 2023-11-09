extends AnimatedSprite

onready var grab = Vector2(0,0)
onready var sprite = self

func getInput(dir, tile_pos, block_tag):
	return Vector2.ZERO
