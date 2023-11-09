extends Node2D

onready var active_level = $EmptyLevel

onready var map_array = [
	$EmptyLevel, 
	$StartingMenu,
	$Dungeon01/Room01,
	$Dungeon01/Room02,
	$Dungeon01/Room03,
	$Dungeon01/Room04,
	$Dungeon01/Room05,
	$SideAreas01/SideCave01,
	$Island01/Island01,
	$Island01/Island02,
	$Island01/Island03,
	$Island01/Jungle01,
	$Island01/Jungle02,
	$Island01/Jungle03,
	$Furnace01/Furnace01,
	$Dungeon02/Dungeon02_01,
	$Dungeon02/Dungeon02_02,
	$Volcano01/Volcano01_01,
	$SaltMines01/SaltMines01_01,
	$SaltMines01/SaltMinesDark01,
	$SaltMines01/SaltMines01_02,
	$SaltMines01/SaltMinesDark02,
	$SaltMines01/SaltMines01_03,
	$SaltMines01/SaltMines01_04,
	$SaltMines01/SaltMines01_05,
	$Canyon01/Canyon01_01,
	$Canyon01/Canyon01_02,
	$Canyon01/Canyon01_03,
	$Extras/Checkers01,
	$TestMaps/TestMap
]

func _ready():
	CurrentMap.level_node = self

func reset_all_maps():
	for m in map_array:
		m._ready()
