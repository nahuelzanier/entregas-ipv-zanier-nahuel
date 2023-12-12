extends "res://scenes/floor/FloorAbstract.gd"

onready var active = false

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_button
	lift_block = Tags.bl_button
	highlight()

func crumbling_tile_active():
	respawn_crumbling_tile = true

func button_activation_effect():
	CurrentMap.map[iso_pos + Vector2( 1,0)].button_active_effect(self)
	CurrentMap.map[iso_pos + Vector2(-1,0)].button_active_effect(self)
	CurrentMap.map[iso_pos + Vector2(0, 1)].button_active_effect(self)
	CurrentMap.map[iso_pos + Vector2(0,-1)].button_active_effect(self)
	CurrentMap.map[iso_pos + Vector2(1, 1)].button_active_effect(self)
	CurrentMap.map[iso_pos + Vector2(1,-1)].button_active_effect(self)
	CurrentMap.map[iso_pos + Vector2(-1,1)].button_active_effect(self)
	CurrentMap.map[iso_pos + Vector2(-1,-1)].button_active_effect(self)

func button_deactivation_effect():
	if proper_map_is_active():
		CurrentMap.map[iso_pos + Vector2( 1,0)].button_inactive_effect(self)
		CurrentMap.map[iso_pos + Vector2(-1,0)].button_inactive_effect(self)
		CurrentMap.map[iso_pos + Vector2(0, 1)].button_inactive_effect(self)
		CurrentMap.map[iso_pos + Vector2(0,-1)].button_inactive_effect(self)
		CurrentMap.map[iso_pos + Vector2(1, 1)].button_inactive_effect(self)
		CurrentMap.map[iso_pos + Vector2(1,-1)].button_inactive_effect(self)
		CurrentMap.map[iso_pos + Vector2(-1,1)].button_inactive_effect(self)
		CurrentMap.map[iso_pos + Vector2(-1,-1)].button_inactive_effect(self)

#ENTITIES
func unlift_rock():
	return entities.size() < 1

func button_active():
	active = true
	$Sprite.visible = false
	button_activation_effect()
	$ButtonPressed.visible = true

func button_inactive():
	active = false
	$ButtonPressed.visible = false
	button_deactivation_effect()
	$Sprite.visible = true

func _on_Area2D_body_entered(body):
	button_active()

func _on_Area2D_body_exited(body):
	button_inactive()

func wand(wand):pass

func highlight():
	if CurrentMap.level_node.active_level.map_tag_name == "TUTORIAL - 2":
		$Sprite.play("highlight")
		$ButtonPressed.play("highlight")
