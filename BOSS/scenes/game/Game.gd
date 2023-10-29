extends Node2D

func _ready():
	var map = $Level/SaltMines01/SaltMines01_01
	
	CurrentMap.generate_map(map, map.player_spawn)
