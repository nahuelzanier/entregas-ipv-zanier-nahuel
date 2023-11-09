extends Node2D

func animate_walk():
	$Sprite.hide()
	$AnimatedSprite.show()
	$AnimatedSprite.playing = true

func stop_walk_anim():
	$AnimatedSprite.hide()
	$AnimatedSprite.playing = false
	$Sprite.show()
