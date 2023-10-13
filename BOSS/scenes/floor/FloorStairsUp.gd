extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_wall
	tag = Tags.fl_stairs_up
	lift_block = Tags.bl_empty
	create_detail()

func _process(delta): pass

func get_lifted(player):
	player.unlift_entity(player.block_tag())

func get_lifted_with_entity(player):
	entities[0].get_lifted(player)

func create_detail():
	CurrentMap.map_manager.create_entity(Tags.et_stairs_up, iso_x, iso_y)

#PLAYER
func unlift_rock():
	return true

func unlift_wisp(player):pass


func _on_Trigger_body_entered(body):
	if body.tag == Tags.et_player:
		CurrentMap.trigger_level_locations(Vector2(iso_x, iso_y), map_tag)

func flip():
	$Sprite.flip_h = !$Sprite.flip_h
