extends "res://scenes/wisps/WispAbstract.gd"

var move_vector = Vector2.ZERO
var speed = 1.5
onready var ray_cast_2d = $RayCast2D

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_fire_wisp
	$TerrainTimer.start()
	$MoveTimer.start()
	update_tile()
	current_tile.entities.append(self)

func _physics_process(delta):
	ray_cast_2d.cast_to = move_vector

func try_to_move():
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
		 || tag ==Tags.fl_whirlpool_ne
		 || tag ==Tags.fl_whirlpool_nw
		 || tag ==Tags.fl_whirlpool_se
		 || tag ==Tags.fl_whirlpool_sw)

func _on_MoveTimer_timeout():
	try_to_move()

func _on_TerrainTimer_timeout():
	call_deferred("terrain_timer_func")

func terrain_timer_func():
	update_tile()
	current_tile.entities.erase(self)
	current_tile.light_on_fire()
	current_tile.fire_wisp_is_on(self)
