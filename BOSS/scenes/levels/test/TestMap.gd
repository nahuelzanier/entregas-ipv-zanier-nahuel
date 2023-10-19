extends "res://scenes/levels/_AbstractLevel.gd"
onready var map_designer = $MapDesigner
onready var map_entity_designer = $MapEntityDesigner

func _ready():
	player_spawn = Vector2(5,5)
	map = [
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxx','wly','cru','def','def','def','def','def','def','def','def','def','cru','wly','xxx'],
		['xxx','wly','def','emp','emp','emp','emp','emp','emp','emp','emp','lav','def','wly','xxx'],
		['xxx','wly','def','emp','def','def','def','def','def','def','def','emp','def','wly','xxx'],
		['xxx','wly','def','emp','def','bea','bea','bea','bea','bea','def','def','def','wly','xxx'],
		['xxx','wly','def','emp','def','bea','h2o','h2o','h2o','bea','def','btm','def','wly','xxx'],
		['xxx','wly','def','emp','def','bea','h2o','h2o','h2o','bea','def','btm','def','wly','xxx'],
		['xxx','wly','def','emp','def','bea','h2o','h2o','h2o','bea','def','btm','def','wly','xxx'],
		['xxx','wly','def','emp','def','bea','h2o','h2o','h2o','bea','def','btm','def','wly','xxx'],
		['xxx','wly','def','emp','def','bea','bea','bea','bea','bea','def','btm','def','wly','xxx'],
		['xxx','wly','def','emp','chr','chb','chr','chb','chr','chb','chr','def','def','wly','xxx'],
		['xxx','wly','def','def','emp','emp','emp','emp','emp','emp','emp','def','def','fou','xxx'],
		['xxx','wly','def','def','def','def','def','def','def','def','def','def','def','wly','xxx'],
		['xxx','wly','cru','cru','cru','cru','cru','cru','cru','cru','cru','cru','cru','wly','xxx'],
		['xxx','wly','cru','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','cru','wly','xxx'],
		['xxx','wly','cru','cru','cru','cru','cru','cru','cru','cru','cru','cru','cru','wly','xxx'],
		['xxx','wly','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','wly','xxx'],
		['xxx','wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly','xxx'],
		['xxx','wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly','xxx'],
		['xxx','wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly','xxx'],
		['xxx','wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly','xxx'],
		['xxx','wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly','xxx'],
		['xxx','wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly','xxx'],
		['xxx','col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col','xxx'],
		['xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx']
	]
	
	map_dict = map_designer.get_map()
	entities = map_entity_designer.get_map()

func create_entities():
	for k in entities.keys():
		CurrentMap.map_manager.create_entity(entities[k], k)
