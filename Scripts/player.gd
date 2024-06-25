extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isdead = false
@onready var death_timer = $DeathTimer
@onready var collision_shape_2d = $CollisionShape2D
@onready var deathtimer_2 = $DeathTimer2

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if isdead == false:
		# Add the gravity.

		

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

func death():
	if isdead == false:
		Engine.time_scale = 0.5
		isdead = true
		animated_sprite_2d.play("death")
		death_timer.start()


func _on_death_timer_timeout():
	Engine.time_scale = 1
	collision_shape_2d.queue_free()
	deathtimer_2.start()
func _on_death_timer_2_timeout():
	get_tree().reload_current_scene()
