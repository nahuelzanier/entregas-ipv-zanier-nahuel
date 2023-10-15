extends AbstractState

func enter():
	character._play_animation("dead")
	character.dead = true
	character.collision_layer = 0
	character.collision_mask = 0
	
	if character.target != null:
		character._play_animation("die_alert")
	else:
		character._play_animation("die")

func _on_animation_finished(anim_name):
	if anim_name in ["die_alert", "die"]:
		character._remove()
