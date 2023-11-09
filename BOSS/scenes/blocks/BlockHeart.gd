extends "res://scenes/blocks/BlockAbstract.gd"


func _ready():
	type_tag = Tags.g_entity
	tag = Tags.bl_heart
	unlift = Tags.et_heart
	$ConsumeTimer.start()

func lift(player):
	pass

func _on_ConsumeTimer_timeout():
	PlayerSingleton.player.pop_block()
	PlayerSingleton.increase_max_hearts()
