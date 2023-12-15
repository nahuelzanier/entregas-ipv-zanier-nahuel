extends Area2D

export (PackedScene) var quake_effect

var damage = 10
var floor_tile

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	floor_tile.quake = false
	self.queue_free()

func _on_Quake_body_entered(body):
	if body.status_effects.no_quake():
		body.status_effects.add_quake()
		var new_quake_effect = quake_effect.instance()
		new_quake_effect.affected = body
		body.add_child(new_quake_effect)
	else:
		body.status_effects.add_quake()

func _on_Quake_body_exited(body):
	body.status_effects.remove_quake()
