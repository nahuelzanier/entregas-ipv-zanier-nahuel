extends AudioStreamPlayer

export (AudioStream) var title_bgm
export (AudioStream) var island_bgm
export (AudioStream) var cave_bgm
export (AudioStream) var side_area
export (AudioStream) var jungle_bgm
export (AudioStream) var canyon_bgm
export (AudioStream) var volcano_bgm
export (AudioStream) var game_over_bgm

onready var bgm_delay = $BGMDelay

func _ready():
	GlobalAudio.bgm_player = self

func play_bgm(bgm, delay):
	bgm_delay.wait_time = delay
	stream = bgm
	$BGMDelay.start()

func _on_BGMDelay_timeout():
	play()
