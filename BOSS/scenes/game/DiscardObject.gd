extends Node2D

func _ready():
	$DestroyTimer.start()

func _on_DestroyTimer_timeout():
	self.queue_free()
