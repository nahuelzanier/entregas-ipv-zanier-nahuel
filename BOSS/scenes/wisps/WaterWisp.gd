extends "res://scenes/wisps/WispAbstract.gd"

onready var on_land = false
onready var sprite = $Sprite
onready var last_animation = "dive"

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_water_wisp
	block = Tags.bl_wisp_water
	$MoveTimer.start()
	$TerrainTimer.start()
	update_tile()
	CurrentMap.map[current_tile].entities.append(self)

func try_to_move():
	var iso_pos = Global._pos_to_iso(position)
	var x = iso_pos.x
	var y = iso_pos.y
	var positions = [Vector2(x+1,y), Vector2(x-1,y), Vector2(x,y+1), Vector2(x,y-1)]
	randomize()
	positions.shuffle()
	for pair in positions:
		CurrentMap.map[pair].moving_water_wisp(self)

func _on_MoveTimer_timeout():
	sprite.play("dive")

func _on_TerrainTimer_timeout():
	update_tile()
	CurrentMap.map[current_tile].water_wisp_is_on(self)

func _on_Sprite_animation_finished():
	if last_animation == "dive":
		last_animation = "surface"
		try_to_move()
		sprite.play("surface")
	elif last_animation == "surface":
		last_animation = "dive"
		sprite.play("dive")
		
