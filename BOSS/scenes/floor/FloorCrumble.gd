extends "res://scenes/floor/FloorAbstract.gd"

export (PackedScene) var falling_tile_effect

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_crumble

func get_lifted(player):
	pass

func _on_Area2D_body_entered(body):
	$CrumbleTimer.start()

func _on_Area2D_body_exited(body):
	call_deferred("fall")

func fall():
	var falling_tile = falling_tile_effect.instance()
	var crum_pos = iso_pos
	CurrentMap.map_manager.replace(Tags.fl_bottomless, crum_pos)
	var tile = CurrentMap.map[crum_pos]
	tile.falling_element.add_child(falling_tile)
	tile.current_falling_effects.append(falling_tile)
	CurrentMap.map[iso_pos].crumbling_tile_active()
	
	

#ENTITIES
func unlift_rock():
	return entities.size() < 1


func _on_CrumbleTimer_timeout():
	call_deferred("fall")
