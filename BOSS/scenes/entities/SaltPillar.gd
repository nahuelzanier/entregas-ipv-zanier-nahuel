extends "res://scenes/entities/EntityAbstract.gd"

onready var current_size
onready var size = [$SpriteSmall, $Sprite, $SpritePillar]

func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_salt_pillar
	block = Tags.bl_salt

func get_lifted(player):pass

func reduce_size():
	if current_size > 0:
		size[current_size].visible = false
		current_size -= 1
		size[current_size].visible = true
	elif current_size == 0:
		destroy_self()
		
func increase_size():
	if current_size < 2:
		size[current_size].visible = false
		current_size += 1
		size[current_size].visible = true

func water_wisp_effect():
	reduce_size()

func set_size(value:int):
	if value >= 0 || value <= 2:
		size[current_size].visible = false
		current_size = value
		size[current_size].visible = true
		
