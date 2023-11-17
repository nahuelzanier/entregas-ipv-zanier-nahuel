extends AudioStreamPlayer

export (AudioStream) var chomp
export (AudioStream) var flame
export (AudioStream) var heart_up
export (AudioStream) var hop
export (AudioStream) var hurt
export (AudioStream) var quake
export (AudioStream) var pick_up

func _ready():
	GlobalAudio.sfx_player = self

func play_sound(sound):
	stream = sound
	play()
