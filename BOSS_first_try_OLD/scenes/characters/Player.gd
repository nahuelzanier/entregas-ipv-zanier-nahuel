extends RigidBody2D

var health = 100
export var move_speed = 600
var default_speed = 600
var player_tracker
var attack_manager
var movement_direction
var mouse_position
onready var status_effects = $StatusEffects

func _ready():
	movement_direction = Vector2(0, 0)
	mouse_position = position

func _process(delta):
	player_tracker.track_x = self.position.x
	player_tracker.track_y = self.position.y
	if self.health <= 0:
		self.queue_free()

func _physics_process(delta):
	if Input.is_action_just_pressed("action01"):
		self.mouse_position = get_global_mouse_position()
	if position.distance_to(mouse_position) > 4:
		self.apply_central_impulse((mouse_position-position).normalized()*move_speed)
	if Input.is_action_just_pressed("action02"):
		attack_manager.cast_player_attack()
		
func _integrate_forces(state):
	self.rotation = 0
	
func base_floor(iso_x, iso_y):
	player_tracker.entered_iso_x = iso_x
	player_tracker.entered_iso_y = iso_y	
	
func base_floor_exit(iso_x, iso_y):
	player_tracker.iso_x = player_tracker.entered_iso_x
	player_tracker.iso_y = player_tracker.entered_iso_y
	
func slash_enter(slash):
	pass
	
func _recieve_damage(attack):
	pass

func explosion(vector2):
	pass
