extends Node

func _ready():
	var map = $Level/Tests/TestMap
	CurrentMap.generate_map(map, map.player_spawn)
