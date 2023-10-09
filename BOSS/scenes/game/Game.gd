extends Node2D

onready var map_generator = $MapManager/MapGenerator

func _ready():
	var map = $Level/Dungeon01
	CurrentMap.generate_map(map)
	
