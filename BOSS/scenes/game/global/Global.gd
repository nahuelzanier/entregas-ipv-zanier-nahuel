#SINGLETON

extends Node

var ISO_WIDTH = 32
var ISO_HEIGHT = 16

func move_to_coordinates(node, vector2):
	node.position = _iso_to_pos(vector2)

func _iso_to_pos(vector2):
	return Vector2(vector2.x*ISO_WIDTH/2 - vector2.y*ISO_WIDTH/2, 
				   vector2.x*ISO_HEIGHT/2 + vector2.y*ISO_HEIGHT/2)

func _pos_to_iso(vector2):
	return Vector2( int(vector2.x/ISO_WIDTH + vector2.y/ISO_HEIGHT),
					int(vector2.y/ISO_HEIGHT - vector2.x/ISO_WIDTH) ) 
