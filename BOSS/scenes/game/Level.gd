extends Node2D

onready var active_level = $EmptyLevel

func _ready():
	CurrentMap.level_node = self
