extends "res://scenes/levels/_AbstractLevel.gd"

func _ready():
	player_spawn = Vector2(1,8)
	map = [
		['col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col'],
		['wly','cru','def','def','def','def','def','def','def','def','def','cru','wly'],
		['wly','def','emp','emp','emp','emp','emp','emp','emp','emp','lav','def','wly'],
		['wly','def','emp','def','def','def','def','def','def','def','emp','def','wly'],
		['wly','def','emp','def','bea','bea','bea','bea','bea','def','def','def','wly'],
		['wly','def','emp','def','bea','h2o','h2o','h2o','bea','def','btm','def','wly'],
		['wly','def','emp','def','bea','h2o','h2o','h2o','bea','def','btm','def','wly'],
		['wly','def','emp','def','bea','h2o','h2o','h2o','bea','def','btm','def','wly'],
		['wly','def','emp','def','bea','h2o','h2o','h2o','bea','def','btm','def','wly'],
		['wly','def','emp','def','bea','bea','bea','bea','bea','def','btm','def','wly'],
		['wly','def','emp','chr','chb','chr','chb','chr','chb','chr','def','def','wly'],
		['wly','emp','def','emp','emp','emp','emp','emp','emp','emp','def','emp','fou'],
		['wly','def','def','def','def','def','def','def','def','def','def','def','wly'],
		['wly','cru','cru','cru','cru','cru','cru','cru','cru','cru','cru','cru','wly'],
		['wly','cru','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','h2o','cru','wly'],
		['wly','cru','cru','cru','cru','cru','cru','cru','cru','cru','cru','cru','wly'],
		['wly','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','emp','wly'],
		['wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly'],
		['wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly'],
		['wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly'],
		['wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly'],
		['wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly'],
		['wly','emp','emp','lav','lav','lav','lav','lav','lav','emp','emp','emp','wly'],
		['col','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','wlx','col']
		]
