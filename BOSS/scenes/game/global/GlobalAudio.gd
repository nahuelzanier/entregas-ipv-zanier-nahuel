extends Node

onready var bgm_player
onready var ambient_player
onready var sfx_player

onready var initial_delay = true

onready var wave_sfx = "waves_sfx"

onready var previous_bgm = "previous"
onready var ongoing_bgm = "ongoing"

onready var island_bgm = "island bgm"
onready var cave_bgm = "cave_bgm"
onready var side_bgm = "side_bgm"
onready var jungle_bgm = "jungle_bgm"
onready var canyon_bgm = "canyon_bgm"
onready var volcano_bgm = "volcano_bgm"

func update_bgm(bgm_name):
	previous_bgm = ongoing_bgm
	ongoing_bgm = bgm_name
