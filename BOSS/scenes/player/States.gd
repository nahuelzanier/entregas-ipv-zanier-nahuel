extends Node2D


onready var states = [
	$StateFallen,
	$StateCoconut,
	$StateSurfing,
	$StatePlayer
	]

func lifting_sprites():
	for s in states:
		s.lifting_sprites()
		
func unlifting_sprites():
	for s in states:
		s.unlifting_sprites()
