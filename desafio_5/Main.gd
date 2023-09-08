extends Node

export (PackedScene) var turret_scene
export (PackedScene) var hostage_scene
export var number_of_turrets:int = 5
export var number_of_hostages:int = 5
export var horizontal_screens = 3

func _ready():
	randomize()
	$Player.set_projectile_container(self)
	
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
	for i in number_of_turrets:
		var turret_instance = turret_scene.instance()
		var xpos = rand_range(visible_rect.position.x, visible_rect.end.x*horizontal_screens)
		var ypos = rand_range(visible_rect.position.y, visible_rect.end.y)
		var turret_pos:Vector2 = Vector2(xpos, ypos)
		self.add_child(turret_instance)
		turret_instance.position = turret_pos
		turret_instance.set_values(self)
		
	for i in number_of_hostages:
		var hostage_instance = hostage_scene.instance()
		var xhpos = rand_range(visible_rect.position.x, visible_rect.end.x*horizontal_screens)
		var yhpos = rand_range(visible_rect.position.y, visible_rect.end.y)
		var hostage_pos:Vector2 = Vector2(xhpos, yhpos)
		self.add_child(hostage_instance)
		hostage_instance.position = hostage_pos
