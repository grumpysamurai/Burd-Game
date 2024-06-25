extends Node2D
@export var player := CharacterBody2D
@export var launchx := 0
@export var launchy := 0
@onready var timer = $Timer
@export var delay = 0.3

func launch():
	timer.start()
	timer.wait_time = delay

func _on_timer_timeout():
	player.velocity = Vector2(launchx, launchy * -1)
