extends "res://scenes/levels/_AbstractLevel.gd"

var tiles = [Tags.fl_beach, Tags.fl_bottomless, Tags.fl_button, Tags.fl_chkr_black, Tags.fl_chkr_red, 
Tags.fl_column, Tags.fl_crumble, Tags.fl_deep_water, Tags.fl_default, Tags.fl_door_left, Tags.fl_door_north,
Tags.fl_door_right, Tags.fl_door_south, Tags.fl_dungeon, Tags.fl_empty, Tags.fl_fountain, Tags.fl_lava, Tags.fl_salt,
Tags.fl_stairs_down, Tags.fl_stairs_up, Tags.fl_stone, Tags.fl_trap_door, Tags.fl_wall_x, Tags.fl_wall_y, Tags.fl_water, 
Tags.fl_whirlpool_ne, Tags.fl_whirlpool_nw, Tags.fl_whirlpool_se, Tags.fl_whirlpool_sw]

func _ready():
	var sx = 100
	var sy = 100
	map_tag_name = "random_map"
	player_spawn = Vector2(sx/2, sy/2)
	map = []
	randomize()
	for y in sy:
		var x_arr = []
		for x in sx:
			if x==0 || y==0 || x==sx-1 || y==sy-1:
				x_arr.append('xxx')
			else:
				var tile = tiles[randi()%(tiles.size())]
				x_arr.append(tile)
		map.append(x_arr)
	var ent_id = 0
	for y in sy:
		for x in sx:
			if x<10 || y<10 || x>sx-10 || y>sy-10:
				pass
			else:
				if randi()%2==0:
					entities[ent_id] = [Tags.et_wisp, x, y]
					ent_id += 1
				
	

func create_static_entities():
	var c_map = CurrentMap.map
	for y in c_map.size():
		for x in c_map[y].size():
			if c_map[y][x].type_tag == Tags.g_wall:
				c_map[y][x].create_detail()
