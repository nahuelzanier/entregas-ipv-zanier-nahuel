extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	map_tag_name = "THIS IS FOR TESTING PURPOSES, YOU SHOULDN'T BE HERE"
	player_spawn = Vector2(5,5)
	map = map_designer.get_map()
	entities = map_entity_designer.get_map()

