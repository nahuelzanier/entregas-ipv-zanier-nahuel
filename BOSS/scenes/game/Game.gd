extends Node2D

func _ready():
	var map = $Level/Dungeon01
	CurrentMap.generate_map(map, map.player_spawn)
