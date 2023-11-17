extends AudioStreamPlayer

export (AudioStream) var waves_sound

func _ready():
	GlobalAudio.ambient_player = self

func play_sound(sound):
	stream = sound
	play()

func ambient_stop():
	stop()
	$WaveTimer.stop()

func play_waves():
	stream = waves_sound
	$WaveTimer.start()

func _on_WaveTimer_timeout():
	play_sound(waves_sound)
	$WaveTimer.start()
