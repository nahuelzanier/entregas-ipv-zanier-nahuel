extends Area2D

var iso_x
var iso_y
var highlight_tracker
var quake = false

func _on_FloorPanel_mouse_entered():
	highlight_tracker.track_x = iso_x
	highlight_tracker.track_y = iso_y


func _on_FloorPanel_body_entered(body):
	body.base_floor(iso_x, iso_y)
	

func _on_FloorPanel_body_exited(body):
	body.base_floor_exit(iso_x, iso_y)

#Attacks
func slash(att_manager, player_x, player_y, slash_scene):
	var new_attack = slash_scene.instance()
	IsoToPosition.isoPosition(new_attack, player_x, player_y)
	new_attack.position.x = player_x
	new_attack.position.y = player_y
	new_attack.target_x = iso_x
	new_attack.target_y = iso_y
	att_manager.add_child(new_attack)
	new_attack.show()

func lightning(att_manager, lightning_scene):
	var new_attack = lightning_scene.instance()
	IsoToPosition.isoPosition(new_attack,
				iso_x,
				iso_y)
	att_manager.add_child(new_attack)
	new_attack.show()

func quake(att_manager, quake_scene):
	if not quake:
		var new_attack = quake_scene.instance()
		new_attack.floor_tile = self
		quake = true
		IsoToPosition.isoPosition(new_attack, iso_x-0.25, iso_y-0.25)
		att_manager.add_child(new_attack)
		new_attack.show()
	






