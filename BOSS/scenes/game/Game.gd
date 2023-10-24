extends Node

func _ready():
	var map = $Level/Dungeon02/Dungeon02_01

	CurrentMap.generate_map(map, map.player_spawn)
