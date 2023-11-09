extends ColorRect

export (PackedScene) var full_heart
export (PackedScene) var empty_heart
export (PackedScene) var ui_hearts_pack
onready var label = $Label
onready var ui_hearts = $UIHearts

onready var start_off = 7
onready var offset = 18

func _ready():
	PlayerSingleton.topUI = self

func update_hearts(full:int, empty:int):
	ui_hearts.queue_free()
	var new_ui_heart = ui_hearts_pack.instance()
	ui_hearts = new_ui_heart
	add_child(new_ui_heart)
	var i = 0
	for f in full:
		var heart = full_heart.instance()
		heart.position.x += offset*i + start_off
		new_ui_heart.add_child(heart)
		i += 1
	for e in empty:
		var heart = empty_heart.instance()
		heart.position.x += offset*i + start_off
		new_ui_heart.add_child(heart)
		i += 1
		
func set_label(text:String):
	label.text = text
