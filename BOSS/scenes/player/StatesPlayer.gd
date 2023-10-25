extends Node

onready var current_state = $StateMoving
onready var highlight = $"../Highlight"
onready var highlight_timer = $"../HighlightTimer"

signal lift

func _process(delta):
	if Input.is_action_just_pressed("grab"):
		highlight_timer.start()
	if Input.is_action_pressed("grab"):
		current_state = $StateGrabing
	if Input.is_action_just_released("grab"):
		emit_signal("lift")
		current_state = $StateMoving
		highlight.visible = false
		highlight_timer.stop()



func _on_HighlightTimer_timeout():
	highlight.visible = true
