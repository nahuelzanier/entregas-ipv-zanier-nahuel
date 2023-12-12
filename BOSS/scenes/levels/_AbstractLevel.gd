extends Node2D

export var map_tag_name:String
export var player_spawn = Vector2(2,7)
onready var map = {}
onready var entities = {}
onready var triggers = {}
onready var bgm
onready var bg

func create_entities():
	for k in entities.keys():
		if entities[k] != Tags.et_sign:
			CurrentMap.map_manager.create_entity(entities[k], k)

func is_checkpoint():
	return false

func update_maps():pass

func trigger_level_locations(iso_position, tag):
	if tag == self.map_tag_name:
		CurrentMap.call_deferred(triggers[iso_position][0], triggers[iso_position][1], triggers[iso_position][2])

func start_audio():
	play_bgm()
	play_ambient()
	
func play_bgm():pass
func play_ambient():pass
