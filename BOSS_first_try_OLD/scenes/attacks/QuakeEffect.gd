extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var affected

func _ready():
	affected.move_speed = affected.default_speed/3

func _on_Timer_timeout():
	if affected.status_effects.quake == 0:
		affected.move_speed = affected.default_speed
		self.queue_free()
	affected._recieve_damage(20)
