extends Node2D

var highlight_tracker

var player_attack_behaviour
var player_tracker

var attack_layer

var attack_highlight
var area_map

func _ready():
	player_attack_behaviour = $AttackBehaviours/SlashBehaviour

func _process(delta):
	attack_layer.move_highlight(highlight_tracker.track_x, highlight_tracker.track_y)

func cast_player_attack():
	var aoe = attack_layer.attack_highlight.area_of_effect_array
	for y in range(aoe.size()):
		for x in range(aoe[y].size()):
			if aoe[y][x]:
				var x_pos = highlight_tracker.track_y+y-aoe.size()/2
				var y_pos = highlight_tracker.track_x+x-aoe[y].size()/2
				player_attack_behaviour.manage_attack_in(
					 area_map[x_pos][y_pos],
					 player_tracker.track_x,
					 player_tracker.track_y,
					 attack_layer)

func slot_in_slash():
	player_attack_behaviour = $AttackBehaviours/SlashBehaviour
	attack_highlight = attack_layer.set_single_hlight()

func slot_in_lightning():
	player_attack_behaviour = $AttackBehaviours/LightningBehaviour
	attack_highlight = attack_layer.set_plus_shape_hlight()

func slot_in_quake():
	player_attack_behaviour = $AttackBehaviours/QuakeBehaviour
	attack_highlight = attack_layer.set_three_by_three_hlight()
