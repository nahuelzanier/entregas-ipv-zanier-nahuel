extends CanvasLayer


signal title_screen
onready var game_over = false

func _process(delta):
	if game_over:
		if Input.is_action_pressed("start"):
			emit_signal("title_screen")
