extends Node

func _ready():
	var map = $Level/Island01/Island02

	CurrentMap.generate_map(map, map.player_spawn)
