extends Node2D
@export var player := CharacterBody2D
@export var launchx := 0
@export var launchy := 0

func launch():
	print('launching')
	player.velocity = Vector2(launchx, launchy * -1)
