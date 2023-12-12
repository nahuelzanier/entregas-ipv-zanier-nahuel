extends AudioStreamPlayer

export (AudioStream) var player_walk

func _ready():
	GlobalAudio.player_sfx = self


func play_audio(audio):
	stream = audio
	play()
