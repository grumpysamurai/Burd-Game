extends Node2D
@onready var timer = $Timer
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var door := AnimationPlayer.new()
var isopen = false
func raisedoor():
	if isopen == false:
		door.play("Raise")
		isopen = true
		timer.start()

	

func _on_timer_timeout():
	isopen = true
	animated_sprite_2d.play("notpressed")
	door.play("Close")
	isopen = false
