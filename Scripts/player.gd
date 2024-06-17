extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("Left", "Right")
	if direction:
		
		if Input.is_action_pressed("Right"):
			position.x += SPEED * delta
			animated_sprite_2d.play("run-right")
		if Input.is_action_pressed("Left"):
			position.x += SPEED * delta * -1
			animated_sprite_2d.play("run-left")

		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			animated_sprite_2d.play("idle")
		

	move_and_slide()
