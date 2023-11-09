extends CanvasLayer

func _on_HideTimer_timeout():
	hide()
	Global.move_to_coordinates(PlayerSingleton.player, CurrentMap.player_spawn)
	PlayerSingleton.player.player_fall()
	
func time_lapse_effect():
	show()
	PlayerSingleton.player.stop_surfing_ingore_palmtree()
	$HideTimer.start()

