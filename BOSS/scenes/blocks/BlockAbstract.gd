extends Sprite

onready var type_tag
onready var unlift
onready var tag
onready var falling = false
onready var fall_speed = 0.8

func _process(delta):
	if falling:
		position.y += fall_speed

func lift(player): pass

func start_falling():
	falling = true
