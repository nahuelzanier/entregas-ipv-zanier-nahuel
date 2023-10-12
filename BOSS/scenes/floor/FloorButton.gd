extends "res://scenes/floor/FloorAbstract.gd"

func _ready():
	type_tag = Tags.g_tile
	tag = Tags.fl_button
	lift_block = Tags.bl_button

func crumbling_tile_active():
	respawn_crumbling_tile = true

func button_activation_effect():
	CurrentMap.map[iso_y][iso_x + 1].button_active_effect(self)
	CurrentMap.map[iso_y][iso_x - 1].button_active_effect(self)
	CurrentMap.map[iso_y + 1][iso_x].button_active_effect(self)
	CurrentMap.map[iso_y - 1][iso_x].button_active_effect(self)
	CurrentMap.map[iso_y + 1][iso_x + 1].button_active_effect(self)
	CurrentMap.map[iso_y + 1][iso_x - 1].button_active_effect(self)
	CurrentMap.map[iso_y - 1][iso_x + 1].button_active_effect(self)
	CurrentMap.map[iso_y - 1][iso_x - 1].button_active_effect(self)

func button_deactivation_effect():
	CurrentMap.map[iso_y][iso_x + 1].button_inactive_effect(self)
	CurrentMap.map[iso_y][iso_x - 1].button_inactive_effect(self)
	CurrentMap.map[iso_y + 1][iso_x].button_inactive_effect(self)
	CurrentMap.map[iso_y - 1][iso_x].button_inactive_effect(self)
	CurrentMap.map[iso_y + 1][iso_x + 1].button_inactive_effect(self)
	CurrentMap.map[iso_y + 1][iso_x - 1].button_inactive_effect(self)
	CurrentMap.map[iso_y - 1][iso_x + 1].button_inactive_effect(self)
	CurrentMap.map[iso_y - 1][iso_x - 1].button_inactive_effect(self)

#ENTITIES
func unlift_rock():
	return entities.size() < 1

func button_active():
	$Sprite.visible = false
	button_activation_effect()
	$ButtonPressed.visible = true

func button_inactive():
	$ButtonPressed.visible = false
	button_deactivation_effect()
	$Sprite.visible = true

func _on_Area2D_body_entered(body):
	button_active()

func _on_Area2D_body_exited(body):
	button_inactive()
