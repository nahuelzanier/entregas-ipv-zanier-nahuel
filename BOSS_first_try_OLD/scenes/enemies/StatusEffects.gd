extends Node2D

var quake = 0

func no_quake():
	return quake == 0

func add_quake():
	quake += 1

func remove_quake():
	quake -= 1
