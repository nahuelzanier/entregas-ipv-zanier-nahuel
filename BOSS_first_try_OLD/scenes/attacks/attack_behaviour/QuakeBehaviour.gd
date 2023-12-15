extends Node

export (PackedScene) var quake_scene 

func manage_attack_in(panel, player_x, player_y, att_manager):
	panel.quake(att_manager, quake_scene)
