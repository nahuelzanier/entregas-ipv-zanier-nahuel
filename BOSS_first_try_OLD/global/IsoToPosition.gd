extends Node

#given a node and an isometric coordinate,
#moves the node to that position
func isoPosition(node, iso_x, iso_y):
	node.position.x = (iso_x-iso_y)*128
	node.position.y = (iso_y+iso_x)*64
