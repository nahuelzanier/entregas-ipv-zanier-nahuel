extends Node

func _ready():
	var map = $Level/Dungeon01/Room02
	CurrentMap.generate_map(map, map.player_spawn)
