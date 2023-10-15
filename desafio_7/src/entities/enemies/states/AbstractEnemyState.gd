extends AbstractState
class_name AbstractEnemyState

func handle_event(event:String, value=null) -> void:
	match event:
		"body_entered":
			_handle_body_entered(value) 
		"body_exited":
			_handle_body_exited(value)

func _handle_body_entered(body:Node) -> void:
	if character.target == null && !character.dead:
		character.target = body
		
func _handle_body_exited(body) -> void:
	if body == character.target && !character.dead:
		character.target = null
