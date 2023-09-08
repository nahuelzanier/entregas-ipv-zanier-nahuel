extends Node

export (PackedScene) var Turret

func initialize(player):
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
	for i in 3:
		var turret_instance = Turret.instance()
		var turret_pos:Vector2 = Vector2(rand_range(visible_rect.position.x, visible_rect.end.x), rand_range(visible_rect.position.y, visible_rect.end.y))
		turret_instance.initiialize(self, turret_pos, player, self)
