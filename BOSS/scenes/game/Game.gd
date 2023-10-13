extends Node

func _ready():
	var map = $Level/Dungeon01/Room05
	CurrentMap.generate_map(map, map.player_spawn)
