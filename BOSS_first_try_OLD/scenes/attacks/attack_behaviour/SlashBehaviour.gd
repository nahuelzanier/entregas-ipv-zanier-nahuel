extends Node2D

export (PackedScene) var slash_scene

func manage_attack_in(panel, player_x, player_y, att_manager):
	panel.slash(att_manager, player_x, player_y, slash_scene)
