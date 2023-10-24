extends "res://scenes/entities/EntityAbstract.gd"


func _ready():
	type_tag = Tags.g_entity
	tag = Tags.et_rock_sin
	block = Tags.bl_rock
	$SinkTimer.start()

func _on_SinkTimer_timeout():
	destroy_self()
