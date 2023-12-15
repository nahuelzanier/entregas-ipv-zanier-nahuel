extends Area2D

export var damage = 20
export var speed = 10

var pos_x	#player position
var pos_y	
var target_x #clicked position
var target_y
var bounce = 1
var travel


func _ready():
	$Timer.start()
	travel = (get_global_mouse_position() - position).normalized()

func _process(delta):
	position += travel*bounce*speed

func _on_Timer_timeout():
	self.queue_free()

func _on_Slash_body_entered(body):
	body.slash_enter(self)
	body._recieve_damage(damage)
