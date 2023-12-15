extends Area2D

var damage = 75

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	self.queue_free()

func _on_Lightning_body_entered(body):
	body._recieve_damage(damage)
	body.explosion((body.position-self.position).normalized()*7500)


