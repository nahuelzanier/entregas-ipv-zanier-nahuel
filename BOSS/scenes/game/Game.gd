extends Node2D

onready var title_screen = $TitleScreen
onready var game_over_screen = $GameOverScreen

onready var start_map = $Level/StartingMenu
onready var game_running = false
onready var game_over = false

func _ready():
	PlayerSingleton.game = self

func _process(delta):
	if Input.is_action_just_pressed("start"):
		if game_over:
			$GameOverTimer.start()
		else:
			if !game_running:
				$Level.reset_all_maps()
				game_running = true
				title_screen.hide()
				CurrentMap.generate_map(start_map, start_map.player_spawn)

func game_over():
	game_over = true
	game_over_screen.show()

func _on_GameOverTimer_timeout():
	title_screen.show()
	game_over_screen.hide()
	game_running = false
	game_over = false
	
