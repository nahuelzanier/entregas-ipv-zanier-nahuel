extends YSort


onready var single_tile = $AttackHighlights/SingleTile
onready var plus_shape = $AttackHighlights/PlusShape
onready var three_by_three = $AttackHighlights/ThreeByThree

var attack_highlight

func _ready():
	attack_highlight = single_tile
	attack_highlight.show()

func move_highlight(in_x, in_y):
	IsoToPosition.isoPosition(attack_highlight, in_x, in_y)

func set_single_hlight():
	attack_highlight.hide()
	attack_highlight = single_tile
	attack_highlight.show()

func set_plus_shape_hlight():
	attack_highlight.hide()
	attack_highlight = plus_shape
	attack_highlight.show()
	
func set_three_by_three_hlight():
	attack_highlight.hide()
	attack_highlight = three_by_three
	attack_highlight.show()
