extends KinematicBody2D

var iso_x
var iso_y
var move_speed = 0
var default_speed = 0
onready var status_effects = $StatusEffects

func _recieve_damage(attack):
	pass

func explosion(vector2):
	pass


#Attacks
func slash(att_manager, player_x, player_y, slash_scene):
	pass
	
func slash_enter(slash):
	slash.bounce = slash.bounce * (-1)

func lightning(att_manager, lightning_scene):
	pass

func quake(panel, att_manager):
	pass
