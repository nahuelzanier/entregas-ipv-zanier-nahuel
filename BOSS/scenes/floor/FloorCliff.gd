extends "res://scenes/floor/FloorAbstract.gd"
onready var kinematic_body_2d = $KinematicBody2D

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_cliff
	lift_block = Tags.bl_empty
	kinematic_body_2d.tag = tag

func _process(delta): pass

func get_lifted(player): pass

func get_lifted_with_entity(player): pass
