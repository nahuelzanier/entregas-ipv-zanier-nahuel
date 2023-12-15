extends Node

export (PackedScene) var lightning_scene 

func manage_attack_in(panel, player_x, player_y, att_manager):
	panel.lightning(att_manager, lightning_scene)
