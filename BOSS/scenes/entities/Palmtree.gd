extends "res://scenes/entities/EntityAbstract.gd"

onready var coconut = $Coconut
onready var has_coconut = false

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_palmtree
	block = Tags.bl_palmtree

func destroy_self():
	if has_coconut:
		has_coconut = false
		CurrentMap.map_manager.replace_entity(self, Tags.et_wisp)
	else:
		current_tile.entities.erase(self)
		self.queue_free()

func grow_coconut():
	has_coconut = true
	coconut.show()

func become_possessed(wisp):
	if !has_coconut:
		wisp.destroy_self()
		grow_coconut()
