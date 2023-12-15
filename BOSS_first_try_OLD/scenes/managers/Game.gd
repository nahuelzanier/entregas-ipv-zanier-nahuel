extends Node2D

export (PackedScene) var floor_panel
export (PackedScene) var player
export (PackedScene) var enemy_pawn
export (PackedScene) var box

onready var elements = $Elements
onready var attack_manager = $AttackManager
onready var floor_tiles = $Floor

func _ready():
	attack_manager.attack_layer = $Elements/Attacks
	attack_manager.highlight_tracker = $HighlightTracker
	attack_manager.player_tracker = $PlayerTracker
	
	
	var area = $MapGenerator.generate_area(15,15)
	for y in range(area.size()):
		for x in range(area[y].size()):
			if area[y][x] == 1:
				var new_box = box.instance()
				new_box.iso_x = x
				new_box.iso_y = y
				IsoToPosition.isoPosition(new_box, x, y)
				area[y][x] = new_box
				elements.add_child(new_box)
			else:
				var new_floor_panel = floor_panel.instance()
				IsoToPosition.isoPosition(new_floor_panel, x, y)
				new_floor_panel.iso_x = x
				new_floor_panel.iso_y = y
				new_floor_panel.highlight_tracker = $HighlightTracker
				area[y][x] = new_floor_panel
				floor_tiles.add_child(new_floor_panel)
		attack_manager.area_map = area
	
	area[1][1].queue_free()
	var new_floor_panel = floor_panel.instance()
	IsoToPosition.isoPosition(new_floor_panel, 1, 1)
	new_floor_panel.iso_x = 1
	new_floor_panel.iso_y = 1
	new_floor_panel.highlight_tracker = $HighlightTracker
	area[1][1] = new_floor_panel
	floor_tiles.add_child(new_floor_panel)
	
	var new_player = player.instance()
	new_player.player_tracker = $PlayerTracker
	new_player.attack_manager = attack_manager
	IsoToPosition.isoPosition(new_player, 1, 1)
	elements.add_child(new_player)

	for y in range(3):
		for x in range(7):
			var new_pawn = enemy_pawn.instance()
			IsoToPosition.isoPosition(new_pawn, x+2, y+10)
			new_pawn.player_tracker = $PlayerTracker
			elements.add_child(new_pawn)


func _process(delta):
	if Input.is_action_just_pressed("next_spell"):
		attack_manager.slot_in_lightning()
	if Input.is_action_just_pressed("prev_spell"):
		attack_manager.slot_in_quake()
	if Input.is_action_just_pressed("third_spell"):
		attack_manager.slot_in_slash()
