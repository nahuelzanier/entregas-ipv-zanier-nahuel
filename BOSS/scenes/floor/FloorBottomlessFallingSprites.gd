extends Node2D

onready var current_elements = []

func start_falling(block):
	add_child(block)
	current_elements.append(block)
	block.start_falling()
	$RemoveElementTimer.start()
	
func _on_RemoveElementTimer_timeout():
	for i in current_elements:
		i.queue_free()
	current_elements.clear()
