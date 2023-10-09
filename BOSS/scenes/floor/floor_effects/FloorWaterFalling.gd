extends Node2D

onready var sprite = $Sprite
onready var fall_speed = 0.5
onready var start_pos = sprite.position

func _process(delta):
	sprite.position.y += fall_speed

func _on_RestartTimer_timeout():
	sprite.position = start_pos
