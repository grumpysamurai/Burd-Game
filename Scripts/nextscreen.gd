extends Area2D
@onready var camera_2d = %Camera2D
@onready var timer = $Timer

var iscameramoving = false
var direction
var targetposition

var hasgamestarted = false

func _ready():
	hasgamestarted = false
	timer.start()

func _on_body_entered(body):
	if iscameramoving == false && hasgamestarted == true:
		if Input.is_action_pressed("Right"):
			body.position.x+=150
			direction = 1
			iscameramoving = true
			targetposition = camera_2d.position.x + 1144
		if Input.is_action_pressed("Left"):
			body.position.x-=150
			direction = -1
			iscameramoving = true
			targetposition = camera_2d.position.x - 1144
	if iscameramoving == true:
		if Input.is_action_pressed("Right"):
			body.position.x-=70
		if Input.is_action_pressed("Left"):
			body.position.x+=70
		
func _process(delta):
	if iscameramoving == true:
		if direction == 1:
			if camera_2d.position.x < targetposition:
				camera_2d.position.x += 1200 * direction * delta
			elif camera_2d.position.x > targetposition:
				camera_2d.position.x = targetposition
				iscameramoving = false
		if direction == -1:
			if camera_2d.position.x > targetposition:
				camera_2d.position.x += 1200 * direction * delta
			elif camera_2d.position.x < targetposition:
				camera_2d.position.x = targetposition
				iscameramoving = false
		


func _on_timer_timeout():
	hasgamestarted = true
