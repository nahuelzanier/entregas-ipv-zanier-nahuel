extends AbstractEnemyState


func enter():
	character.velocity = Vector2.ZERO
	fire()

func fire():
	character._fire()
	character._pllay_animation("attack")

func update(delta):
	character._look_at_target()	

func _on_animation_finished(anim_name):
	if character.target ==  null:
		emit_signal("finished", "idle")
	else:
		match anim_name:
			"attack":
				character._play_animation("alert")
			"alert":
				if character._can_see_target():
					fire()
				else:
					emit_signal("finished", "idle")


func _handle_body_exited(body):
	._handle_body_exited(body)
	if character.target ==  null:
		if character.get_current_animation() != "attack":
			emit_signal("finished", "idle")
