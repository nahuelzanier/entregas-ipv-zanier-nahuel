extends CanvasLayer

onready var texture_rect = $TextureRect
onready var texture_rect_2 = $TextureRect2
onready var texture_rect_3 = $TextureRect3
onready var texture_rect_4 = $TextureRect4
onready var label = $Label
onready var textures = [texture_rect, texture_rect_2, texture_rect_3, texture_rect_4]
onready var labels = ["RELEASE", "HOLD", "RELEASE", "HOLD"]
onready var index = 0


func _on_TutorialAnimationTimer_timeout():
	textures[index].hide()
	index = (index+1)%4
	textures[index].show()
	label.text = labels[index]
