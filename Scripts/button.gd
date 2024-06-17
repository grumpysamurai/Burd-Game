extends Node2D

@export var door := AnimationPlayer.new()
var isopen = false
func raisedoor():
	if isopen == false:
		door.play("Raise")
		isopen = true
