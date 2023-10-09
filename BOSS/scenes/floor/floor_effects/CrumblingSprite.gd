extends Node2D

onready var sprite = $Sprite
onready var fall_speed = 1

func _process(delta):
	sprite.position.y += fall_speed

func _on_EraseTimer_timeout():
	queue_free()
