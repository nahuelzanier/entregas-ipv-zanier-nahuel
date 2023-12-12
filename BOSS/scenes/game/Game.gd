extends Node2D

onready var title_screen = $TitleScreen
onready var game_over_screen = $GameOverScreen

onready var empty_level = $Level/EmptyLevel
onready var start_map = $Level/StartingMenu
onready var game_running = false
onready var game_over = false
onready var instructions = true

func _ready():
	PlayerSingleton.game = self

func _process(delta):
	if Input.is_action_just_pressed("start"):
		if game_over:
			$GameOverTimer.start()
		else:
			if instructions:
				title_screen.hide()
				$Tutorial01.show()
				PlayerSingleton.set_label("INSTRUCTIONS")
				instructions = false
			elif !game_running:
				$Tutorial01.hide()
				CurrentMap.generate_map(empty_level, empty_level.player_spawn)
				$Level.reset_all_maps()
				game_running = true
				title_screen.hide()
				CurrentMap.generate_map(start_map, start_map.player_spawn)
				PlayerSingleton.player.player_fall()

func game_over():
	CurrentMap.call_deferred("generate_map", empty_level, empty_level.player_spawn)
	game_over_screen.show()
	GlobalAudio.bgm_player.play_bgm(GlobalAudio.bgm_player.game_over_bgm, 0.1)
	GlobalAudio.initial_delay = true
	GlobalAudio.previous_bgm = "previous"
	GlobalAudio.ongoing_bgm = "ongoing"
	game_over = true
	

func _on_GameOverTimer_timeout():
	if CurrentMap.first_checkpoint:
		PlayerSingleton.reset_player_hp()
		GlobalAudio.bgm_player.stop()
		game_over_screen.hide()
		game_over = false
		CurrentMap.checkpoint_map()
	else:
		GlobalAudio.bgm_player.stop()
		title_screen.show()
		game_over_screen.hide()
		game_running = false
		game_over = false
		instructions = true
	
func tutorial_01():
	$Tutorial01.visible = !$Tutorial01.visible

func tutorial_02():
	$Tutorial02.visible = !$Tutorial02.visible
