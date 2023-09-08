extends KinematicBody2D

onready var cannon:Sprite = $Cannon

export (float) var speed:float = 200
export (float) var jump_speed:float = -200
export (float) var gravity:float = 2

var projectile_container:Node

var velocity:Vector2 = Vector2.ZERO

func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = direction * speed
	
	var mouse_position:Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
		
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed

	velocity.y += gravity

	move_and_slide(velocity, Vector2(0,-1))
	#position.x += direction * speed * delta
#
#
#
	
#
