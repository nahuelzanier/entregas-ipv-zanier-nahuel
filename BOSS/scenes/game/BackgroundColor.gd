extends ParallaxBackground

onready var deep_blue = $DeepBlue
onready var black = $Black
onready var gray = $Gray
onready var red = $Red
onready var green = $Green

onready var bg_dict = {}
onready var current_bg = $DeepBlue

func _ready():	
	CurrentMap.backgrounds = self
	bg_dict["deep_blue"] = deep_blue
	bg_dict["black"] = black
	bg_dict["gray"] = gray
	bg_dict["red"] = red
	bg_dict["green"] = green

func apply_bg(name):
	current_bg.hide()
	current_bg = bg_dict[name]
	current_bg.show()
	
