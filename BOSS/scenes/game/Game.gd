extends Node2D

onready var map_generator = $MapManager/MapGenerator

func _ready():
	var map = $Level/IslandMap
	CurrentMap.generate_map(map)
	
