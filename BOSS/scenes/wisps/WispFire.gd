extends "res://scenes/wisps/WispAbstract.gd"

var move_vector = Vector2.ZERO
var speed = 1.7
onready var ray_cast_2d = $RayCast2D
var last_tile_pos
var player

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_fire_wisp
	$TerrainTimer.start()
	$MoveTimer.start()
	update_tile()
	CurrentMap.map[current_tile].entities.append(self)
	GlobalAudio.sfx_player.play_sound(GlobalAudio.sfx_player.flame)

func _physics_process(delta):
	ray_cast_2d.cast_to = move_vector

func try_to_move():
	if PlayerSingleton.player_exists:
		var dir = position.direction_to(PlayerSingleton.player.feet_position.global_position)
		var dist = position.distance_to(PlayerSingleton.player.feet_position.global_position)+5
		move_vector = dir*dist
		if ray_cast_2d.is_colliding():
			var body = ray_cast_2d.get_collider()
			if body != null && is_exception(body.tag):
				ray_cast_2d.add_exception(body)
			if body != null && body.type_tag == Tags.g_player:
				position += ray_cast_2d.cast_to.normalized() * speed

func move_away_from_each_other():
	pass

func is_exception(tag):
	return (tag == Tags.fl_empty 
		 || tag == Tags.et_flame
		 || tag == Tags.fl_water
		 || tag == Tags.fl_bottomless
		 || tag ==Tags.fl_whirlpool_ne
		 || tag ==Tags.fl_whirlpool_nw
		 || tag ==Tags.fl_whirlpool_se
		 || tag ==Tags.fl_whirlpool_sw)

#func update_tile():
#	current = Global._pos_to_iso(position)
#
#func destroy_self():
#	CurrentMap.map[last_tile_pos].entities.erase(self)
#	self.queue_free()

func _on_MoveTimer_timeout():
	try_to_move()

func _on_TerrainTimer_timeout():
	CurrentMap.map[current_tile].entities.erase(self)
	update_tile()
	CurrentMap.map[current_tile].entities.append(self)
	CurrentMap.map[current_tile].light_on_fire()
	CurrentMap.map[current_tile].fire_wisp_is_on(self)

func _on_WispFire_body_entered(body):
	if body.tag == Tags.et_player:
		player = body
		player.take_damage(global_position.direction_to(player.global_position).normalized())
		$DamagePlayerTimer.start()

func _on_WispFire_body_exited(body):
	if body.tag == Tags.et_player:
		$DamagePlayerTimer.stop()

func _on_DamagePlayerTimer_timeout():
	player.take_damage(global_position.direction_to(player.global_position).normalized())
