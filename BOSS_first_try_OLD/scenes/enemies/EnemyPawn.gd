extends RigidBody2D

var health = 255
var max_health = 255
export var move_speed = 200
var default_speed = 200
var player_tracker
onready var status_effects = $StatusEffects

func _ready():
	$Graphics/Sprite/ProgressBar.value = health

func _process(delta):
	if self.health <= 0:
		self.queue_free()

func _physics_process(delta):
	var player_track = (Vector2(player_tracker.track_x, player_tracker.track_y)-position)
	self.apply_central_impulse((player_track).normalized()*move_speed)

func _integrate_forces(state):
	self.rotation = 0

func base_floor(iso_x, iso_y):
	pass

func base_floor_exit(iso_x, iso_y):
	pass

func _recieve_damage(damage):
	self.health -= damage
	$Graphics/Sprite/ProgressBar.value -= damage

func explosion(vector2):
	self.apply_central_impulse(vector2)

func slash_enter(slash):
#	slash.bounce = slash.bounce * (-1)
	pass
